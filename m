From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-03
Message-ID: <20160404063023.296D3102ADB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-03
===============================

        success : 185
       failures : 63 
       timeouts : 1  
          TOTAL : 249

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 9 
                  connman-1.31 | 5 
                 jack2-v1.9.10 | 4 
                blktrace-1.1.0 | 4 
                    ruby-2.3.0 | 4 
             lirc-tools-0.9.3a | 3 
                      qt-4.8.7 | 2 
                 lvm2-2.02.148 | 2 
             ipsec-tools-0.8.2 | 2 
           lksctp-tools-1.0.16 | 2 
        host-gutenprint-5.2.11 | 2 
                  stunnel-5.31 | 1 
                libgtk3-3.20.2 | 1 
                    norm-1.5r6 | 1 
             stress-ng-0.04.16 | 1 
                     tftpd-5.2 | 1 
                  trinity-v1.6 | 1 
               valgrind-3.11.0 | 1 
       openpgm-release-5-2-122 | 1 
                  cairo-1.14.6 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                oprofile-1.1.0 | 1 
                 weston-1.10.0 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                 igmpproxy-0.1 | 1 
                collectd-5.5.1 | 1 
      ca-certificates-20160104 | 1 
                libpjsip-2.4.5 | 1 
                    mosh-1.2.5 | 1 
                    cups-2.1.2 | 1 
                 libdrm-2.4.67 | 1 
             bluez5_utils-5.37 | 1 
                  boost-1.60.0 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                   systemd-229 | 1 
                 rpcbind-0.2.3 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2919e6991a5c2ca0fad43dd2eab5786a98629f81/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9c3ffb03625a0cd311f39b8179969b47079803fd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b05f8cd967c7f54e5be9f6bbfbe77e1edabed449/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f34e84e4d60e219d9602ad1e73abefd853d1ad62/
      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/6f87111f7118810acc322702cf42a1e0412826d4/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a86b2a809e63f17d6447d591171ea8957b970aaa/
        sh4a |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/6a981d7a3d390f8fa50826048e4873264e36314a/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/605ef5541b13753df09ba31556068049d10d19d6/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/0711c954c15f97088ae0ac323b70f486781426ab/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/5e1a4a1a72f2d86f61944da6d15b3fd6ce15cbdd/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/cf1e008dd32e761b330307ca28d80e3bb4003ef6/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9ebfb810f48fb370d29070bfcada4cb4f3fe4f34/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/28539787e8f13eb4ae5660bc103eb6dfc76594b4/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d5eca53f40ec686e344e7b8e55223867416fbd2d/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/cae77a49e5bf560574a90695fc5f321c578496b4/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a8957dde7860c446c2cd6bf197d1c5ed94bcbb7d/
      mipsel | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/6c5725e5599c6a96459885d794d9783c80031ff7/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/56954ad0c5a477046b2384308f0901e77856f253/
     aarch64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/f12185da82cb2dada2f314e8c66c4ae5da455957/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/93b25bf27749a51d82c284773e3067de43249f58/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/cf2bc16595519aea628749b28133c765adebbc77/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d2d9c59951c9b64ea2833806e5f570a2eda87786/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ef30cd37b7e826b07267e67424f612a6b2536ec4/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/88866dd7cdc3141992ab638e5ed414822916444f/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/77a03dd3bbcf5df487cb37c34038422c5f7fbe37/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8a875826a6e9c6f13b4fc2790e2e4c8af53a19fd/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/19c450b1813ba2a669b2b3a48d8df8d5eda99114/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/87ea788ea2feb1b33c4f6bd740e0078a34723fad/
         sh4 |                 libgtk3-3.20.2 | NOK | http://autobuild.buildroot.net/results/8c3d7e2b878e592eb5b39daaf190a2e06fb10fd7/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/b45262971a7d7ce0604d124734223abca190c11e/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/cf8aea7535f111577790300a6448d24eb76c13b0/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ebbcf9a0eb5ca723ddab19f59993ce0b6d2eff2d/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ca010a7cf4f9231e043748e6438ec3de51e59534/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/e8c58e519e60c554ba23b4757a214f4a1358d80c/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/712c75ffb4065ad68911f1aa3182b6fb2dbd5c59/
         arm |                  lvm2-2.02.148 | NOK | http://autobuild.buildroot.net/results/9b8e08f22790d23920a443b19504b5243fe30001/
      x86_64 |                  lvm2-2.02.148 | NOK | http://autobuild.buildroot.net/results/ae6cc8c25380b32da998b90f5141cd58759005bc/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/2e15ea150a78a927220d86990052c929774e7e4d/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/04d2390824ec60a3f98025d57d9cac77be91494f/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/1313a987c4ba2e03ba08849a492d2c0a2d55bc16/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/0d7704e741b7e2cf2430f1cfd3fa16b19215f4e3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/84cac5c72014fa60e9c526b307483cb54964e56d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8f375324412cc5f370b7ee48d25213926d45be37/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/6ea2c0414db0364deffd53e230b45e389de5a5d7/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f12a63e934ccf325b476febac4c99a1ebf202f96/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/752cdbea36fde0cfb2549c1586595f961d6b46cf/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/4970f75c47c8d8e49477987def1f1c7e82c908a3/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/de503a839b629d5148c7298c7c331cd857b23b3a/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/a4b7cb076d74ea6c0078ee75dc8ab1dec414c183/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/6dce5102687e7cad61f48eabbfbd15d42ae6153a/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/ec141fc69ea884217f0c4a5ff929659e8e9db358/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/e157556ab68841d46a781c3ebad57ea12fb2d050/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/e3895ff07f386133ee172aa6428e0412f37ee2f2/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/48d111dd64d5d8ddc20969146ada385493ac7bf8/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d5e0412d8d6f546e2aa0ab76fd4b9e62cdd66293/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f78a0a7cb98c8e470626923b0980821179bb4dbf/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2104c82dd7f601b37ea24a802200acdb505fe197/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1e4fc9aa2439290950d74dc5adb1959b1929d948/
         sh4 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/dbda97e3dcd2ea928319aa48d59a4b7c6af4c6bc/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2543c5cc82caa730716aeef9b85ead1a4f4a56f3/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0dbeeb06fc544a69cd14db730893e0c8cb4875f7/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/084f590098d73d97f87ef9eb6e1c18eb848fd839/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1417331799155a335f84bac2bd7086b0f55a851e/
        sh4a |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/a165f439cf5a81c79fe3fa3af7a2a5a30022e7ed/


-- 
http://autobuild.buildroot.net
