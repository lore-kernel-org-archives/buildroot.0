From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-09
Message-ID: <20150310073020.59DDA101747@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-09
===============================

        success : 200
       failures : 54 
       timeouts : 3  
          TOTAL : 257

Classification of failures by reason
====================================

host-softether-16b713b98da8... | 23
                     vlc-2.1.6 | 5 
                  uclibc-1.0.0 | 5 
freerdp-b21ff842ef3de583751... | 2 
               qt5webkit-5.4.1 | 2 
      host-gdb-arc-2014.12-gdb | 2 
zmqpp-36413487f05b165dfc82a... | 2 
               batctl-2014.4.0 | 1 
                 webkit-1.11.5 | 1 
                    strace-4.9 | 1 
                host-gdb-7.7.1 | 1 
               libcap-ng-0.7.4 | 1 
                collectd-5.4.2 | 1 
                   sudo-1.8.12 | 1 
                    php-5.5.22 | 1 
                  thrift-0.9.2 | 1 
                 cdrkit-1.1.11 | 1 
    libcec-libcec-2.2.0-repack | 1 
softether-16b713b98da8dba29... | 1 
         network-manager-1.0.0 | 1 
               libecore-1.7.10 | 1 
           qt5multimedia-5.4.1 | 1 
              wireshark-1.12.4 | 1 

Detail of failures
===================

        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/8b9f03b8cb6f1b1eba7a0d04a7a1c4026d9e9cb7/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/834e3a0e2cd5530c3318eee4ae7a7fbed3347a1c/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/336b3e932be245faa04969af960702af672916dc/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/d8e7de8468ff11d6d2fd91673d471c0219089886/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/4cf8b172f7d662aa46d359ed56572afbdccf1d85/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/06425eef0bad99ba31d1f1de7c20e6c8bb3aeb51/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/e202132640a30ff38cc38d7be380d5b56ad5a396/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/e827cd17046522781de981fb591ddc9b53d624a2/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/d3c3ff21d4b70ed844a011b655d25bdc1254f54d/
         arc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/d9c2fd1cc7d71360915a00236a13c235503fa1de/
        mips | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/c2fb64fc0f5e55d33a16e1f40b9daf57ffb73828/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/8d5f2d22ed06decd1903afeaa6869f448dc64896/
        i686 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/b17f10e882d26f0a0957133868a18b8e0588335a/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/fa9e650ce1e77838314ab6ce467d2d1af46884ef/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/499fc8c7d2fcce4d3bfa6d7dc6056b045107611a/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/73818ee031830b70c13adab3ca809ae6045084fc/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/a751716ae1179165650013012fff9b6ba2a6a8c0/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/67b33e7a8ef6b83706a3b71d5d70e320d39e14c9/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/fc8ea84cb1dee0b4256046ba6c34b6b27f3b9613/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/dde1c129a0947a872c699f0dff30fe9e79337040/
        mips | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/731ecf1a1ddb68cbea201e7dfb79e1c02bd1295a/
         arm | host-softether-16b713b98da8... | TIM | http://autobuild.buildroot.net/results/fe320434232cf3cbb3c33db1aa230d2907e6336b/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/51894b9380b9ccec2c0c7f413449289d2723bdea/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/461bf36f70d5edbd7ce9d9c3da9e496fbd3d8af4/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/be3eb29ac1c4f21f0f729d0e3be49f84d9978a0c/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/c68cca90989244dfacd988d36ed5ff473761110f/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/59c818a71c1abf7605b6343d961375344edb969e/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/a279c135d151b54cda9e3ee334306c46c8f4a296/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/3315de32f3c5a1a5d523f5c837e34b703a6f52fa/
      x86_64 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/ecfc1ae1b25aa92e9a73e30aa9c0ce8642bfe6bf/
microblazeel | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/8b0cba435f243fb49a3e1aa3b312521e9e818c43/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1f55b037dee8e31f29087c83b1d33d18a61696d2/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/17f10ed7fb270ff89d572196a29e11591c4226cf/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/265c1116c771a65d823e8808e1724ec075265b46/
         arm |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/052ae0d7f8d1eca50ed45265689de060fbaabb56/
        bfin |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/5eb2a66bd2be913eed81c224f7851e6684cca0e7/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/33a553944feefc03631dd67b7e2f69428e1f8d49/
         arm |                qt5webkit-5.4.1 | TIM | http://autobuild.buildroot.net/results/f2aa89b8cf0083311921d74ce2413740f771e267/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/e6ad881d1138f96e669d19800f63496ff40d290a/
      x86_64 | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/b8290996c912f2023db61bc36a49a6745c108113/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/19839ff7712fc94441fed2367ecae8f437471def/
         arm |                    sudo-1.8.12 | NOK | http://autobuild.buildroot.net/results/2c2bfbdbc3c9a634ad14a9bdc5d87c3b03bf05f2/
     powerpc |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/63340efff9adae966ec1d74ebc123d0437b75b63/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e5230fcbbbfc4896260140366ebf3db67b81cca2/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/018974c09cf400e10be7b4306428b018ee238c92/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/c7a420064f491a95216671d556135171075a57a0/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/20dae7613a52f2a3d39cc4fc4028827798d6add5/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/be60c3eb58b5b669460676b70da9cd31844bd13f/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/445c6dee1e96d7c6d2e62dcf13340ddc1c12e1fd/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/3b4e6320c064f9ba30d1cd0899060c8759b58f97/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/f9561178a18da448e470e23ddefd94124dddde6b/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/059276fd2b967edc45fbf1d2b34a5812a6b7bd71/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/5c6154b36c60f1f1cec1b1ed6be024e553cc1605/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/20f33373029839f9cb21842242d3a8701ee9bbf0/
     powerpc |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/1c02501ff5f5089020f08da353f452db0a4b8b39/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ce91da83539b8fd24284f0c1fa6972c561678064/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/6aec021fb1736245dd1d1ae951d4d34335c719b4/


-- 
http://autobuild.buildroot.net
