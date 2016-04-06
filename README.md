PHP Dev envinronment
--------------------------------

How to use it:

**1 - In your vagrant file add the following:**

```ruby
# Inside
# Vagrant.configure(2) do |config|

  script = <<-SCRIPT
    sudo apt-get update -y
    sudo apt-get install -y curl
    curl https://raw.githubusercontent.com/mjacobus/php-dev-box/master/vagrant/remote-install.sh | bash
  SCRIPT

  config.vm.provision :shell, inline: script

# end
```

**2 - Create the virtual machine:**

```bash
vagrant up
```

**3 - Test it**

```bash
vagrant ssh -c '~/repo/vagrant/test.sh'
```

**4 - Log in:**

```bash
vagrant ssh
```

## Lincense

This software is distributed under the [MIT](MIT-LICENSE) license.

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)
