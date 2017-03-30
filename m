From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Mar 2017 08:28:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-29
Message-ID: <20170330062829.DA74920811@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-29
================================

      successes : 198
       failures : 39 
       timeouts : 0  
          TOTAL : 237

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 5 
             rabbitmq-c-v0.8.0 | 4 
            xenomai-legal-info | 4 
           uboot-tools-2017.03 | 3 
                      qt-4.8.7 | 2 
               sdl_sound-1.0.3 | 2 
                   systemd-233 | 2 
                   aubio-0.4.3 | 1 
                bellagio-0.9.3 | 1 
                cifs-utils-6.6 | 1 
             f2fs-tools-v1.8.0 | 1 
                libmpeg2-0.5.1 | 1 
             lttng-tools-2.9.4 | 1 
                 lvm2-2.02.169 | 1 
                    mpd-0.20.6 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.3 | 1 
                    qemu-2.8.0 | 1 
               qt5webkit-5.6.2 | 1 
                  rt-tests-1.0 | 1 
          shairport-sync-3.0.1 | 1 
toolchain-external-codesour... | 1 
uclibc-ng-test-c9b9876cefc1... | 1 


Detail of failures
===================

       nios2 |                    aubio-0.4.3 | NOK | http://autobuild.buildroot.net/results/8d5c2cc0bf7ceec1480882f8aafc9740c082f1a0 |     
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e6a41f3131b059b4a59de0ea22235156fb311b8c |     
      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/996116da9241686110b9525eed08cc5acfd379a6 |     
       nios2 |              f2fs-tools-v1.8.0 | NOK | http://autobuild.buildroot.net/results/18ebd2e6d5239b8c87ca4431fb6dbbe0c21f2868 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4defca7b289e08fdfbc5c527e9640d35641ec4c8 | ORPH
        i586 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/1b3fb1244499ff9eaffb3c6c38727b8a8d6542e5 |     
microblazeel |                  lvm2-2.02.169 | NOK | http://autobuild.buildroot.net/results/7d5e0cf748288ece1446bb798069d429aecb0c66 | ORPH
        m68k |                     mpd-0.20.6 | NOK | http://autobuild.buildroot.net/results/a5912369da4da50eadc4b27dba463bb04741cc42 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/21d21f5deea1a19b7a5019bc659316cbf7312d31 |     
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0731bc04d48fb2809f9344ef5f8086e9cf0ffa83 | ORPH
     powerpc |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/bf366018fab79b625bc3413d13b38939d652f834 | ORPH
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/6ad05bc7c6cbdad12ec545fb2109b894e3841c2f |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/93bd158acf46687b743560625ebaff645b3aa059 | ORPH
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6743c879110a353f5c237bcfdc24d9b937577a3b | ORPH
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/2c1b9299aab72902b7623de0c3aaee06f2d3d006 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2fffc3ba4fa0cfc2664eb6e789ee1d0c3f9d3026 |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/aed08afb6dedd1ccd3e84f379fb2fd8be453145b |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6e2f810fd766312a38a92a1b5d7cd04766caebf4 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d50372904bfbc6404f83d249725b6b4ac0385052 |     
       nios2 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/ac8c215e5539fbd91676f99f6c18d95c8f4edba1 |     
       nios2 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/b6a514be8686aae1d3277825a67c1add735f018e | ORPH
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/ed97c2c2b21cd81e82ada9ae4dd547fc4d3f8f34 | ORPH
         arm |           shairport-sync-3.0.1 | NOK | http://autobuild.buildroot.net/results/122d6cedf0205e8db27d498d6a2a839e11e7b6f2 |     
         arm |                    systemd-233 | NOK | http://autobuild.buildroot.net/results/c6297c61d8c2d3ab9be77b9d398598adacdb33b3 |     
        mips |                    systemd-233 | NOK | http://autobuild.buildroot.net/results/22ff106a4626c84422d9a3e69aa9c8fe7c76938c |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a5de5e33e320ffa6f36b1f2b4c438100ec3a80bf | ORPH
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/fb1cd422a999e277946cff40792dca06112ffb03 | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c6436611103bb073ee0201d4b2dfe4c4c26861b2 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3a4547c3259b94ed04835b9273f37a1ce5b4cf67 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/a970e1bc09ca5c79180549f888b7400cea04be61 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f55e7882978200049338890279d254e07be5d2b7 |     
      x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/1aab2b7628b0036d34b2f59a975215706307b579 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/273f355c619a7cd942a2e5ee40b5afb7f1fa52eb |     
         sh4 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/0b8e15c6f592b15188a951c18f9a7ab1ddf81931 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/273eacfd97bac3e5b9e31bc4168dfd70ae9339df |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/6838d1b80ac288075cc90bebbd227964384ef400 |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/f2cd7cd1f8bcf67c66fb713ef6b03f1f01a74dc5 |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/db81ff5e3009aa12917287be1a9bd1ae6b1b7fd2 |     
        i686 |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/92153b5e6a76ed6e0e0b21357f63248385508168 |     

-- 
http://autobuild.buildroot.net
