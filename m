From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Apr 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-01
Message-ID: <20180402060013.22C0A2075F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   5 |   0 |  34 |
      master | 271 |  67 |   1 | 339 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 1 
                 mesa3d-17.3.6 | 1 
                     php-7.2.3 | 1 
               qt5webkit-5.9.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7330e948426ba912191db9a318ead833c37e8708 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/96994608aea600702078f316dc7ecbf9cedce522 |     
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9f98871b3dcf992266c9cf8afd26237c699d6a2b | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/6487a068ec4e08a398cf487e0944819d2bc3d1d7 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/ea0ffe3717225bf1b62a6703788e533cb23f8d7e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libbsd-0.8.7 | 6 
                    liblo-0.29 | 6 
                    ncmpc-0.29 | 6 
             bluez5_utils-5.49 | 5 
                  udftools-2.0 | 5 
          usb_modeswitch-2.5.2 | 4 
                 apache-2.4.33 | 3 
                  cc-tool-0.26 | 3 
                  host-go-1.10 | 2 
              keepalived-1.4.1 | 2 
                libcurl-7.59.0 | 2 
                  libkrb5-1.16 | 2 
                   libnss-3.35 | 2 
runc-9c2d8d184e5da67c95d601... | 2 
                snort-2.9.11.1 | 2 
              tpm2-abrmd-1.3.0 | 2 
     docker-engine-v17.05.0-ce | 1 
docker-proxy-7b2b1feb1de481... | 1 
                    efl-1.20.7 | 1 
gst1-interpipe-10dba89eecc2... | 1 
                host-libsodium | 1 
           libfreeimage-3.17.0 | 1 
                 mplayer-1.3.0 | 1 
                     php-7.2.4 | 1 
                prosody-0.10.0 | 1 
           python-numpy-1.13.3 | 1 
             qt5location-5.9.4 | 1 
               qt5webkit-5.9.1 | 1 
                    tekui-1.12 | 1 
                       unknown | 1 


Detail of failures
------------------

   powerpc64 |                  apache-2.4.33 | NOK | http://autobuild.buildroot.net/results/b3ed062ffe2cbee345ac2c53fb37895d0d4092fe |     
     sparc64 |                  apache-2.4.33 | NOK | http://autobuild.buildroot.net/results/4033a806cd2ca018f9ef18452a973eea9129d8ef |     
     sparc64 |                  apache-2.4.33 | NOK | http://autobuild.buildroot.net/results/cc13f4cef9cf6f18615d58f1d83b233812f19fa0 |     
    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e8f1ae699eb814dfae3cebcf54015f785e2b341c |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e0ed5fd4f12faf47df5779e17d36bc7b42c85a69 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/a83c176bc7e94c6e35bf0bf0ae94bff689524fc4 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/a32bee3d6c75e163f839556f9ef163615ccaa894 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/3d24fba0c8973a8b817420da34fbdd4d3316e290 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2a194fc8d8b960f2869f30211a218aef2cb71cad |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f686253783eea6a01b3fbd2bfc1fc5e811977f51 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/65e9773b8f5183f421e478bb4bc68a29fbea9c40 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/1f9cd7c48e8c8f41326632a9c0de83915d72c45b |     
      x86_64 | docker-proxy-7b2b1feb1de481... | NOK | http://autobuild.buildroot.net/results/6cadf46553b476505fd16f556126e3ee5f5441d3 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/eb35ac04171876a058828d7b9b04f54f488bb887 |     
    mips64el | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/b187e64a61918f17f69588e2355a03286bc5808e |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5c9fe07757b94129084483393d026ae9538241e0 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d4f3e2f01308cccce71b807f5313cf4aebbb7eb7 | ORPH
       sparc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d7e4c68b1b853de3796337d445a82b615c6910f0 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/6724a6cf315415f07cfc44cb41edcccc6e08fcf8 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4e3c3f605d746b63ea0024ee0c60be0eb5551b41 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/cc87f1c8b0b1c5872df92c4653dbeccaa5e5de13 |     
        bfin |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/46deb0a042c63430f539cd52e6210aeb69bd625d |     
     powerpc |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/ee3ad5172d6a218dfde4cf3e9fecf1906b0fc642 |     
        bfin |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/2a86e978d071a22075f8d5c4dcc614dc65f71cf3 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/626d7c0237594052e40f81f8969169bfeba96bcf |     
     powerpc |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/2e6f144f875d873001ba4fd61951f7f213ab5c10 |     
         arm |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/6b7ebbf70e7e996bd591a4f68819ca5f966b296e |     
      x86_64 |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/8d7bce1df32a9f3f55daf7db471f237926fa05d4 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/479fc6f8b4abdc68148cb9aba1624baae6279374 |     
        mips |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/0353e1443125da1e544d1a98348716bfe67c8726 |     
        i686 |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/d118c3c09f6fc1de26491f2ed480ef28b091dba8 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/2876a84f347972e2230c4b866b0d48a7113ccbb0 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/10d4af2c47bb843c415807641fb13118972557d6 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/bd250762371b78ed385b2d0ba74febfcdf6ff823 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/d0162535f6a42f54d8131a5481bda6f2a5877944 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/ab092235bcc5904475151a1a87a958fc6195f955 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6215f8cb4c20e7a4292778a18aea525883dc62cf | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/827211a8544b759796d4f4bba11b665376a5c879 | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/c101538e801098eb2ac64c1e75feaca9ccaec01f | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b9a23c73b6cbad1f6fc96777e224b6df1da93999 |     
    mips64el |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/47978fe5e5699c1eedee3b7600d77eb2de5b2029 |     
       nios2 |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/1d1fa71fcc51ed19719a6806eef96fd2750a8fa9 |     
       nios2 |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/808c397711483f505a7e5950f051c7f205689ddc |     
 powerpc64le |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/59c3fc686e44591f18cfdd9849ceaa02ed1eb6a2 |     
         arc |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/ee95c1eef1a4bf52e0beff4d57a42fb432857e5f |     
      xtensa |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/7889ba1ac221eaedf729cb960af7bb14336208d3 |     
         arc |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/e58e564ee6eb41ce57cc243f8a9f9c1d298415c5 | ORPH
        bfin |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/2d0f97e41cc1d4c9c7a0eacd4eec8bad6f00bcff |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/1c6b1190e2f0a7024a4aacb1310d61a022408c00 |     
     powerpc |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/9a3e07a08e950dda92e26cf387f62e8836ba4e01 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/5b8ed9ddb9a6b1b1418a3c5291ebdbfea9fe18ad |     
         arm | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/8062546092951d5a6fcf4bbe8b11d247fe930618 |     
         arm | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/f85414244c25aba07a05109b5cd7658ae44a64ea |     
         arc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/1892f3208aa840d5c5e4801585b7d0423c5962d2 |     
         arm |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/971cd16f5d51a2254558ea8ace991182cbffcd64 |     
microblazeel |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/11045ac9e7210ba7e8c99e1a39c39cab85c5db54 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/a47941f3575439b76c263b571f760ac57e01b433 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/56c67843ba5a90814b4396315c91126d12e766c5 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/651cec20c857139dcb9218a30fad697e96276c28 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c857dd2a54679a2d6322ed4cce3d846de81b016b |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/cc586c96b7114215754a117d3cef3281aca60c6d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/a3c160f26c45b320d6b8a5da26d4c43b012a87b2 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/080c18356ae08f285f23b8c233de39c5ea82179d |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9cf5883d1ed95d3d76d529a9a25f0e600adf25cd |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/3c57a46ef29492f996f5a4211130d01f7fdeeace | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/b24402aade0d5de90c3843caf4b6305de3544e08 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/e4db7b0db7751f314cc84bb6f6f9356b5c6dc535 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/4b88aa7804148b8f26a87aa5aecc38ce7cd0cb1a | ORPH


-- 
http://autobuild.buildroot.net
