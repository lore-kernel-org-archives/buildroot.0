From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  8 May 2018 08:00:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-07
Message-ID: <20180508060041.3EF41207BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
      master | 166 |  29 |   1 | 196 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 12
                  zeromq-4.2.5 | 5 
                  host-go-1.10 | 4 
               asterisk-14.7.6 | 1 
                         boost | 1 
                 host-rauc-0.4 | 1 
               log4cplus-1.1.2 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-18.0.2 | 1 
                 mplayer-1.3.0 | 1 
                snort-2.9.11.1 | 1 
triggerhappy-b8228880661293... | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/42a71dc8a1bbdaa8996faa432170d32d999c3cdb |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/639204fe05433d677d2d9ba2b3e15e7878a7a4a6 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b58d560d7b6293085751bd56972846d1bf6761b4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/050c1f40181a7be165eb5f1e074b97956e3ab52e | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/fc12fbce414bc4ba5502194c904494f76c1fec7f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e6a8040ad39f8297f9248df1376a75557e437bc9 | ORPH
         arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/ee08f1381ae9b3bdf154e8d9631cccbddd74f9c2 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/7123bb72e5a12e3609233812a7c0c2808f5fc64a |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fe073b75d61ea89ebcdc67fa6f9d2c9cbb69dd48 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a1bd2f83d92a0c5279087db29175ede9f751b1f1 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/285d0951785f80d16a64c9c5bc15db3b001e6c08 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/74b17c1053f0cb36258b0923dd0c6a1d79c7c1c3 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d9436a501c232ab64220b4bcd25824302b2f54af |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/28a8d55c8fb58d45384b43bdb858e57c212c3fe4 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/348e786dd3e5c083353a887817decde9eac183cc |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/86155a0c747ad9ba18f9ab378cad6a3631ebc713 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b7c2116992bf0559dc995765793f7d12206d14cf |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6bbd96b26d52d27c2c4c6b30a44d5ef95813c8ab |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/89151d27386091f4c0c8a6939815dc75f80e460b |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/85ac49d4cfdaedb52c6d267a10c313755909f5cf |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/38ba2531eeeb4a7985eddd2df8bfaf0b56e6a687 |     
     powerpc |                  mesa3d-18.0.2 | NOK | http://autobuild.buildroot.net/results/b045488d880a4013ed82937e7115b7636867e01d |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/99d7116ed7fa1faa5f52d4c5e87c3fa284a67cb1 |     
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/59625daa154e3136171dcb89bdc3b8b31dc85021 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/e0595aa250eb6543e7c3bd36dd287ac311076d18 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5afc7d57c5f51aec7fc8aed517a15361c2bf2aae |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/19e65a2d23d4c2005e34ec80ba3ca634ee85dd15 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7f88eae74058ea57eb5efb7b14bfc3776fc4d81d |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/d8941ca0c11a22674a3e3698b4c35b8de434421f |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e58ae0f0cc603d993adb77fa07f044f0ce5a8eb7 |     


-- 
http://autobuild.buildroot.net
