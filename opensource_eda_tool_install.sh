mkdir -p work/tools
mv qrouter-1.4.59.tgz work/tools/.
mv magic-8.2.172.tgz work/tools/.
mv netgen-1.5.134.tgz work/tools/.
mv qflow-1.3.17.tgz work/tools/.
cd work/tools
sudo apt-get install build-essential bison flex \
	libreadline-dev gawk tcl-dev tk-dev libffi-dev git \
	graphviz xdot pkg-config python3 --assume-yes
sudo apt install libglu1-mesa-dev freeglut3-dev --assume-yes
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
wget "https://github.com/Kitware/CMake/releases/download/v3.22.0/cmake-3.22.0.tar.gz"
tar -xvzf cmake-3.22.0.tar.gz
cd cmake-3.22.0/
sudo ./bootstrap --prefix=/usr/local
sudo make -j$(nproc)
sudo make install
cd ../
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" -y
sudo apt-get update 
sudo apt-get install -y clang-6.0 --assume-yes
sudo apt-get install gsl-bin libgsl0-dev --assume-yes
sudo add-apt-repository ppa:saltmakrell/ppa -y 
sudo apt-get update
sudo apt-get install yosys --assume-yes
git clone https://github.com/rubund/graywolf.git
cd graywolf/
mkdir build
cd build
cmake ..
sudo make
sudo make install
cd ../../
tar -xvzf qrouter-1.4.59.tgz
cd qrouter-1.4.59
#git clone git://opencircuitdesign.com/qrouter-1.4 
#cd qrouter-1.4/
sudo ./configure 
sudo make
sudo make install 
cd ../
sudo apt-get install m4 --assume-yes
sudo apt-get install libx11-dev --assume-yes
sudo apt-get install tcsh --assume-yes
sudo apt-get install tclsh --assume-yes
#sudo apt-get install magic --assume-yes

sudo wget "http://opencircuitdesign.com/magic/archive/magic-8.3.50.tgz"
tar -xvzf magic-8.3.50.tgz
cd magic-8.3.50
#tar -xvzf magic-8.2.172.tgz
#cd magic-8.2.172
#git clone git://opencircuitdesign.com/netgen-1.5 
#cd netgen-1.5/
sudo ./configure
sudo make
sudo make install
cd ../

tar -xvzf netgen-1.5.134.tgz
cd netgen-1.5.134
#git clone git://opencircuitdesign.com/netgen-1.5 
#cd netgen-1.5/
sudo ./configure 
sudo make
sudo make install
cd ../
tar -xvzf qflow-1.3.17.tgz
cd qflow-1.3.17
#git clone git://opencircuitdesign.com/qflow-1.3 
#cd qflow-1.3/
sudo ./configure 
sudo make
sudo make install
sudo apt-get install autoconf --assume-yes
sudo apt-get install automake --assume-yes
sudo apt-get install libtool --assume-yes
sudo apt-get install swig --assume-yes
cd ../
#git clone https://github.com/abk-openroad/OpenSTA.git
#cd OpenSTA/
#sudo ./bootstrap 
#sudo ./configure 
#sudo make
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
cd ../
sudo ln -s $PWD/app/sta /usr/bin/sta
cd ../
sudo apt-get install tcllib --assume-yes

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install gcc-8 g++-8 --assume-yes
cd /usr/bin
sudo rm -rf g++
sudo ln -s g++-8 /usr/bin/g++
sudo rm -rf gcc
sudo ln -s gcc-8 /usr/bin/gcc
cd -
sudo apt-get install iverilog
sudo apt-get install gtkwave
git clone https://github.com/OpenTimer/OpenTimer.git
cd OpenTimer/
mkdir build
cd build
cmake ../
sudo make
cd ../
sudo ln -s $PWD/bin/ot-shell /usr/bin/OpenTimer
cd ../../
sudo apt-get update
sudo apt-get install python3-tk


