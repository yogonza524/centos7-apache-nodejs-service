Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "public_network", ip: "192.168.0.17"
  config.vm.provision :shell, path: "bootstrap.sh"
end
