from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from shop.models import Product
from .cart import Cart
from .forms import CartAddProductForm

# when you get to use HttpResponse, 
# you're sending the context dictionary 
# with the url so that's rendered as a typical website 
# but if you use HttpResponseRedirect, you get to send only url

# Create your views here.
@require_POST
def cart_add(request, product_id):
    print("receive request to add")
    cart= Cart(request)
    product = get_object_or_404(Product, id=product_id)
    print("product")
    print(product)
    form = CartAddProductForm(request.POST)

    if form.is_valid():
        print("valid form")
        cd = form.cleaned_data 
        cart.add(product=product,
                quantity=cd['quantity'],
                override_quantity=cd['override'])
    return redirect('cart:cart_detail')

@require_POST
def cart_remove(request, product_id):
    cart= Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:cart_detail')

def cart_detail(request):
    cart = Cart(request)
    cart_product_form = CartAddProductForm()
    print("cart_detail")
    print(cart_product_form)
    print(cart)
    return render(request, 'cart/detail.html', {'cart':cart, 'cart_product_form': cart_product_form})