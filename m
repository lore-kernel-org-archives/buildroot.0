From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 08:00:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-25
Message-ID: <20180726060046.0565C20949@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
   2018.05.x |  20 |   1 |   0 |  21 |
      master | 136 |  32 |   1 | 169 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.5 | 1 


Detail of failures
------------------

microblazeel |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/a6c739c2b93e74ee9413039288eaba7d76147e22 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
                  samba4-4.8.3 | 4 
             gnuradio-3.7.13.3 | 3 
            perl-net-ssh2-0.69 | 3 
               aircrack-ng-1.3 | 2 
                host-dtc-1.4.7 | 2 
              libostree-2018.7 | 2 
linuxptp-303b08cbf55096aba5... | 2 
                qt5base-5.11.1 | 2 
                busybox-1.29.1 | 1 
                cutelyst-2.5.1 | 1 
               domoticz-4.9700 | 1 
                host-libsodium | 1 
                   libnss-3.38 | 1 
          mediastreamer-2.14.0 | 1 
                  mender-1.4.0 | 1 
               mono-5.12.0.226 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/d7ff3081d5f7a714c9ab08770bdef18d2d90d04d |     
        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/9fee6340415d19b6371be4a2127a8917efc68ba2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e8798eb70f80b3809a767a7f7fa6cdd12f5a82a6 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/104467f1cd87a376695201e4ab8714ba3b77023d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/646863159fd14a64824e0018173dbef31e482f88 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/df27cde0da78c84559c53153748185d58371e209 |     
     powerpc |                 busybox-1.29.1 | NOK | http://autobuild.buildroot.net/results/54d94ab71621cbffba7fb7bccf89a7c1d447c815 |     
         arc |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/01187a91631a44f20f10c10530d4364a11dca377 |     
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/ba81772e381dcf2746ef85a7614807f5e8661343 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/939e0e71d9032bd7a1e2024f148452ca354c89be |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4a77de86af8d1a442b8c73cf6f123f1ae072beee |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/511e28a52306857e528ccb593f49e434500ffd37 |     
       nios2 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/f9fe82ad087528dccc72d26a7b4ab06a5c966cdd |     
        m68k |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5e2b3940410ae9dfccc5015f0f3b97095f7077b1 |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1deadbc40f97e9d5e51b917487f0de24dcfd8fd2 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/40a755ca4ecb6cd773447c757e221e35f1de87fc |     
      mipsel |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724 |     
        i686 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/05d7a1bc67e3279cd97e8cce455768f4ae5e327f |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/373121e2cc8a14ef268e502cbbda82e9759ae3d3 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/ca6e9c2626525cacd06f1263f3d655496a342bf1 |     
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/51cc21cafe02011e11278c0498fc29b5e7118dc5 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/6c0ea764bc06876909b7ec94a6851ec03a5f9e0e |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/c9f92d1a80d4a2f7122a7028d32ed22ab884be0b |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/390528feb959f57007d54c0981f3bc04958d5077 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/70bc2b444a94a90312f2e32ab7c98bffe0bab17c |     
microblazeel |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/421f6ce70dfbd00986e609afd0461b07e5bf6a71 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7c8d58cf4149902be9fc167c85d8abff4057e8f6 | ORPH
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1327c78bb7eec5a6147f7ab0b1a5edc9b5d1c108 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/cde4bb43aea9f514bef6d7d85e2311a02ca073d8 |     
      x86_64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/785be48d9050f4ac1055a8d0a1e3f047a184dd51 |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/02c127df53c32ef255ccc4385dfb72ddc767bf39 |     
         sh4 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/919644d38e78ba18acb6627b52d4aa2fc18c5b8b |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/0c67f3ce0e41e5ef93b736d560edd27ed6a4c2cd |     


-- 
http://autobuild.buildroot.net
