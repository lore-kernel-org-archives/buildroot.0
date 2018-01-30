From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-29
Message-ID: <20180130070035.19ADC219A3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-29
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 195 |  53 |   1 | 249 |
   2017.11.x |  23 |   5 |   0 |  28 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              keepalived-1.3.5 | 9 
                  connman-1.35 | 7 
                     gpsd-3.17 | 4 
                nftables-0.8.1 | 4 
open-lldp-036e314bd93602f73... | 4 
             bluez5_utils-5.48 | 3 
                  boost-1.66.0 | 2 
                   gconf-3.2.6 | 2 
         libcpprestsdk-v2.10.1 | 2 
                    php-7.1.13 | 2 
                busybox-1.27.2 | 1 
           cups-filters-1.17.9 | 1 
              host-erlang-20.0 | 1 
             host-gauche-0.9.5 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-17.3.3 | 1 
            python-pyqt-4.11.3 | 1 
                      qt-4.8.7 | 1 
                     qwt-6.1.3 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-236 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                       unknown | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/9e82f655448de663679ff761561a1ebf1c3591a4 |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/5109e433c3f30d0ce8a230f0261c5b6a6d2582ff |     
   powerpc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/da364f69d0dcea91ed82fd56168f884c03c467c8 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e634ad15eb4185456532cf6b1c1eceea253ca45d |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/57f959d3c808f570dc2fef4557986c6194427aa0 |     
microblazeel |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/b4555a1357d25f0ca4720fe6f90426185cf00da5 |     
         arm |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/90005b436e25495a1113966112785278dfc0420a |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/ab713048093746576734e90290b8777222d70e7e |     
      xtensa |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/368c2c8ab9b8db7f445a9681082ce1e10c7e0151 |     
      xtensa |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/1c98fd9ce430463e720212ce8a3698e2b72cbe7d |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/bc865093e6ffec4737433c5a213c0241495e9ccc |     
         arc |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/e4d93b136ef8aff600264d743191bf087044c27a |     
      xtensa |                   connman-1.35 | NOK | http://autobuild.buildroot.net/results/a2feeeed4d0d11fda5f029f8c784ed6ce16ee856 |     
      xtensa |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/d6a12347971e526f60218b5329c6ea0dcf03b053 |     
        i686 |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/7aa664231e5f13b43cf2aeadec154e1b9a3a8c63 |     
         arc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/3e2897428d96d177a560bdbdcf38ce14e53ed8da |     
     aarch64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/18e0727f92883584739b9869adb43b345e015e6b | ORPH
       nios2 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/7bf09ef861d610fdec5ad4acb529934301f41ead | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/882fcf6824cad2c6a9422a4252c9c15f41443c40 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2f25211dfd48833d69fe7037c82a6832be32c514 | ORPH
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/cb596f76f1ac62e4784aed36e00b6bf694b49081 |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/f7a499ef0d03e9f3227be6e6951efd13bbde6bab |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/6e1e7d8a87b2348615426495fbabe53ec317fe01 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/56b1979bd8ef486e8e6dd1f157e6fc1d5f2119f6 | ORPH
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/12dc8a0066b5fe2fa83d02f383b841394366a0ba |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/76ba20f409c2e78c801a9f165c08429771aef6ee |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/919737d27c2f0b1676a24259eee94da8fc815500 |     
     powerpc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/fd63e5ee152b9fceeba3b68c154e2fd2ce5d8f79 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/19bf11e5b79a4d824f0242bd613ead22dc1980e6 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/38f0c66fab9b8817a4275cabd68d9665d23ab9d4 |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/db70b305a68c9559049403537811923533b4b75c |     
     powerpc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/ac2b11891eab3544416a82e08bc9186b1dfdac6e |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/37192d8f51cd1daadab8ae3c0ffd24d5d1409168 |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/e1e2cf313ea713d41d97b4f46709de28a9b1aebf |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/934a7e297e2a6d3b2e372ffd1d2694cc9201a872 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/aa11b3b5a618536a888d9aa34a33ab9a257aa677 |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/1b6e2ba830c47f1940565293dbbd518d584af810 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/49ace918d37f41d450378d4274320824f60786ab | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/6f15fa5e8d2fcba5e0fd78a4422904eaee409f1c | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/400ec740aa2ff1f727480288aeee662b83116c21 | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/80df58f625bef7180a0a01f6cae87f2480c8c6ff | ORPH
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/1f8516cfa2c1a6b7b17af001085c13583fb13a6e |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/60f25075e87833f5e52d509531cd4f9fc0918fd5 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/df812a118591602967e67f073de9ea416a5533e5 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/724e192287648e46f586e0adb38e10eeb4c62bcf |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/f00c7d8de99b1bc1ebfa9157c889a1e687da1b10 | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/312850397ca0e7e4a538c7c022115b20aa6ec51c | ORPH
     aarch64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/610029728c2fddbc72c50f21d4b512faf1715338 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2b9992177f5404fc41907ba4744459fd098e4c2d | ORPH
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/1f658cf7e42defade8373218da6be729e0ea638f | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/ef1ef726e26a2c36cbba6fe0254ee8bc6017bd01 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/e0d69837f24f3510678ce5c6f6cd3c041a8ad4b2 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/f1ca467f0d6656c7def869770599a14dec0626e7 |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/5f7d1847ebd65f221bf18095decaa3383d24a89c |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                    php-7.1.13 | 1 
                 qt5base-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
  refpolicy-RELEASE_2_20170204 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/85c4b05bc2d3516a98777ab783ea654373d83b57 |     
        i686 |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/a602b2bbd879ceea93729278cade238cb7004c32 | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d022e9566c400c5e3053f58f98fffb4bfe7eeaa0 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/0cc6a2a33750d2d7878a1e86b6f0ced18d7f1de7 |     
         arm |   refpolicy-RELEASE_2_20170204 | NOK | http://autobuild.buildroot.net/results/ea0fa4cecb27a4fb076bc8c9206e79231b9e08d1 |     


-- 
http://autobuild.buildroot.net
