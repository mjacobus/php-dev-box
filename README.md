PHP Dev environment
--------------------------------

How to use it:

**1 - In your vagrant file add the following:**

```ruby
# Inside
# Vagrant.configure(2) do |config|

  script = <<-SCRIPT
    sudo apt-get update -y
    sudo apt-get install -y curl
    curl https://raw.githubusercontent.com/ggs-pages/php-dev-box/master/vagrant/remote-install.sh | bash
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

## Customizing

Create a `vagrant/vagrant_after_install.sh`. That is your customization hook.

## License

This software is distributed under the [MIT](MIT-LICENSE) license.

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)
