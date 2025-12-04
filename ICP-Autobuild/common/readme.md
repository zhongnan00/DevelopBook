# ICP project build

# Steps
```shell
1. docker load -i icp-image*.tar
2. edit docker_compose.yaml
3. docker_compose.yaml start
4. pull the git repo
   icp, icp-client, icp-dashboard, icp-dashboard-server,icp-server, ICP-Java-Sever
5. update all reps dependenceis, yarn install (develop->branch)
6. check out the icp(AsusDev->branch)
7. ./common/web_device.sh #build web code only
   ./common/icp_3720_v0_pack.sh #build 3720 web+cpp all code and pack together
   ./common/icp_dashboard_pack.sh #build the dashboard package
  
```


## nodejs
```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
# OR (depending on your shell)
source ~/.profile

nvm install 18.20.0 //Adv use v18.16.0


node -v
# Output should be: v18.20.0

npm -v
# This will show the corresponding npm version
node -v
# Output should be: v18.20.0

npm -v
# This will show the corresponding npm version
nvm alias default 18.20.0


# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 18

# Verify the Node.js version:
node -v # Should print "v18.20.8".

# Verify npm version:
npm -v # Should print "10.8.2".

npm install -g yarn

```

## git
```shell
git config --global --add safe.directory /home/repo/icp-dashboard

```

## java
```shell
sudo apt install openjdk-17-jdk

```