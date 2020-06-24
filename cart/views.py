from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from shop.models import Product
from .cart import Cart
from .forms import CartAddProductForm


@require_POST
def cart_add(request, product_id):
    print("cart:views:cart_add")
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    print("cart_add")
    print(cart)
    if form.is_valid():
        cd = form.cleaned_data
        print(cd)
        cart.add(product=product,
                 quantity=cd['quantity'],
                 override_quantity=cd['override'])
        print("done cart_add")
        print(cart)
    return redirect('cart:cart_detail')


@require_POST
def cart_remove(request, product_id):
    print("cart:views:cart_remove")
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:cart_detail')


def cart_detail(request):
    print("cart:views:cart_detail")
    cart = Cart(request)
    print(cart.__iter__)
    print(dir(cart))
    print(vars(cart))
    print(cart.__dict__)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'],
                                                                   'override': True})
    return render(request, 'cart/detail.html', {'cart': cart})
