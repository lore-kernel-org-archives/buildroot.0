From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Mar 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-13
Message-ID: <20180314070012.E531320731@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   3 |   0 |  29 |
      master | 190 |  53 |   1 | 244 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
             freerdp-2.0.0-rc0 | 1 
       kompexsqlite-v1.10.12-1 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/34196584e8103c488a059cd0b7e8ded8aab62db6 |     
        or1k |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/3a9c3256c5348916ab2d18f8022880bec040fc36 |     
         arc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/8907fa895dd267b1654e497419435cbe4fb3a3e9 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 13
               xfsprogs-4.15.1 | 6 
                     php-7.2.3 | 5 
                  host-go-1.10 | 4 
                    liblo-0.29 | 4 
             bluez5_utils-5.48 | 3 
             libmpdclient-2.14 | 3 
                  udftools-2.0 | 3 
                   exim-4.89.1 | 2 
                         argus | 1 
                 ibrdtnd-1.0.1 | 1 
              keepalived-1.4.1 | 1 
           libfreeimage-3.17.0 | 1 
                 mesa3d-17.3.6 | 1 
                 mplayer-1.3.0 | 1 
                  multicat-2.1 | 1 
                   qemu-2.10.2 | 1 
                   trinity-1.8 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

      x86_64 |                          argus | TIM | http://autobuild.buildroot.net/results/cd2c1709b0d8ba9925b2fedaf85337990bd392a7 |     
        mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3e91b3f92ad1847391a0a098530afae9422c9b8b |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/bc410d409c77a1dad25168714961897272f94fea |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/b6304d1be7cf63574adb5317e4f9d50e881e9c2a |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/8ecfc42a81efec8485784f945e231eb40a087b5b |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/a19df43be7d27cf8815e1257122d25aa8285d75b |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/54b8e6b6d7c1e3cbe63c99edf5ada41eac116753 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8034db66b933b32547b61df88a0cfdda9df141bb | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/829b923c76bf6b6e99c36c413c27d52755931bab | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/76329e5b584c96c00ee84ae3df553732bc888140 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7e699d7c29f7e46d95032396abdda6a7dbb174d5 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/de8fef02c067d6b52bea6dd97155e9f6a6500f80 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/be127c42d2f5636d0cc5590ec1fffe6cbf22553c | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/56e22e0b9affe2c1adde2e8a08b66657cd7652a5 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/01875af77ee0ebb64a3e8698368dd55852885793 | ORPH
        or1k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/af9c2d9399aeb8c2238e355f28f2ba9c96de32cb | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/dc73c70af85d290463579fcfe1b657da04e37cba | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8ac6739fe854b62f173db95dfd647f827e64fbad | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/01415ee578d930514f6dd738361cb366a36cd273 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e08cbd55fb0f89377dbbfa359e22f1387bb66eab | ORPH
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/bb2f58210cb3767bfc1aca7e29ffa2eaca5940c3 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/772594d289fdf9ac28e2e7eb9d71046d7be7ff0e | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/65c034c8611d5488ef9d22c4a8ccb792662a1476 | ORPH
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/a80ccfa304adfbb63892e6c3ea8ce21d9433d3ff | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/ec9bc6a379494b97968d27c5322af89de69b1bf7 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8edc37ef0d42025b7ea7504a4a7c012ab4bb0d25 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/8e7db3f5ba21e07d2a0b49c45f3150403a059561 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/70677fc5dc8721ecb6bbdbb528ca35aa6c94f9ee | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/310f3335ae83e2ff101dc32ff43f5efe943ebe03 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/a8df5354a8e163c1d826da69a59b42ba66072c8a | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/501b0593c561bce1c1488d13e4651cd1b7d314cd |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d5dcdfdfab3503fdc387f99e68267972a38c417d |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/33ea191ada9ad7e9e8ca130bcb71a08957a4a528 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/ac9601e3f3a084a61362f7c78925006d77658c91 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ea32602dfe11d7cb2cef1815040b3629680c28ef |     
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/d638bc172183a3ae0c46c8a69bd3f214dedeb0a4 | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/f1c4397e53b6d34e64a1c6e30b0357c3381206b0 | ORPH
        or1k |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/a296739d07eaf6722b9a8303f398b78b870aca43 | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/a3e4c8571ae62c5a7b5c6fcd6f2ad10e11e9d713 | ORPH
      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/763ad6fa3200c4bdf80c5837ae116c8cd88ea2aa | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/e8494c2e64520ae861d16060ddf3dd7769c82135 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/0c95fca5fe2212d56b30ce446ae6531e4aeb2437 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/fda07327395921fdc79cbb4f24b662209fee1be1 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/0437ffdfdef07ac79862303d1e5cb0571645965e |     
      xtensa |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/79594c8932600c459264a38b84e4b35faa6baae9 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d7dc71a5d94389e2b1ad212dfeb590c11415321e |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/f76e36d18de8e94b47b97109dd4bb7331659f877 |     
   powerpc64 |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/3e974a86cc8898383d1a7b48fdadacbbc159867a | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/31dca90f7cdd0c54f4a9263c21ab72a97de701fc | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/fc225cf1797453cb4b9c6ac0781ac58b1f5e5c6b | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ac66577bf0347b7d6a8cea96f889d8ff865372d4 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c9f51546e1af21191d734585e06519e54313dc46 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/00bba3ba2863b6ddb1bd5cab8b82d6293ae838de | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/52881052fd2407f3de2d8f84eba792e07cd076e0 | ORPH


-- 
http://autobuild.buildroot.net
