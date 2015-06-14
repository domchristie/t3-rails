# t3-rails

Easily set up the [T3 JavaScript framework](http://t3js.org/) within your Rails 4+ application.

This gem includes the T3 assets (including the T3 testing bundle), along with generators for setting up application structure and for creating modules, services, and behaviors.

**Note**: this gem is currently in development and as such has not been thoroughly tested in the wild. Testing and improvements (particularly regarding older versions of Ruby/Rails) are welcome!

## Getting Started

Add the gem to your application Gemfile:

```ruby
gem 't3-rails'
```

Run `bundle install`, then generate the application structure:

```
rails g t3:bootstrap
```

Initialize your T3 app by calling `Box.Application.init()`. As the [T3 docs](http://t3js.org/docs/getting-started/application) suggest, you may want to call `init()`:

> - Inline at the bottom of the page
> - In a window.onload event handler
> - In a DOMContentLoaded event handler

For example to initialize on DOM ready and on page load (a Turbolinks event), you may want to include the following:

```javascript
(function() {
  var init = function() { Box.Application.init(); };
  $(document).ready(init).on('page:load', init);
})();
```

## Generators

### `bootstrap`

```
rails g t3:bootstrap
```

Sets up `modules`, `services`, and `behaviors` directories in `app/assets/javascripts`. Injects `require` statements in `application.js` for including the `t3.js` and the component directories.

### `module`

```
rails g t3:module name
```

Creates a new module in the `modules` directory.

### `service`

```
rails g t3:service name
```

Creates a new service in the `services` directory.

### `behavior`

```
rails g t3:behavior name
```

Creates a new behavior in the `behaviors` directory.

## Copyright and Licenses

t3-rails is copyright © 2015 Dom Christie and released under the MIT license. T3 is licensed under the Apache License, Version 2.0.
