From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 08:00:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-11
Message-ID: <20180112070005.0CC7320792@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-11
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 188 |  19 |   8 | 215 |
   2017.11.x |  22 |   2 |   1 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 4 
             bluez5_utils-5.48 | 3 
             libostree-2017.15 | 3 
                  boost-1.65.1 | 2 
           host-mono-5.4.0.201 | 2 
                     daq-2.0.6 | 1 
                   gconf-3.2.6 | 1 
           host-libxslt-1.1.29 | 1 
                   jamvm-2.0.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              lynx-2.8.9dev.16 | 1 
make[1]: *** Waiting for un... | 1 
                 mplayer-1.3.0 | 1 
                  physfs-3.0.1 | 1 
                pinentry-1.0.0 | 1 
             python-lxml-4.0.0 | 1 
             qt5location-5.6.3 | 1 
                 s6-rc-0.4.0.0 | 1 


Detail of failures
------------------

        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c3d08946a2f626dee549a5bab9b64309ed5be21c |     
      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3af05cc085eb2b3a89cfde4024bd25632942506f |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/878417583dc627649a5e75b5fc8849469b779bda |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/1bd1f863840220d6b841677af1ccbf9e42a89230 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/cd99e20fd799d477520d4f94ed4e9a6ef604021d |     
      x86_64 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/1f5f47aaada10e4b9c43048c2db8610e3ac8f720 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/523fbcc07373a544399ef2f65675caad08c2e20e |     
      xtensa |            host-libxslt-1.1.29 | TIM | http://autobuild.buildroot.net/results/7a5ed96f2394f936060cd5ea49250fab92df9d56 |     
         arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/5960da9f0365e6c7ec1e04a6b5f111e9ba9beb70 |     
         arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/def25ccc7a35f152d166d5aea9c6d536dbf9f8dc |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/10263af05f9d3ff6cd7ebb4a97c8533097276f13 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c74e392346ae96d4e71de5d77aa3fa00941ce1e3 |     
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/b6b1de452495525706e58ce30e50cac1ac806dda |     
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/034e5974f5a9ae2a83780f574a1a4277082ef5da |     
   powerpc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/4597145d0a4c75151cfce2597187877cb0047bfa |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/4e2e6bc79a3666b29357b6b8945ba99e47747bfe |     
     aarch64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/bcf06e21ab2ee4c92e43c8b82126a2a7b93df611 |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/05b551d51d5bba8e8869f98e4957fa227438aab7 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/75d68ff9da42d61f47d80b463445c12bc51ed1a4 |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/66ae8b20dcfd4ca15e3ea9fd5d0f543df55a671c |     
       nios2 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/048b6f83ee825ce54383fdbf02c21ed8adafd003 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/a7af1796d29b22943d9b3111d643a8c964982f17 |     
         arm |                  s6-rc-0.4.0.0 | NOK | http://autobuild.buildroot.net/results/59f3b6d5fe3e9b561adbafc08eeb1a23f7100278 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/b82e387e8f3c895dd7aad0310d4e0b3dbeeed8bd |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/9481980388e3c7500f9b3a77a674e25b6759b305 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/60e11a3bb90b9f41259e4a970081b72d8b8d100b |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/97f072651a1bcdd92e9558771ad8471f855f44cf |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.2.4 | 1 
                 mplayer-1.3.0 | 1 
                       unknown | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/a16ee7a6975e9a249370c40380983387a9ee5631 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5a276e2a1f7607eca7a026fa081551365728b293 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/49c4859fca5d0cc791e1197b3ddd80dde74aa6ad |     


-- 
http://autobuild.buildroot.net
