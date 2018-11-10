From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Nov 2018 08:00:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-09
Message-ID: <20181110070019.CEFC0224E7@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   4 |   0 |  27 |
   2018.08.x |  19 |   2 |   0 |  21 |
      master | 168 |  24 |   0 | 192 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 2 
               host-efl-1.20.6 | 1 
                p11-kit-0.23.2 | 1 


Detail of failures
------------------

microblazeel |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/2174d75fa8cc6141dc7cb7c67a7f1267f8080c52 |     
         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/81191f37c2eb3aee2ca9bf6cd9778b73ad656a6f |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/b91dfbe77510f5ff316c25c018b394696e7a33ce |     
     sparc64 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/eb1864975100d9e0d64b5f06114b8a02ca915a1f | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                 lcdproc-0.5.9 | 1 


Detail of failures
------------------

    mips64el |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/2e1c6a0553e080c6f6c76afca2992c58ebaf3f59 |     
      x86_64 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/a8173a87287885ded855beb4667ba84b50be2d28 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 4 
                   luvi-v2.7.6 | 4 
      docker-containerd-v1.1.3 | 2 
     docker-engine-v17.05.0-ce | 2 
               valgrind-3.14.0 | 2 
               boa-0.94.14rc21 | 1 
          host-libsemanage-2.8 | 1 
               libiscsi-1.18.0 | 1 
                 libv4l-1.16.1 | 1 
                 minizip-2.5.3 | 1 
                    php-7.2.12 | 1 
                   qemu-2.12.1 | 1 
            qt5location-5.11.2 | 1 
            supertuxkart-0.9.3 | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/c7f4c5c8f15393faf57f115dacc08e49c7887005 | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/0970a67e852b438359b4846cd06a0a015403906f |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/296330fb3bec37b4736fa0e91048c3728c64297e |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/35ae3bbc90703e5f0bf5037b3f45f442e19ea8ea |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/b29806b3f6f19de57fdf2b79b19b43c17e6a9332 |     
         arm |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/4e8ac635e2d7884cff0f1d722617b52c607d65c8 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/59b98b9ce7f9ecea5a8329cd39b3bb8a94fef024 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6682f87b0f2290b0c50e0c1c3fba23b35ebade47 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8219371755d521f034ba2740cd5c14b48a02c664 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c92bdbe2f9f572441ff43433768411f8c63c799c |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/5c4107754758b78c0cefa2d6e7f806a15c308e6b |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/bc30fec83fe714c054e8b701a4a405f2ba6946b8 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/d8440887498480858e6e0aaebda9b23477a0a901 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/fc9d560f183399bb3c26d826375866d05eb12835 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/958729077db22a2c33d38cb55b4e9948be8ea7ea |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ad285ddce30d38a6026c43074938a725b38d0c86 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/964feba6530eee27296dbf0e3b8bcd4c92896423 |     
        i586 |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/628b677d1ceb8b404265d89357225e0a1dce1407 | ORPH
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/d4736a930144fc5e25b377bc1c0baf44fbf8718d |     
         arm |             qt5location-5.11.2 | NOK | http://autobuild.buildroot.net/results/e3709bea6e87ae236fae35d783a9a91cbaf0c5de |     
      x86_64 |             supertuxkart-0.9.3 | NOK | http://autobuild.buildroot.net/results/52bd5c45b0d04a863a2530d388899b3e46494ee9 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/484489860ba1a6ca5950e136e8bcd2e99002ec55 | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/443f3b5497a7e702ef38d23870b31acac88d92bb | ORPH
        mips |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/8cdca627413a595ed48097ace0516991baf17f17 | ORPH


-- 
http://autobuild.buildroot.net
