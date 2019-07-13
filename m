From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Jul 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-12
Message-ID: <20190713060046.6611F86130@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |   9 |   0 |   1 |  10 |
   2019.05.x |  10 |   1 |   0 |  11 |
      master | 101 |  29 |   2 | 132 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-10.15.3 | 1 


Detail of failures
------------------

     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/bb024e15eb9adf261dab40f75d769713b1e069c6 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     glibc-arc-2019.03-release | 7 
                       unknown | 6 
           host-nodejs-10.15.3 | 2 
              iputils-20190515 | 2 
                    proj-5.0.1 | 2 
                qt5base-5.12.4 | 2 
                suricata-4.1.3 | 2 
                    efl-1.22.2 | 1 
                 haproxy-1.9.1 | 1 
                 libv4l-1.16.5 | 1 
                         mimic | 1 
          qt5multimedia-5.12.4 | 1 
tvheadend-8f1de1621d78c9143... | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                 xlib_libXfont | 1 


Detail of failures
------------------

         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/47ad25a9da6e4cfcaef21811e992c5146accaa93 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/5f2cc8d9f7e2da6b6fb8a9e125c1a4df9666d78e | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/c2c670af45fec4a74b0a1673bafbdd635a9fb8d7 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/d59c7eb7ce5e3dbdbc6c8a83f6a8ce095c04f8a9 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/ef85e76a235cdbe001613a94d0b213e1209eb609 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/daeac9ffa361f819bff1f375a87586ea6838967c | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/fe0c67ff5246e019b567146f3f7ed77b83916331 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/d6404ea42cbd50cc30454b1d4e7895dff1aa1d75 | ORPH
         arc |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/387c0ffc7d76f2b0bf3d8f1c1b412f6d1477d6c0 |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/98b97812f10aaf0c697eeed04d75c88af7ea7e4a |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/cf1a16cff99dae017c8a29198c40904987f40cb7 |     
      mipsel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/d10ca2500a1bdd38e66e73a6efdf6ef703aa29da |     
         arc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/948aaedca5df79ceca9c170422829b03cf1f3dd5 |     
         arm |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/a3c4a0e3acd2a98d06666790dc81043afb5d10cc |     
        or1k |                          mimic | TIM | http://autobuild.buildroot.net/results/0b5a59c799f52b61d1dd3f8a03f8446acba524cb |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/739898d03340dbe85a36157e4264363e6e39e22e |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/034388ddd9836e7b8fa6fa7414486186ca5277d2 |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/29921d0ab26fb0ac4265aad6f186cd95322d798c |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/d24dbd4a128f7300ebe2a1c8c4c9c00ceb7da260 |     
      x86_64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/87f80160f7d89b74790efa36445948b6c168ba8a |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/73d2fb8d685ff8bec7317f216ee4ed28545e9409 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/15d1591b691728926ec2473a01a19ef1161587d6 |     
      xtensa | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/fa092457be3d744ca4f9712361dc0e2c8d37ea72 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ea9e12650c71479c026ef467220bce18da3bd847 |     
     riscv32 |                        unknown | NOK | http://autobuild.buildroot.net/results/fad8f2bb3112d6e3cc1efef3aac44516f82da958 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/63ca481b57984c36e10aa8034e5795c837319fd4 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/3d598e75ed11e0c66e41d1cbddf1cb3f8d078a65 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/f7ffee0359405fef1900dad2ddb3a2c2d3095924 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/2e485b4c9b3f266574c8691e6e417517242a6228 |     
     sparc64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/f507360dbb6cbc282ffca105b1a8774c32ba343d |     
microblazeel |                  xlib_libXfont | TIM | http://autobuild.buildroot.net/results/7c64becbf06a1e00e41b7ddb95dd0c65bf364eb7 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       lmbench | 1 


Detail of failures
------------------

     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/784392d474bacfc84e96b9ccdca945bcc37975b8 |     


-- 
http://autobuild.buildroot.net
