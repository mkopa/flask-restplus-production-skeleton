from gunicorn.app.base import BaseApplication


class GunicornApp(BaseApplication):
    """Convert a Flask application to a Gunicorn one.
    """

    def __init__(self, flask_app, settings=None):
        """Initialize GunicornApp.
        """
        self.flask_app = flask_app
        self.settings = settings or {}
        super().__init__()

    def load_config(self):
        """Update application configuration with given parameters.
        """
        for k, v in self.settings.items():
            self.cfg.set(k, v)

    def load(self):
        return self.flask_app
