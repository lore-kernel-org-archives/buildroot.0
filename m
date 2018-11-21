From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 08:00:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-20
Message-ID: <20181121070024.4211B207AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  14 |   2 |   0 |  16 |
   2018.08.x |  22 |   1 |   1 |  24 |
      master | 176 |  13 |   1 | 190 |
        next |  32 |   5 |   0 |  37 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

  host-xproto_inputproto-2.3.2 | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

         arm |   host-xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/0ff9a3a27984ad91aa33079143bb87ed71bfe7c4 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/9359bcfba117b668604a5b4c5168ff6470fbba50 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
             qt5location-5.6.3 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/14f3ecb33438a52c0612bc6b1edf04c6c691c722 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/0e8a4a9aed924e675333c6e99c5ce53069bddbc7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

libcorrect-ce6c17f1f988765a... | 3 
                  weston-4.0.0 | 2 
                flannel-v0.5.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
           host-elfutils-0.174 | 1 
                host-libsodium | 1 
              libostree-2018.9 | 1 
                     mtd-2.0.2 | 1 
runc-69663f0bd4b60df09991c0... | 1 
          shairport-sync-3.2.1 | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1e20acf0e3f892a87249b23d8d2245e479ed5f24 |     
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/e95635ccff9d2ffc268fdceda123b00e2d71c57a | ORPH
microblazeel |            host-elfutils-0.174 | NOK | http://autobuild.buildroot.net/results/af8a51ebef6ad8d12ed0ac69101b2ccde1cb50d6 | ORPH
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/f50b3634d10d0292866b51e46e6b83b12173478f |     
       nios2 | libcorrect-ce6c17f1f988765a... | NOK | http://autobuild.buildroot.net/results/89a79f78faf03c38e97f9ad83dea4c196cc00f97 |     
     powerpc | libcorrect-ce6c17f1f988765a... | NOK | http://autobuild.buildroot.net/results/06819ed1b38730e76804dd4e6cc6d835bc4cc413 |     
         arm | libcorrect-ce6c17f1f988765a... | NOK | http://autobuild.buildroot.net/results/8387569dc662375c3e680f3853a2400f6457d5dd |     
     aarch64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/fc6435282630e60927f88bf5954805ebbaa60cb3 |     
     riscv64 |                      mtd-2.0.2 | NOK | http://autobuild.buildroot.net/results/b0e7978a997a2aae383161455b5d898b8c28e2e1 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/80ecb7ffa49ca84edd302b34f05bd361120b0e8a |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/839c0ce6475accc1de7e8a180d4358edb6750c64 |     
         arm |                   weston-4.0.0 | NOK | http://autobuild.buildroot.net/results/95db3f4ad4c7ae866b7db4431293c26faa5c1dfc |     
      xtensa |                   weston-4.0.0 | NOK | http://autobuild.buildroot.net/results/c0b4f7c4cee2c11715ecc2ef0cfb42f80dbf81b0 |     
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/e625fd511d1a2d1988c06e08004894fa8adab371 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-2.0.3 | 2 
     intel-microcode-20180807a | 1 
                    sdl2-2.0.9 | 1 
               util-linux-2.33 | 1 


Detail of failures
------------------

      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/59392a0734ef1acaf6c09da37e40d2bd92c48981 |     
         arm |                     sdl2-2.0.9 | NOK | http://autobuild.buildroot.net/results/539cb9ab6c605dc6be73ebe90debab1a998f2451 |     
     powerpc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/bd9005eeb24678aa530179a80bbc99b2176f8559 |     
     powerpc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/feff61dcb481a94f5f030117830984c5e09727ea |     
     sparc64 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/44d0538332499cea691a381048562a09cda23624 |     


-- 
http://autobuild.buildroot.net
