From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-18
Message-ID: <20180819060011.E1CB320DE6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   2 |   1 |  16 |
   2018.05.x |  26 |   0 |   0 |  26 |
      master | 183 |  23 |   1 | 207 |
        next |  47 |  19 |   1 |  67 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-cryptsetup-2.0.0 | 1 
                  samba4-4.7.6 | 1 
                       unknown | 1 


Detail of failures
------------------

        i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fe1cb8c03508f0413b7dfb31580b6f44ab664b52 |     
      x86_64 |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/4cd5eb614fd7399225b20a3832fe9f7b60cacb86 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/5e7a59e7fef8dfed52b4657e70822712564e8946 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              python-pyqt5-5.7 | 4 
                qt5base-5.11.1 | 4 
                     php-7.2.9 | 3 
                  boost-1.67.0 | 2 
               aircrack-ng-1.3 | 1 
                    brltty-5.5 | 1 
             host-gauche-0.9.5 | 1 
           host-libselinux-2.7 | 1 
                linux-firmware | 1 
                    owfs-3.2p1 | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.6.3 | 1 
          shairport-sync-3.2.1 | 1 
              wireshark-2.2.16 | 1 
                    xen-4.10.1 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/8325fa01aca1a816e107044ddf79fb2a36a5862b |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9c373d0b5a1a59e2271d71c480d55a90a67b84cb |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/097cc1809f78369208d4df2bbe091d69391c6afd |     
     powerpc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/b3667ef1d15245c05d5aaac30a0352fff4cb2734 |     
      mipsel |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/a5cefd76d4cd54512597c811002b41d22aaed910 |     
         arc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/c3272566bb808e43bb77ec59cfe596f7e0fe9a64 |     
        i686 |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/63767fc6219894d8e7b7bee3648c4f59128d69cf |     
microblazeel |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/d369e2c8b90558e84ffd5a44cfe1308111c88637 |     
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/15049fe21aa2c126c271139adbed6467bf185c4d | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/aa06c788df158172bffbfdff2543c45b5b651a88 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/a48ccecc41915e0e12c652113334439801ffe501 | ORPH
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f831180ff7bbed3ca3610d3c6160b64862f07ded |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/fe8a5deeba3e96b719f81fe8d17a3d424b60524e |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/1f1e92374fe71a1d4343243db5f530c33db06698 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/8df926f8096f7d36b2d0cf908191eacf8f68721b |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/466375dda01a618addef84eda652b3a2feeee9b7 | ORPH
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/e1e9dbd376bfca869f8489c3735851107b4cce1b |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/fad661b963e050fbdf09fe59473d59e40e64ac9c |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/4b7d943a81242295fdba9fb845570c71b1c46733 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a5c70417c298d60758d6f9f17a0792530a66eec0 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/b5474a3e0e98b9dd08539ee9ca812befe491903e |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/53d21686780aa2485745b59e812b6280dd39f1c5 |     
     powerpc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/f84a9f9b5a8fc6faf23fd4c3cafa2e1fcc5278ab | ORPH
     aarch64 |                     xen-4.10.1 | NOK | http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            host-lvm2-2.02.180 | 6 
              glibc-glibc-2.28 | 3 
                  boost-1.67.0 | 2 
host-python-vcversioner-2.1... | 2 
                    f2fs-tools | 1 
              host-cxxtest-4.4 | 1 
             host-meson-0.47.1 | 1 
              python-pyqt5-5.7 | 1 
            python-pyyaml-3.12 | 1 
             util-linux-2.32.1 | 1 
                     vlc-3.0.3 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d9feba90f9ad59f64edb69f7776ec5933dc9867c |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8e979944a3f48e0a021f7b994e60e644f878e1f9 |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/775a5914b59a2aa5b349c092be56cc14da8612b0 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/8b6d63d74578b685493f30d0897a96efd9b8c2f8 | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/88467eea8474366fc8d247fe240c0f392d2c8b1a | ORPH
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/eb0e8a23749db3476a782295ced5bde0e82d6a4a | ORPH
         arm |               host-cxxtest-4.4 | NOK | http://autobuild.buildroot.net/results/98e0f97655cbc92939a78998e6aab663b18471b1 |     
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/bfd85382e6dfbeff405e94af113d9317e1b473a8 | ORPH
        or1k |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/5973f83d93dd2d1b79ca1536ad7e3a025e3d10f5 | ORPH
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/8f624e502a5a0d7ce892a269ba48ac7a0b31d199 | ORPH
        mips |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/5f8c139c7c21fdf4ed346fd0b84df2db28391cdd | ORPH
        i586 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/06f14bbda4825ad791c192b65407ebb17841339f | ORPH
     aarch64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/3ca4a0909da0897681c5efbcd4508906ad7ef729 | ORPH
 powerpc64le |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/129d3adbf84ccee64cd7bc8e1cc585f03c374e75 |     
         arc | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/e6134309e1eeb3b3cd8883a2642c002fb353f5b5 |     
         arm | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/2b8d0bd5d2538af5e6707696f83b32f808e73d40 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/7ba82b05d5b675fea7d580dc9e9fc7e2ea3d5de0 |     
microblazeel |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/3f28a636563e3e12d5cb1f5c47de5ad4008c2e2b |     
      x86_64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/064270b27d3c97852f0c9578b990610de641af42 |     
     powerpc |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/7445bdc2fdcb28aa7f58c0249653329414e447df |     


-- 
http://autobuild.buildroot.net
