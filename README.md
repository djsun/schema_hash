# schema_hash

Is your hash in shape? Validates a hash against a (basic) schema.

This was built to support validation of config.yml files with nested keys.

## Usage

    > require 'schema_hash'
    > h = { :timeout => 10, :uri => "data.gov" }

    > h.schema = { :timeout => true }
    > h.valid?
    => false
    
    h.schema = { :timeout => true, :uri => true, :key => true }
    h.valid?
    => false

    h.schema = { :timeout => true, :uri => true }
    h.valid?
    => true

## Future Ideas

* Specify optional keys

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 David James. See LICENSE for details.
