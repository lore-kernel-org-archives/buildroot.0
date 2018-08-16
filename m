From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-15
Message-ID: <20180816060018.3D0A920CE6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   1 |   0 |  16 |
   2018.05.x |  18 |   2 |   0 |  20 |
      master | 188 |  13 |   4 | 205 |
        next |  50 |  11 |   0 |  61 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    links-2.14 | 1 


Detail of failures
------------------

        m68k |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/b8670b66528c592b5c876d316f330c1e87d88797 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 
                    sox-14.4.2 | 1 


Detail of failures
------------------

         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/28c0560205dd26de7a89ace0d0eaf5ec744479b3 |     
        m68k |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/79ad4a78ba66db652a3a5fb8a74822e8c33b36ee | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
                    f2fs-tools | 2 
                  zeromq-4.2.5 | 2 
               domoticz-4.9700 | 1 
            ecryptfs-utils-111 | 1 
         host-cryptsetup-2.0.3 | 1 
           host-libselinux-2.7 | 1 
                host-libsodium | 1 
                linux-firmware | 1 
          openpowerlink-V2.7.0 | 1 
            qt5location-5.11.1 | 1 
 xdriver_xf86-video-ati-18.0.1 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4a73cb36a1f7544ef506ee5577297bd71164d151 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/51ba3416df8f07a3a683bc6af147fd5307ccedb3 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e5cf682e93c6c2ae1345854434fb6e6a7bdce74d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3222d81e1df90a3f149d7829a4565fe55c815bd6 |     
         arm |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/777417f783dfea36abb84c25abce4163aa96f87a |     
     aarch64 |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/fce26dce3a7c7deb748b08f40f406ddd020457cb |     
        m68k |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/83fc72b066c3278e126616ed29c7545d648725a0 |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/3867c1dbd359fb20d6045e53af6600710e61c3ff |     
        i686 |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/93b300a62f2ddbad66eab08e25fc3225969f224b |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a82bb0c0b22ff24263ad7a7d165b21c0df7b3b1d |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/60cccd5c09e70ed77e8c985944f09874e7b6b1aa |     
         arm |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/0c4f006815c5d25f127dfd7965f8f95694fcdcaa |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/bfb39cde64de77e68fbc381f6c6f5f15579e68d3 |     
     powerpc |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/fa01513d28d896ca8819966c5b1ed5c35283e92f |     
         sh4 |  xdriver_xf86-video-ati-18.0.1 | NOK | http://autobuild.buildroot.net/results/6acd5ad820a47fc3442d3e3a5d8d72b396fb6e41 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0868b2f8c31a2013a540daeee4ffc422e3c19dd0 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8a9d80f4ad79053bd0f7ea33051b30e29616448a |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            host-lvm2-2.02.180 | 7 
                  boost-1.67.0 | 2 
              glibc-glibc-2.28 | 1 
            micropython-v1.9.4 | 1 


Detail of failures
------------------

         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ccfbba01c2609d03fb56bd96efe6e3318eb8f257 |     
      mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b0dbc08823cbf5f8ac1e865053ba0348f96b4b00 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/aacd9dda83cb152f1ea2547492fbb16252fa7562 | ORPH
        i686 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/7a504385d37fbb1626746a99cc3a68a0f99b4709 | ORPH
microblazeel |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4390b96ca2e9cfe227ccd50250c6081f920be5ef | ORPH
    mips64el |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/57e2f53baa873f63badb9ac9d17789b0517df9ec | ORPH
        or1k |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/f24da147c19df65f25e6f61d52ad005f202e0e0b | ORPH
     sparc64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4ec9f332f60fbb276ec528e0aa8a4b1dcbab66fa | ORPH
     aarch64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/9e1aa2bd93629bbf9a33f18cf6d8bde8a56807ef | ORPH
      xtensa |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/bbd250dd5ca5ddd18a4b2f32e37da41cf1bbb9a3 | ORPH
    mips64el |             micropython-v1.9.4 | NOK | http://autobuild.buildroot.net/results/dfd43f694829fbc609d00fa46b60c5b329a8310e |     


-- 
http://autobuild.buildroot.net
