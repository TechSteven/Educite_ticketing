from django.contrib import admin
from django.urls import path
from core.views import health_check # Import the view we just wrote

urlpatterns = [
    path('admin/', admin.site.urls),
    path('health/', health_check), # Register the route
]