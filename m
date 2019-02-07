From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 Feb 2019 07:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-06
Message-ID: <20190207070044.ADA3E227B1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   1 |  23 |
   2018.11.x |  16 |   2 |   1 |  19 |
      master | 194 |  59 |   1 | 254 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                  libftdi1-1.4 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/58bf4a611746e4dd52981974da887bd7b7bd4855 |     
 powerpc64le |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/8ada47b9d7af1de678e10abcc194b2f39e80a883 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                     efivar-35 | 1 
                host-libsodium | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/d19e86126202a2ca361d25c0dd9362ff120f4f60 |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5205b2450001befd2df97668882800c669a40c72 |     
     sparc64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/ca5e673c3e8c7d287cbf0d23e0d7c9178dc786d9 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 8 
                mongodb-r3.3.4 | 7 
             luacrypto-0.3.2-1 | 6 
                   netsnmp-5.8 | 5 
                      qt-4.8.7 | 5 
                     efivar-35 | 4 
              sqlcipher-v3.2.0 | 3 
            host-thrift-0.12.0 | 2 
                clamav-0.101.1 | 1 
                gnuchess-6.2.5 | 1 
             gnuradio-3.7.13.3 | 1 
       gst-plugins-bad-0.10.23 | 1 
             gst1-shark-v0.5.5 | 1 
                 haproxy-1.9.1 | 1 
           host-sg3_utils-1.44 | 1 
                 ibrdtnd-1.0.1 | 1 
             libopenssl-1.1.1a | 1 
                  libssh-0.8.6 | 1 
                  linuxptp-2.0 | 1 
                   luvi-v2.7.6 | 1 
                 mesa3d-18.3.2 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.46 | 1 
                          opus | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 
                   strace-4.26 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/b40496731d3d615f87bdf930bb93094fd85257f1 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/f658faeab28587642dc5f90fb580e28c4374a8dd |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/4b86c363cd0c18c2af425f9f06c34211ec722979 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/3bade8c45735e15beca682c06390d557f251232d |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/afb0a00555df010335bf084e38bd4f0fb0267425 |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/3173d30c2da00ce09476937945589edaf809d82d | ORPH
   powerpc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f941d84c781b524530770f5b9360863a821e8ba1 |     
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/292b28bab0f31b25abccb34c9c07ef178f188890 | ORPH
  aarch64_be |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/09b894b0775df2dd87d8fb2d53c6a243d8668aba |     
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/8a5a5f6bd51f4090cf11a10aa08dd193d74bb826 |     
     riscv64 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/2b30f4ae0074d7f89ed489dccf6b5eecdd40c909 |     
     powerpc |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/4c6d621a9f0a6334eddb94b8a05d4296cd65eb71 | ORPH
      mipsel |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/158d8cd58f6da496c25d8957b9f6c6e2947d60b4 | ORPH
        i686 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/8681447e9b173853cc1942243c7e720e6e0d9535 | ORPH
        m68k |              libopenssl-1.1.1a | NOK | http://autobuild.buildroot.net/results/39e5911dd0b3f173965ad38b16fc6059780e1bfd |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/e8e898c721afe8f2069eab0fb97c582193700873 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8326c9f24712d3c4edc509bfbfdda6479ce273b5 |     
         arm |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/c2caa0a58a88fb584a91bece9f8a81c184c93422 |     
         arm |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/7770b14f12008a0d2869fd2bf70c30d1276266a3 |     
    mips64el |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/efabb0382cad901dfebd94dad10ab06f115e2b08 |     
         arm |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/1e8c46a7df14dd373adfe8b1391fcb2017203e29 |     
        or1k |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/d874e5cc21975279ee3bbab910de8d39cb06170a |     
       nios2 |              luacrypto-0.3.2-1 | NOK | http://autobuild.buildroot.net/results/91ef0cb0ebf4e56dab71c954ed535489650c72d8 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/9da17b5a51a10dd53f4b43cd7c85e9f031b6c177 |     
         sh4 |                  mesa3d-18.3.2 | NOK | http://autobuild.buildroot.net/results/2f2b34ee7efaa001fc8a46031cf739608df28995 |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/26e8f651651305c6dd3c2338e2afbb36eb1af924 |     
        i686 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/af951f8a55500445b4ca0fa58978df2bff4f9b96 |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/3fd5bc4113acf19a9f3243a6bcb121ccfc8645c0 |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/707bc7790ff72b9927c3e6f6fc765fd1b1db1a56 |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/e5bdf7fa78f76afc8e1aab10e209476d0ffb6f2f |     
        i686 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/57d5632ebebeeed0ee7f5ee53942d34398dec16c |     
         arm |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/dd412fae45a84e44e7e6a49f8cdb124d0851c1df |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4eb38221dbcccaf2a3bf431df09a7110d7dcb101 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/89d163c640562d1cea96875c529c7b28d88d8f18 | ORPH
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/492998874665771fd2eed4b1ef98282488f0e6e6 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/fdbc54fcaa6b315a8bdcb15dee9e147d5d03933e | ORPH
        or1k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/6f1ba601d8706a00412b0c2ad5ab0af07c2ebd3e | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/34d31930fc5df42a717f95ab60b7d56e04a2e873 |     
        m68k |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/6843fd39a114148ce338095baccc9b7708fcb36f |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/ee0d5de3e512c3e69a80f18fcb61adac9726aa8a |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/6dc80f91718e7f5d7ca447f411457d186d4c4ec9 | ORPH
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/28c3dd01c0fcda543a54bb405fc25ed16072e50c |     
        mips |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/813d0306f1078ba767c21acc3ed6b55ef842652a |     
microblazeel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/eadb73c8bb11bc273b2cd6a2e8f0fed60fec7034 |     
        m68k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/92981da3e8d7bfc020f5903e4dfb98790cb4b142 |     
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a5f18945c2e0850eaf0b9a4cc9d52223be5e185a |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/9d7417f2cbad03b805e850ea67f19c6c7d848ad6 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/39053f7a2666268630fcbb72d20f6cbb63f4137c |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/dc94a8f35961b5bb93ceeb03931162671d9db81f |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/909e7be4336805d89720e6e6abde95425fc63564 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/eded29531d668d02fcae374761418c05d0388738 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a7f1549c96d123df6dc6d3c9625532b89fb96e9e |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ff06693ae0c8770483f8e3bd16bb63ebdef7e023 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/33e766a3175042f737cfb715b8bef8cbae305638 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0b87dbb414d7818ed6a6a42d5cc4f304da2346ec |     
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/3dd6f959781248904d24222df045826c05fddd2a |     
    mips64el |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/d145f4d6674ca8f2521d3598d3e5f18c8e3e9b33 |     
      xtensa |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/5e2c3178d8a6e11b1af1c37144737097730ba222 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/1cc97d813f14e1a7927a3df8faec43a58c0c6b6d |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/182c0081b9f30f4107f720536e8996cadeb7086f |     


-- 
http://autobuild.buildroot.net
