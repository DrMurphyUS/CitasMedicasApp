import flet as ft
import sys, os

def main(page: ft.Page):    
    page.title = "Hospital Regional III Honorio Delgado"
    page.window_width = 450
    page.window_height = 450
    page.window_resizable = False    
    page.bgcolor = ft.Colors.WHITE70
    page.vertical_alignment = "center"
    page.horizontal_alignment = "center"
    page.reiniciar_app = lambda: os.execl(sys.executable, sys.executable, *sys.argv)    

    from views.iniciosesion import login_view
    login_view(page)

ft.app(target=main)

### flet run app.py
### flet run --web app.py
### flet run --android app.py

### DATA DE PRUEBA
### Data para pasar de frente al Dashboard (Evitar el login para visualizar más rápido) va después de login_view(page):
### from views.dashboard import dashboard_view
### from models.pacientes import Paciente    
### usuario = Paciente(2,"Irwins Warrens Chahua Huamani","irwins.chahuah@gmail.com","998654321","DNI","12345676","kdsjfkbweiwec","paciente",1,"2025-06-04 20:15:16",4,"O-","Esta es una prueba.")    
### dashboard_view(page, usuario)