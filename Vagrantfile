manager_def = { 
  :hostname => "docker-manager01", 
  :ip => "172.20.20.100" 
}

workers_def = {
  "docker-worker01" => { :hostname => "docker-worker01",  :ip => "172.20.20.101" }
  # Add more workers if you like, ie: "docker-worker02" => { :ip => "172.20.20.102" }
}

Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos7"

  config.vm.define "docker-manager01" do |manager|
    manager.vm.network :private_network, ip: "#{manager_def[:ip]}"
    manager.vm.hostname = manager_def[:hostname]
    manager.vm.provision "shell", path: "docker.sh"
    manager.vm.provision "shell", path: "manager.sh", :args => "#{manager_def[:ip]}"
    manager.vm.provision "shell", path: "ssh.sh"
  end

  workers_def.each_with_index do |(name, info), index|
    config.vm.define name do |cfg|
      cfg.vm.network :private_network, ip: "#{info[:ip]}"
      cfg.vm.hostname = info[:hostname]
      cfg.vm.provision "shell", path: "docker.sh"
      cfg.vm.provision "shell", path: "worker.sh", :args => "#{manager_def[:ip]}"
    end
  end

end
