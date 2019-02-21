From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Feb 2019 07:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-20
Message-ID: <20190221070046.6287287D46@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.11.x |  20 |   1 |   0 |  21 |
      master | 219 |  38 |   3 | 260 |
        next |  52 |  16 |   0 |  68 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/8a191f6a4b6135cbb535ed52d1a603333445c95b |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libsquish-1.15 | 1 


Detail of failures
------------------

        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/e84950620e3c5ac5d34fb7bb2e0a45925dd004c3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 7 
               runc-v1.0.0-rc6 | 6 
               madplay-0.15.2b | 3 
                chocolate-doom | 2 
                   glm-0.9.8.4 | 2 
                 ibrdtnd-1.0.1 | 2 
                  libssh-0.8.6 | 2 
                   mpd-0.20.23 | 2 
                qt5base-5.11.3 | 2 
                gerbera-v1.3.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
                      gzip-1.9 | 1 
                  linuxptp-2.0 | 1 
              lua-curl-0.3.9-1 | 1 
                   luvi-v2.7.6 | 1 
                mongodb-r4.0.6 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
               openldap-2.4.46 | 1 
reaver-9bae55bd30b6d46b42da... | 1 
              spandsp-20180108 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/c1ee2574c49630549633e709c5054c2db4d0fffb |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/6943f9ee7d913a582927dc83a53a39b1e5131ac3 |     
         arc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/346de458945d90138c71d3e301230f00a387abd2 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/0d47e6839a3fe23d8f3c629f232a91509900674b | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/193c4b462fd05844e5d08c68b46ffa23b41a0a9c | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/09cd00bd34f3c517f3f79fceb100faf7911a6bee | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/f0dc4f4e8c59c3fbc60b1e2f09050e7934482a91 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/ac9d107ccf8a6ae678eb0e76b05caae86463ccae | ORPH
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/370779737ae41a2d889d1449f8227ee44192fce9 | ORPH
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4f2785763d2cfd6ce2cd8fbf7e7ed54a1e5a4a33 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/3b700c3813e0befb0059c41cce416372fb53de34 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7b55f13090069bd5ef7c05a5b9f8adc70572e4a5 |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/08aaca55174c6a4d2a1ebfa616f5984fedaa0a67 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ab01ac1809acb160cc3a74582e0920df4c62da01 |     
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/7fe1909101156f6b031581ef93e1c985ca78e6a6 | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/0da1f05cf7a05ba14f351c5061c40f1593c8e384 | ORPH
        m68k |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/f3e6a614b7f7fde2a1ac06955633322fa9efd918 | ORPH
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/12afc8ce3c02259cd82601db200651857ed51044 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/6eb4e2c9bd3884ab0152ddf873c20e62f0941181 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/07207b0a58a08bf7c2cb78345a58244b5e6aab0e |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/f163c7141de4ba4014d870ebe0a64115e2782cf8 | ORPH
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/294c6ba19d0dc7cd475a25dc582d047457bee9e3 |     
        or1k |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/c8d4538084b821a84bc492454e29c62192061341 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/61d6baa0d056665319afc77db754388f0c56d128 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0dd650e5cd1ba23332e5da360bd28a93f427aeca |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/19328d87d804681ea3408f7c57ca45ad5c5466a8 |     
      mipsel |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/f0925ea0742a4093b6dc94481d27fdd80cb2e6ca |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3e9d1085a72672c3ee089af2812a7f13227c8dd0 |     
        mips |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c19ae64af6ae5d001f7fa50970884a1800016ddc |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/b387cc4a0cb69cf68310f728c45b8f42813449ba |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7fc795676561e1176b9197a7985888074deb80c0 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c300f3ada6ee0fd011f919799173febeea783b04 |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/2d00b5924460b1e659946998b6ef27a88fbc58fe |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/7690c709d363430606b0901ab2482d44c6c66b55 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ebf7808ee3397bbe108c4f83c1245f4da3fdf459 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/b1cb9479bf2e2d5226a53cf3a6f65fe7ce28f20e |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/3229408a16bf1b4ed7d249012cd558d214e55d02 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/f7602976331ea4bf35f40f4a984dbba0cf56a2ac |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/2d35536f8d701dda1c6eab4e41fe57b6ea92390f |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/58f2e7f74f159659fc93aa458c881cbd02ebe58d |     
         arc |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/3b727b86af99074f929b57cb0911acfa2adad869 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2019.01 | 4 
                    ncmpc-0.33 | 4 
            optee-client-3.4.0 | 3 
                  brotli-1.0.7 | 1 
                 haproxy-1.9.1 | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/70755ddee0afaca3e06a6f66d16b7838fb812a1d |     
microblazeel |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/fb342c7f16e8d2cf5b2900339ee889e9b1493736 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1e23c9a7de8159df5843b8dc4c52ea17279b9767 |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2979875e10aba8d300c19e29083bad3fa2839ec8 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/48c5683dbf2d1071d5a3433015584d10ae59dc0e |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9171bb3ac872659b90d83d452c87a6343f667568 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/f409426a499f951420988e15acb4fdec0b809505 |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/3d31b03202f229b88c21e76c74ca9cf014f93b94 |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/e64e5b936fe58a77dee0738585ad8e06953d8f61 |     
         arm |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/1f4d3e6863e7fd19871e2d3a1bba8f73c5793aa2 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9ccff73bf2c1a5ab384e05a67d03b6e3d741ce2b |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7abf8c929d061031998216821e52f7b177cc7d67 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4ce09919be9fd00cf83d13a6999d555adf8a7473 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/cb38eb6f4b3efaf1e62737ea9e1262ea405a3829 | ORPH
        mips |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/970d7de190b8bd4be8634ac3d048c0b3e667340b |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c26b7e99b94fe74c0ddefac5b26f8ac68ad05e39 |     


-- 
http://autobuild.buildroot.net
