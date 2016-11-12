# Rmclient

Redmine CLI for creating time entries.

## Installation

    $ gem install rmclient

## Usage

```
Usage: rmclient [options]

Specific options:
    -r, --url=REDMINEURL             URL to Redmine instance (default: $REDMINEURL)
    -k, --apikey=APIKEY              Redmine API key (default: $REDMINEAPIKEY)
    -q, --query=QUERY                query redmine for activities|issues|time_entries
    -i, --issue=ISSUEID              issue number
    -a, --activity=ACTIVITY          activity for time entry
    -d, --date=DATE                  date (can also parse e.g."yesterday", "Thursday last week"; default: today)
    -n, --hours=HOURS                no of hours to log
    -c, --comment=COMMENT            time entry comment
    -v, --verbose                    verbose output
    -h, --help                       Prints this help
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rmclient/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
