from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def health_check(request):
    return Response({
        "service": "notification-service",
        "status": "healthy",
        "queue_status": "empty", # In DevOps, these services use "Queues" (like RabbitMQ)
        "container": "local"
    })
