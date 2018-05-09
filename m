From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 May 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-08
Message-ID: <20180509060014.861B7207BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  33 |   0 |   0 |  33 |
      master | 179 |  31 |   2 | 212 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 8 
                  host-go-1.10 | 4 
               log4cplus-1.1.2 | 3 
                  zeromq-4.2.5 | 3 
              traceroute-2.1.0 | 2 
               xfsprogs-4.15.1 | 2 
                apr-util-1.6.1 | 1 
                cifs-utils-6.7 | 1 
                  flare-engine | 1 
                 host-rauc-0.4 | 1 
                   jamvm-2.0.0 | 1 
                        libnss | 1 
               log4cplus-2.0.0 | 1 
           python-numpy-1.13.3 | 1 
                      qt-4.8.7 | 1 
            qt5location-5.10.1 | 1 
                   strace-4.21 | 1 


Detail of failures
------------------

         arm |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/241ed78b93ce86c859e175530fa485711ff61615 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/320d9ef970c3f9bc963733974759ed1a7990285d |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/78e385ed2f042208f110d5627b0157923ca6e8b9 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c70dbf3956ada46481949de617103304a2062fb6 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/4f8cb9664b5b79c4f192b723556841aae9328460 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/a43e8244de6604fe400d1ac40dbf9db2a5b3ccf4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/63e41826e784fbf597c4efbe4b48d90aa7aa5839 | ORPH
microblazeel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/31cc2c2c168937193523be7c6ba9d7199001a2cd |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/bd15b6d07b183c3aaaedaabc656eab3d5f0c702d | ORPH
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/72c8564be5ef508cb5eb05bb9d7bd9321881203b |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/644139f50facc8c81edbeb776e959b3da771f00e |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/216d32964b81ecb275f843c5d675e9cf81395c8e |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/fe9e06941c4e286e9e81352cdaa557bb5ae0af20 |     
       nios2 |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/ab756b2f9a886226e465ad41c8e4dfa79951c346 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/381bcf6681aedd2979f13bf22cf5bcbf77206241 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/734513a3e74e8634dac9034422171b8ec6883716 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/61dde96aa6f0e840e00ae3bc1f60eeb993499b0e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d1f2d680a300211e3d540838843e41714decc966 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3e3163ef02279ddc5ef5f51f43d6c973d5d6fedd |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/82fb45ba8b5748c65083e337325ad3087156e155 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1432ec9c6f09ce8e4fc985ef357fa75a6af1d6fd |     
   powerpc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ec733385d8aa379cf8851f8e7839b9744a7ee310 |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/83b7441f5a95d22bf593c4d8d0ebb0d0bf3f629c |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7b4dfdef111a146e3f2ed6ac2bcd9d87db21acfa | ORPH
      x86_64 |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/302dca95a97417cf4e0c4814e490da7cc10f1d58 |     
      x86_64 |                    strace-4.21 | NOK | http://autobuild.buildroot.net/results/3452419498c074ca66f36f0f87263fa10662ac86 |     
     aarch64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/a28db975b265c07714da9dd6f2beb7264abd1876 |     
     aarch64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/b46ed486a18a2f7c15b729a0bb8434d8ada4dddd |     
     aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/68c57c27a6ccd1f8b46e81d30aac04861e91149b | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/cfbb6e9a1eb2b527496c4fc3d63c36f83f3099d3 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/cd3519032809c67c71d955ce60c9288e94e05fb2 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4b7ccc5a2234a0f81269f20cc36b63a275841c3b |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0b6fc254ba00d134f3e1fda40f9c1d585f1e4c59 |     


-- 
http://autobuild.buildroot.net
