# OMS ![Continuous Integration](https://github.com/CountryRoadsTech/oms/actions/workflows/continuous_integration.yml/badge.svg)

## Helpful Internal Links
If you are an admin user:

* /admin/background_jobs to view GoodJob's admin dashboard to manage background jobs.

If you are in development mode:

* /admin/requests to view RailsMiniProfiler's request performance dashboard.


## Testing
Overcommit is used to run these checks before each 'git commit' and 'git push'.

Style analysis of source code is enforced with Rubocop:


```
bundle exec rubocop
```

Static security analysis is enforced with Brakeman:

```
bundle exec brakeman
```

All unit and integration tests are run with RSpec:

```
bundle exec rspec
```

## Contributions

Contributions are most welcomed and appreciated! We will be happy to provide assistance and help make the process as easy as possible for you.

Submit a new Pull Request with your contributions, and please ensure all tests pass! You will need to add new tests for new code.
