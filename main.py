import os
import sys
import logging
from pathlib import Path

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import Signal

from qml_hot_reloader.qml_hot_reloader import QmlHotReload


def setup_material_theme():
    material_env = {
        'QT_QUICK_CONTROLS_STYLE': 'Material',
        'QT_QUICK_CONTROLS_MATERIAL_THEME': 'Dark',
        'QT_QUICK_CONTROLS_MATERIAL_VARIANT': 'Normal',
        'QT_QUICK_CONTROLS_MATERIAL_ACCENT': 'DeepOrange'
    }
    [os.environ.update({k: v}) for k, v in material_env.items()]


class App(QGuiApplication):
    ENTRYPOINT = 'main.qml'
    BASE_DIR = Path(__file__).parent

    onStart = Signal()
    onStop = Signal()

    def __init__(self, argv: list):
        super().__init__(argv)
        self.engine = QQmlApplicationEngine()

    def engine_load(self):
        path = self.BASE_DIR.joinpath(self.ENTRYPOINT)
        self.engine.load(path.as_posix())
        if not self.engine.rootObjects():
            print(f'Engine not have root objects. \n'
                  f'{path.as_posix()} (exists: {path.exists()})')
            sys.exit(-1)

    def exec(self):
        try:
            self.onStart.emit()
            self.engine_load()
            status = self.exec_()
        finally:
            self.onStop.emit()
        return status or -1


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)

    setup_material_theme()
    app = App(sys.argv)

    qml_hot_reload = QmlHotReload(path=app.BASE_DIR, engine=app.engine, parent=app)
    app.onStart.connect(qml_hot_reload.on_start)
    app.onStop.connect(qml_hot_reload.on_stop)
    app.engine.rootContext().setContextProperty('qmlHotReload', qml_hot_reload)

    sys.exit(app.exec())
