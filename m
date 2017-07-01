From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Jul 2017 08:30:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-30
Message-ID: <20170701063045.1AE3421DDE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-30
================================

      successes : 140
       failures : 78 
       timeouts : 0  
          TOTAL : 218

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 21
knock-258a27e5a47809f97c2b9... | 10
linuxptp-97c351cafd7327fd28... | 9 
                  cppcms-1.0.5 | 6 
                kvazaar-v1.1.0 | 5 
dropwatch-7c33d8a8ed105b07a... | 3 
                   strace-4.17 | 3 
           host-doxygen-1.8.13 | 2 
              pcsc-lite-1.8.21 | 2 
       python-smbus-cffi-0.5.1 | 2 
                 sngrep-v1.4.3 | 2 
              alsa-lib-1.1.4.1 | 1 
           argp-standalone-1.3 | 1 
                  cc-tool-0.26 | 1 
              dieharder-3.31.1 | 1 
                   expat-2.2.1 | 1 
                   flann-1.9.1 | 1 
                     gpsd-3.16 | 1 
                irrlicht-1.8.4 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.8.0 | 1 
               ratpoison-1.4.9 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/167dbe75c3e9ef643eec23c559ecc79aad012ffd |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/87cb2e4f86847127a84b1710ae0bc1bda293eca5 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/cde3f4b8b0a99efd3f991ae870afd6e9a5904b2a |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a73898a28fc49f94726cb392b4af6e7377f65f86 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cc62bedc92248ce47df1c789c411f91b131eabd1 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/25fabe24242f625dd6ea05c66bab16f53a90962f | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8796f8cf583e4c9278ec97f375dae170b72e4805 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/c552c0fbf123da75a1531c4b5d7e24c51b75083b | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/224eb29179f580a68307c45e50e5468465f81bd5 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/8692e9e44e02c493e83bf06a1fd589896a33e038 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/ce436bdd7e7950c801edac01f311b89110d87d62 |     
      x86_64 | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/4e4799be310712f7d6ebd10244a610fdd4dbd6b6 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/6a77ad2d47fb5c6dbcb0dde32cd5a4614de03d72 |     
         arc |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/434526a7cbba2a952c5a939e11eaac1af2614bcb | ORPH
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1d13ea99784ae8fe844bd62ed5a7ff697207f8f1 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/955b2a658399dbd4414bcfd20666df48d54b2269 |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/eefd52beed6653f070b00e4b3fa9cafd2960be6b |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/90861bfa10c24b1714f7c32e596e286c1bece853 |     
      x86_64 |                 irrlicht-1.8.4 | NOK | http://autobuild.buildroot.net/results/6260307da8acd45eb7611b08e2527a20ee5b357e |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c1a138364fb5596fadf5e0a275eada59f36e1d51 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/be4a06c903d5d1317e6a2f1b41bb621d68cdba81 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/a371647197bc126d70e13d3b72737c556a0e85ee |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b7883d71d526b6b4584468d09e2dbcb710f71c8f |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/7d6671540207732c0bf8b6a6341b793f48958cc0 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/44d189ddc16fc3d0ad48d66aa36bc1aec1a43071 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/10e30460056547f5bcbf2fa3222e5c1028fb95df |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/46126cda2d855f638849a109a84608244d5381fb |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/1974312095da90eeb35e05f6ad1df9351d598667 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/661efd4d947e97d04b009db7fbef857f77a78e87 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/b2d180a1e18b67651d58ef6cb655c9340c425fd0 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/d59c5aa149fc0fe403e24096c4edac95e171a90f |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/f4a0cd1498d049f4629d004a44a390dcfd59d42f |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/301842383f8629ec8cf67a15ff62859b0f417c10 |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/9d5fffa42946db2ac55bc3e7ddf7aa7a707e679c |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/4f527405c9b6e5c2a78d3f0aa831559cbd84ab49 |     
 powerpc64le | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/b3c5e0c2d9fadc7a0a0f16e185a69159d7001d66 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/0ec96ba9bf15bde1a5eab2ab32c3fd72d04e6c4f |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/a1319e7083971c3544522c34076b56bdf8e17611 |     
     aarch64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/b2f40e856cb8102a81321aa92703d51de3d26ac4 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/5b0117051391302bade0ff03659e7d2e9517a577 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/6fead472f344ac4906df578178f5027974618b26 |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/e8ab4aff5abffe2dcdc65f56ae76d05cd527a5b0 |     
      mipsel | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/f78eb6305dd49b54520f701e564b789f74efe630 |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/af7b8e57e78537ed783874f0f521236692b8f34b | ORPH
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/bb45a709c3b96a5880e8df04010674e964150924 | ORPH
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6493efd8be4702322ac5b25485318f30df82f712 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b39839fd077b6a405de51eeb406ee7b37dedd37c |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9be0fc5888a303b096f35fa6740bb6a0003eab1d |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/14ff284f4a329dc8f1d2236df29c11998110bb48 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b23939002b1558f473fd9f4b37c9644bfba09af1 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5f993dcde5fb5f0c0e5c91b341795082245d46a4 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ed1e22c341b9ed43f40bc43b7eaa7dae6247d522 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/30f8a99195d3d2d6af88bbb7311595f8d256a185 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/975bac2875896c457063c4e0e865b2601b55ad14 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/773dbb84a35ed4ad116bdbd4bbf2b3acd27fe012 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/02fffceda388d38d1616a8dacd37ee9e98622ce0 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8e98a343be0f7cbf3a9b2e425b128ca2dfe50855 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6c2fe0d9cff05794ffca37c1d941da9c5edd4b48 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/891b0de780e0b7740a02f3ab11f8b2972c6fab11 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c2bc7ac19738a7ec719df493aa91d7f45878b6f7 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4168739ac82b4f8e111bbb66303775bd86db117d |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a0903e81acf935b1660a157318a897ddaa3e7eaf |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/676ebb01bfbd68345cfde728e40041136a0664aa |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/74d8c41cc8b0f1759164ab739ed7a5b19ca9f90d |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/db92ede11ab935b145beaa5fac577215e52c7f7c |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0300a5d711d578b78c3a307809b13defcc5c2989 |     
     sparc64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/32a495fa35b494feb6748c5be5d6243ffcaf54f5 |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/04862a00e9d879775fb2daf171953608b85772dd |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4b6706ef66eb010d62cfbc6d3f6bc04bfe09e5cf | ORPH
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/21daa459e1b1313ece3ce380bf9488d31fa5f562 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/d87d3734634cf7d8bdefbc248485588abbcfb2cb |     
        bfin |                ratpoison-1.4.9 | NOK | http://autobuild.buildroot.net/results/7b1904ade2c5acf69e79322185b617749c7a398a |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/b7a4754c6f8d3ebb23243ace8740befe800ddc33 |     
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/c6eab219eab915c45aa76ab63a9ef4d7b217177b |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a3d045118726b0ff64205ffb7c27b7b249fe4f74 | ORPH
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/6e4e730522201bda4bf0ea68ae54c9e2e87349bd | ORPH
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/a10c10c0531c3183200cec0cedbd91331f977163 | ORPH
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/d9a4a2a44369b1f90a8ef591c273a5928f08cc70 |     

-- 
http://autobuild.buildroot.net
