from PySide2.QtCore import Signal, Slot, QObject
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
import logging


class QmlHotReload(QObject):
    logger = logging.getLogger('QmlHotReload')
    eventUpdate = Signal(str)

    def __init__(self, path, engine, parent=None):
        super(QmlHotReload, self).__init__(parent)
        self.patterns = ['*.qml']
        self.path = path
        self.engine = engine

        self.observer = Observer()
        self.event_handler = PatternMatchingEventHandler(
            patterns=self.patterns,
            ignore_patterns=[],
            ignore_directories=True,
            case_sensitive=False
        )
        self.event_handler.on_any_event = self.event_callback

    @Slot()
    def clear_cache(self):
        """ call from QML """
        self.engine.clearComponentCache()
        self.logger.debug('Clear component cache')

    def event_callback(self, event):
        path = event.src_path
        self.logger.info(f'Detect changes: {path}')
        self.eventUpdate.emit(path)

    def on_start(self):
        self.observer.schedule(self.event_handler, path=self.path, recursive=True)
        self.observer.start()
        self.logger.info(f'Set Observer: {self.path}')

    def on_stop(self):
        self.observer.stop()
        self.observer.join(1.0)
        self.logger.info('Remove observer')
