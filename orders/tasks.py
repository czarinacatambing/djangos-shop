from celery import task
from django.core.mail import send_mail
from .models import Order

# task decorator defines task
@task
def order_created(order_id):
    """
    Task to send email notification when order is created
    """
    order = Order.objects.get(id=order_id)
    subject = f'Order nr. {order.id}'
    message = f'Dear {order.first_name},\n\n You have successfully placed an order. Your order ID is {order.id}.'
    mail_sent = send_mail(subject, message, 'admin@myshop.com', 
                            [order.email])
    return mail_sent