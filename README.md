Rails authorization with Devise, devise_invitable and CanCan
============================================================

This is a demo of a role-based blog implemented with [Rails](https://github.com/rails/rails), [Devise](https://github.com/plataformatec/devise),
[devise_invitable](https://github.com/scambra/devise_invitable) and [CanCan](https://github.com/ryanb/cancan).

The blog is consisted of Article and Comment resources. There are three types of users: User, Author and Admin. Admin can manage all resources and can also invite Authors. Authors can create new Articles and manage those they have written. Signed in User can leave Comments. Guest users can only read blog.

There is only one Admin which is seeded. Authors can only be invited by Admin. Users can register, but their registration must be first confirmed via email.
