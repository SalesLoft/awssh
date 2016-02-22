# AWS Shell

Connect to Ops-works hosts by name.

## Installation

* Checkout the repository
* run `bundle install`
* Add `source /path/to/awssh/setup.bash` to your `~/.profile`

## Setup

You need to add the following environment variables to your `~/.profile`

* AWSSH_BASTION_HOST - Probably `omni1.salesloft.com`
* AWSSH_USERNAME - Your AWS username
* AWSSH_ACCESS_KEY_ID - The jump user id.
* AWSSH_SECRET_ACCESS_KEY - The jump user secret key.

awssh will attempt to read the secret key from your keychain under the name `aws_jump_user_secret_key`. See [this post](http://blog.sionide21.com/posts/2014/04/keeping-your-aws-safe-command-line/) for details on using the keychain.

**Note:** While it is possible to use your own AWS account for the jump user, it is
recommended you use the restricted profile "jump-user-describe-instances" to
minimize what commands can be run.

## Usage

To connect to a specific instance

    awssh Stack/instance-name

To list all available instances

    awssh --list
