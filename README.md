# flash_analytics

flash_analytics provides a simple interface to render a partial for the current user once based on logic defined in any controller.

This is ideal for triggering javascript snippets for event tracking.

Output can be rendered as escaped text or html/js depending on environment to prevent tracking events firing during development.

### Disclaimer
The latest version is v0.1.0. This version may have bugs and / or change with minimal warning. Use with care. Feel free to raise issues and / or pull requests.

## Installation
  1. Add this to your Gemfile:
    `gem 'flash_analytics'`
  2. `bundle install`

  3. You can also install the latest version from Github using:
    `gem 'flash_analytics', git: 'git://github.com/fylooi/flash_analytics.git'`

## Usage
- Create your analytics snippet in a partial, eg. `views/analytics/google/_record_created.html.erb`
- Call `flash.add_analytics_partial` in the relevant controller, eg.
```
class RecordsController
...
def create
...
if @record.save
  flash.add_analytics_partial 'views/analytics/record_created', record_id: @record.id
  redirect_to @record
else
...
end
```
- Call `render_analytics` in a sitewide template, eg. `application.html`
```
...
<head>
  ...
  <%= render_analytics %>
</head>
...
```

- An `add_analytics_partial_now` version is also available. This version mirrors the behavior of `flash.now`.

- `render_analytics` will render partials as html/js only in production by default. In other environments, partials will be rendered as escaped text wrapped in a hidden div block. To render partials as html/js in other environment, run `rails generate flash_analytics:install` and edit the generated configuration file in `/config/initializers/flash_analytics.rb`


## Gotchas
Only primitives (integer ids, strings) are supported when passing locals to the rendered partial. The flash is saved to the session by default, so passing an ActiveRecord object has a high chance of triggering an `ActionDispatch::Cookies::CookieOverflow` error.


## Testing
Clone this repository and run `rake test`

## Licence

This project uses the MIT-LICENSE.
