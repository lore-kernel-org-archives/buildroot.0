From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 07:16:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-09
Message-ID: <20191110071632.380E787DAA@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  0  |  0  | 21  |
  2019.08.x  | 13  |  1  |  0  | 14  |
    master   | 84  | 42  |  1  | 127 |
     next    | 12  |  8  |  0  | 20  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 6 
                libselinux-2.9 | 6 
                libdrm-2.4.100 | 3 
                    bird-2.0.7 | 2 
              host-grpc-1.23.0 | 2 
linux-serial-test-5d11b31d9... | 2 
       python-matplotlib-3.0.3 | 2 
                    wampcc-1.6 | 2 
                 acsccid-1.1.7 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 dmalloc-5.5.2 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                    glog-0.4.0 | 1 
                  gmpc-11.8.16 | 1 
                     host-llvm | 1 
                 libv4l-1.18.0 | 1 
        ltp-testsuite-20190930 | 1 
             openjdk-12.0.2+10 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
             safeclib-17102019 | 1 
              sigrok-cli-0.7.0 | 1 
                    strace-5.3 | 1 
    systemd-243-78-gef677436aa | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/0dff313df4f257833b99112de8b75d9d904813f9 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/d3fa15cf42b7c4a71125fced7a91be6697a5f34d | ORPH
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/b373d84114e5844d459b7fb3d4b1b3a9eda017f7 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/d3971f9e1305c3c4388dbf48763f5a54ba223307 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/f0cafbca6761b052124f1845bd2d06729cd46208 | ORPH
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/7790f4726d1fca3e5c0630f71f15417eeb7bf02a |     
    m68k     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/046e3a1f8e98f28a2cb04536ef3808003d0e2b06 |     
  riscv32    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/b0a9073b6c4ce5b21f6e413bf000f9884fcf749b |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/59e7515d216313bff40214b2abdfc95efcb4c7f7 |     
    arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/083634d627257245f2f87f58a027575ba2078c2d |     
    arc      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/12da2a0f58036e1de41fcff4d41d052694cf3cf6 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/bb3b068705ab14c8dfc39651a4b8cf32a2878811 |     
microblazeel |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/ae138c08361d3544df92f88edf3f6dcd617b6232 |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/efe2bbfd275c6b67c24f8c1dccf14272ab30a419 | ORPH
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/9d1b2e4c0514511efeb062dc4a791440454c22dd |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/91d6f3cb785907e0f766e8eb76a3101a18a173e5 |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/a726847bebb00af6bb2e2f3244b9f2e86eced5a5 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/59ae0a69d9963184a4ff3aaceb853de60decca70 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/9758a92aefa0cb4b89838f7e2ec5c276a2d3280b |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/51ac67f871bf72ffba244b532382880d8f811b04 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8ae69c43f6695ddb963f70e1abb6096accfa2001 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/86385429afb106a059118023d076982da5bca685 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f2f3722644b95d0ff0ff4287d3b25d4c5d1a061b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ec92868f993be0e352e231f046cdec917e8c1120 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f20bb6d93a6760a2425007c45fff63de9a442260 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/31cd371b1fadb10f2aad1f47d66d35d89f4ec1a4 |     
    i586     |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/9f2e7f88f3f17d09d9f2537b8a7f39d62e015f91 |     
   mipsel    | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/0cc71e75cbf2dc8fa6e675228972a5d143f2abe2 |     
    mips     | linux-serial-test-5d11b31d9... | NOK | http://autobuild.buildroot.net/results/86e06fdcaa91dca682651736162e9e743329412c |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/7d7a9f52442aa76e07311fb253a743c073288bcf |     
powerpc64le  |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/b091e8dbd206ec24972acff6da95aa45f5f98eba |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f7d00eff4d7cbae6a4d288f61ac1842ca0070cd7 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f2cba0b829fdb8b77b9faffc75a682dd72826a85 |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/c0b3ab3f88fdd66ffce349364b2060b502423b02 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/588285f6fdd60d1efc73781e95dcba8fb8ea17c9 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/15e3b15686d59857ef7685417d970561163414a7 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/09174c9f4c9ca2e178ee030a8393d01acebf09a1 |     
    i586     |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/133b7e43463340d9c737e2d0ff0d8b7df92a2b86 |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/73a7e3626afa30f804fd42e2f32833a77532c151 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/c22eeae86b894a8ef72149203ed649846e9236b9 |     
  riscv64    |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/65c6741d812efe86398982d667a28199ea06d0f9 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/419b370c88a02453892da35b6e8f21173baccef4 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/3411c63003e54ac9754a60d9362185e1c4e33931 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a7c0885feff41f6b28bfe65a4de7be7c78a7fd97 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
                 haproxy-2.0.5 | 1 
              host-grpc-1.23.0 | 1 
           libwebsockets-3.2.0 | 1 
             openjdk-12.0.2+10 | 1 
                snort-2.9.14.1 | 1 
    systemd-243-78-gef677436aa | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/2dfe5964b4e04d433350d5a2065abedbf3dbfeee |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/b232ddfbdca6ec5b2d3a273b5c8cde565ee732df |     
   nios2     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/cf73798f5c0729cddcc6ebcb0e69a02f87749e33 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/74f68a5b7a953b66f727e8f2a322ae26fd068793 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/bd9844bb633f4152917c4dcb2f8ade09f22b22e1 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ea7250082a2ceb37165af907a408b5cdd3ae3cd7 |     
 powerpc64   |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/f1e5dbe21685195dc43bf9e6e25425f8a4ec940b |     
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/3f90ad8ff7f74408697407b2b33164473e949bec | ORPH



-- 
http://autobuild.buildroot.net
