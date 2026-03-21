from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def health_check(request):
    return Response({
        "service": "auth-service",
        "status": "healthy",
        "container": "local" # We will change this when we move to Docker!
    })
