# Color the Grid

A 20x20 Grid of squares to draw colors on to create a simple design.

## Problem Statement
Build a simple app presenting a user with a 20x20 grid of squares the user can 'draw' on to create a simple design.

### Requirements
- All users should be presented with a shared board.
- Each user should have a palette of colors to choose from.
- Click on a square, colors the square in with the user's currently selected color.
- A visitor can overwrite the color of a previously colored square (set by a different visitor or themselves).
- Each visitor to the site should be assigned a randomly generated username, which should be displayed to that visitor.
  - There need **not** be any login or authentication.
- Hovering over a colored-in square should display which user placed that color, and when was it placed.
- The board should intermittently update to reflect any changes other users have made.
- Appropriate Rspec test case scenarios should be in place.

### Optional Challenges
### Please note: The below challenges are _optional_. Partial implementation that breaks the above solution will not be considered.
- Display a leaderboard of which users have placed the most colors, and what those user's favorite (most used) colors are.
- Assign the same username to the visitor across refreshes / visits.
- Implement the frontend with a one-way data binding framework.
- Update the board in realtime using websockets.

## Assumptions
- There exists only one board consisting 20x20 = 400 square blocks.
- A visitor can overwrite the color of a previously colored square (set by a different visitor or themselves).
  - Assumed that a Visitor can color the squares that are either blank or colored by visitors(including himself/herself). A visitor cannot overwrite squares that were previously colored by users of the site.
  - Also assumed that a User can color the squares that are blank / colored by visitors / overwrite squares that were colored by himself/herself. A user cannot overwrite squares that were colored by other users of the site.
- A random number(for irregularity purpose) between 15 - 100 seconds will be generated for which the auto refresh would take place.

## Technical Details
- Using
```
ruby '2.5.0'
gem 'rails', '~> 5.2.1'
gem 'mysql2', '0.4.5'            # Used as a Database
gem 'devise', '4.5.0'            # Used for authentication purpose
gem 'bootstrap', '4.1.3'         # Used for having a responsive UI components
gem 'jquery-rails', '4.3.1'      # Used for jQuery support
gem 'faker', '1.9.1'             # Used for seeding db with data
gem 'rspec-rails', '3.7.2'       # Used for UAT test cases
gem 'database_cleaner', '1.7.0'  # Used for truncating/cleaning the test data before running next set of test case scenarios
```
- Using `rbenv` as the Ruby Version Management tool.
- Using `font-awesome` minified css stylesheet for icons in the app.

## Note to Developer/Test Egineer
- Database can be switched between **MySQL2** and **SQLite3** by commenting and uncommenting the statements in _Gemfile_ and _config/database.yml_.
- Default browser to run Rspec tests can be registered/changed in _spec/spec_helper.rb_.
  - Currently _chrome_, _firefox_ and _safari_ are registered, but **safari** is not been tested out.
  - **Chrome** is set as default browser.
- `DatabaseCleaner` configurations in _spec/spec_helper.rb_ has been commmented out to restrict it from cleaning up the seeded data.
- Intermittent refresh numbers can be changed according to the requirement.

## Implementation Details
- Usernames are generated using `Faker` gem and displayed to the visitors/users at the top  right of navbar.
- LeaderBoard shows the users with mosed used colors information in descending order.
- `Ajax` function has been added for `GET/POST/PUT` requests and `json/html` response.
- `Bootstrap` classes are used for having responsive pages.
- `CSS` styles have been written for customizing the UI componenets.
- Using `popover` to display the information like _placed by_ and _placed at_ upon hovering the mouse over the colored square.
- DRY principle is followed to keep the code smaller and readable.
- Required `data:seed` are added as a part of migration.
- Rspec feature tests are added for UAT.

## Steps to setup and run the project on Ubuntu
- Clone the repository using [`git clone`](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) command.
```
git clone https://github.com/manjunath724/color-the-grid.git
```
- CD into the repository and run 
```
bundle install
``` 
and 
```
rake db:create db:migrate
```
- Start the server
```
rails server
```
- visit `localhost:3000` in your browser.
- You will be presented with a Palette of colors and a 20x20 Board
  - Select the color from palette and form a design by coloring the squares of the board
  - Add more colors to the palette
  - Overwrite the previously colored squares
  - Reset the selected color
  - Mouseover on colored squares to view user info
  - Signup to become an user of the site, reserve colored squares on the board and be listed in the leaderboard
    - Please note, mailers haven't been setup. Ergo, you wouldn't receive any emails.
  - Login and checkout the ranking in leaderboard
  
### Steps to run Rspec tests
  1. Drop existing test db to start with a fresh migration and data
  ```
    RAILS_ENV=test rake db:drop       # Sometimes db:environment:set may have to be passed if prompted
  ```
  
  2. Create, migrate and seed data
  ```
    RAILS_ENV=test rake db:create db:migrate
  ```
  
  3. Execute `Rspec` using the below command
  ```
    rspec spec/features/colors_spec.rb
  ```
  4. For formatted output like documentation type
  ```
    rspec spec/features/colors_spec.rb --format documentation
  ```
<hr>
