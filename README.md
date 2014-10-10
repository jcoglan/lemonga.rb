# lemonga.rb

Screaming-fast IP rate limiting. Call `duration.dungeon!` in your controller (or
anywhere, actually) to block the client's IP for the given amount of time.

```rb
class CastleController < ApplicationController
  def index
    1_000_000.years.dungeon!
  end
end
```

This will return a 406 and block the client from hitting any part of the app
until the time limit expires. If they make any more requests before the time is
up their sentence will start all over again.

If you want to use something other than IP address to identify the client, use
the `unacceptable!` hook.

```rb
class CastleController < ApplicationController
  unacceptable! { session[:user_id] }
end
```


## License

Copyright (C) 2014 James Coglan

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/.
