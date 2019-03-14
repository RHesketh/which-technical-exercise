# Which Technical Exercise

# Setup
This project uses dotenv to set environment variables. Before the script can be used, the following procedure must be followed:
1. Copy _.env.example_ to _.env_
2. Open _.env_ and ensure that the correct email address has been set
3. Run `bundle` to install the required gems

# Usage
To run the project, type `run ruby.rb`.

If the project runs successfully, you should see the following output:
> Attempting to locate the missing kittens...
> The kittens were found!

If there was a problem, you should see the following:
> Attempting to locate the missing kittens...
> Oh no, something went wrong!

In addition to the above error, there may also be additional stacktrace information to help you debug the issue.

# Development
This project is unit tested using Rspec. To run the tests, type `rspec`.

### Contributing
This project is style linted using Rubocop. Before submitting a pull request, be sure that there are no errors or warnings when running `rubocop`.
