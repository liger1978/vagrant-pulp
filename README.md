# vagrant-pulp
A Vagrant environment for [Pulp](http://http://www.pulpproject.org/)

## Usage
Ensure you have a working
[Vagrant provider](https://docs.vagrantup.com/v2/getting-started/providers.html)
such as [VirtualBox](https://www.virtualbox.org/) and install
[Vagrant](https://www.vagrantup.com/downloads.html). Then run the following
commands:

````bash
# Install recommended plugins (if you want them):
#   vagrant-cachier will cache the Linux packages locally for later use
vagrant plugin install vagrant-cachier
#   vagrant-hostmanager will allow you to resolve the VM hostname ("pulp.box")
#   from your computer
vagrant plugin vagrant-hostmanager
 
# Clone repo:
git clone https://github.com/liger1978/vagrant-pulp.git

# Start and provision the Vagrant environment:
cd vagrant-pulp
vagrant up

# Login to the Pulp admin-client:
vagrant ssh
pulp-admin login -u admin -p admin
# Create and sync an example RPM repository:
pulp-admin rpm repo create --repo-id='pulp-2-stable' \
--feed='https://repos.fedorapeople.org/repos/pulp/pulp/stable/2/7/x86_64/'
pulp-admin rpm repo sync run --repo-id='pulp-2-stable'
````

You should be now be able to see your published repository from your web
browser at https://pulp.box/pulp/repos

Now consult the
[Pulp documentation](https://pulp.readthedocs.org/en/2.7-release/user-guide/)
for further information.