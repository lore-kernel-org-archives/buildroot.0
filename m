From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Jan 2019 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-19
Message-ID: <20190120070028.E9166209BF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  37 |   3 |   0 |  40 |
   2018.11.x |  26 |   0 |   0 |  26 |
      master | 193 |  67 |   0 | 260 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
       host-libunistring-0.9.7 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6fb109ad74de6cd361ae65098f76126c5fd086e0 |     
     sparc64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/5d5dd9852f4dce529f4792e43ea4c78388970f59 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6038784fc249e010722a723cd76729544a15ca77 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 10
           tesseract-ocr-4.0.0 | 7 
             host-grpc-v1.16.1 | 6 
             libva-utils-2.3.0 | 5 
zbar-b3b4e32b55f570372fc3af... | 5 
                     pcre-8.42 | 4 
                 gnu-efi-3.0.9 | 3 
         libcpprestsdk-v2.10.8 | 3 
                  libssh-0.8.6 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
                 dmalloc-5.5.2 | 2 
                  ffmpeg-3.4.5 | 2 
                  libftdi1-1.4 | 2 
rtc-tools-33ef4aa1c92b0c92a... | 2 
                       unknown | 2 
                civetweb-v1.11 | 1 
                 gnupg2-2.2.12 | 1 
       gst-plugins-bad-0.10.23 | 1 
                 haproxy-1.9.1 | 1 
                libkcapi-1.1.3 | 1 
                  linuxptp-2.0 | 1 
                   netsurf-3.8 | 1 
             stress-ng-0.09.47 | 1 


Detail of failures
------------------

     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/b9cf8da43e94fe51c4bd8041031f89311fa1a618 |     
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9464ddbacabe63aca7661a7da93083425248006f | ORPH
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/6ffb191ca31ed7b774fc7b3e7d5373b678e39fc6 | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/245e6380b8ebd78ebfb7be40f6c7f754dee503a0 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/fa946941012eecb50d05ab72d85c8cb93f345974 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/098270e77fe1562288a6a4855e775d8f9c2767de |     
        i686 |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/05b8d62043f3147c008c69c3b699d719589ff6b0 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/0685b9c477f916bf74250127028f6c0ff9a676b8 |     
       sparc |                  gnupg2-2.2.12 | NOK | http://autobuild.buildroot.net/results/18f2a2f07a9e28963e485be7cefb552017580c6d | ORPH
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/94bbfbd44126fe0e8e44424df43aa16326a16fd7 | ORPH
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/0731978539d723b7b23f173d71bae4557b82039e |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/53cdd5ed0f15bdc7d420508aeaa4b0ec8e0643a6 |     
        or1k |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/c0ed4fea4044ab373821e730dd2e8aac91f16999 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d2ec4c87c55e9071d0b8f3edf9261a37052b0d74 |     
      xtensa |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a46370bc46b6ba3b4f287227fbc8a4bae9e46b2e |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/929aa01541e04b1ad17abe02aa29b9c74893050b |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/855a23316a45e4189598f6a1506ded2fe030041d |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/eccc1aaadd868c581a1cb6e0a696e99411bb83e1 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/5a9c4d88f09be07aa30406d5ccc4c0205ea97f12 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/95c24b899198f44ee1016156df63106ac53a89d5 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/1091872e2b77d789e361d1ddefd235c738933c55 |     
      mipsel |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/7dcacda751b1c88fcc4b3dc46eb67709bac0e278 |     
         arc |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/2959f0bbbb1427ee1e5710194763af08880d6834 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/be7bc70bfc4dd7e1fb5b9e589c0804dcd775e197 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/b91c0c2865bebbd82baf78509afc6c368848866a |     
       nios2 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/757a1df464ba11d811ad7257823cb393b323fe9c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a8270dfda94aea729373389ca3773f20537c54d6 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b6234cfaeec51b62a74e09427ac75c300ef7808b |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e224337b7af09568a7791dcbf6ae623d09638b58 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/4a0bae73c8ec66a834d53a43d327fe940966ca14 |     
      x86_64 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/485345684e79f54eaa627358f18e1427fc9f84e6 |     
      x86_64 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/35525c8c6971097b8fb8667dc3b0e972098a201b |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/64d9b79de5d31eb5a0c219081479bebb1f2527ed |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/f27bc7fc2c05bbfd3603ba0bb6bb57f0cd4c9f26 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d6a33fa4879839cc310f1f5d50a89a44f50d45cb |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1248dcfda2152dbe11a3fbb73cdea0e25c754f2e |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/4e58f96ae051634779728456e23c07f3abdfc4d4 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/a5daedca6742b6841ebe383b60d4e24c502fb42e | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/49ce0e04d3e79237fc867d44be0f0303b02cae98 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/0b6593fb42d64701dffd61255edf661cd0b8af0a | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/361bda979e92327a45db796edaafc992eaa74dc7 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/84141cb14e388985891c4c878b5b8fc9a68fa954 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ccb59e1cf89d11c7f7782146b2940d560572a179 | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/275fc3f53d62bd00c81d4f44a19c4c825dc2425b | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7aaa791d63e4c93ccb39f2c29964c9840def1e34 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8a2d964be9146a8c9718301910eea0e6d6b3fa46 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/023fba024a971bb92759366c6cd522852adaf551 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5b228d47620784ae547b4b1703f426cb2fa48f69 | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a5f0849c596458b7a503863a8dbe2282189a7fe0 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/489f10fa4baca438bb8828e01a09c7c7a1947c1b | ORPH
         arm | rtc-tools-33ef4aa1c92b0c92a... | NOK | http://autobuild.buildroot.net/results/a5b25b1dc465ae357586ed952aa16136fa51be5d |     
         arm | rtc-tools-33ef4aa1c92b0c92a... | NOK | http://autobuild.buildroot.net/results/1877cfbbe37ef15c16cec5d6ad6e3d4d60bc3cbc |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/82a3c4cf7900cab074b1151455ed16cb53861ed9 |     
      x86_64 |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/8acf77d94fd255027e8ee9fa60795341327abe38 |     
         arc |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/2cf06d8d0d0925e0ae6a7f7ce20ae0367ae59b7c |     
         arc |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/fe5fd100558fa2fd692a1edfc204c38a77e1b953 |     
         arm |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/d2b229474ad44aac4221d54c1f364cfb90a25a5d |     
         arm |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/8dec651f7bf601fe2603a11621f6d289a697ea87 |     
        i686 |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/336e511fb897e78553b806dd9b99630cc2136e75 |     
         arc |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/6c9e2d83794b051bdec299e8fa2053f03f4acf9a |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/1a12165921bf70faad0935c1416022ebf749efdd |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/f2397d74d76d142b913ddf100bb8637a9620e860 |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/6a6a1cdae69c89e048b476ba3e61078f0ac0ee0e |     
      x86_64 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/df9de8d6f79d74489ac6c4f72cb892fb8e3717f5 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/a3561f8bbf57e2785fde61dd3081da9e278bd85f |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/536baa2d544e1ce81eb42a7ddc84086d67d78f3a |     
     powerpc | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/d7b244cf9488eafb59ba8575f17884f4f8512db1 |     


-- 
http://autobuild.buildroot.net
