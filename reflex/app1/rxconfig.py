import reflex as rx

config = rx.Config(
    app_name="app1",
    frontend_port=8010,
    backend_port=8020,
    plugins=[
        rx.plugins.SitemapPlugin(),
        rx.plugins.TailwindV4Plugin(),
    ]
)