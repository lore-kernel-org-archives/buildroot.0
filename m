From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jun 2017 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-26
Message-ID: <20170627063047.61F71208D6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-26
================================

      successes : 128
       failures : 70 
       timeouts : 0  
          TOTAL : 198

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 15
knock-258a27e5a47809f97c2b9... | 11
                  cppcms-1.0.5 | 6 
linuxptp-97c351cafd7327fd28... | 5 
                 sngrep-v1.4.3 | 4 
                kvazaar-v1.1.0 | 3 
                  cc-tool-0.26 | 2 
dropwatch-7c33d8a8ed105b07a... | 2 
                 openvpn-2.4.3 | 2 
           python-pynacl-1.0.1 | 2 
       python-smbus-cffi-0.5.1 | 2 
               util-linux-2.30 | 2 
                      x265-2.4 | 2 
                   attr-2.4.47 | 1 
                  bwm-ng-0.6.1 | 1 
                  check-0.11.0 | 1 
                   flann-1.9.1 | 1 
               gnuradio-3.7.11 | 1 
                     gpsd-3.16 | 1 
           host-doxygen-1.8.13 | 1 
            libpwquality-1.3.0 | 1 
           linux-zigbee-v0.3.1 | 1 
                    lugaru-1.2 | 1 
                    mpd-0.20.7 | 1 
                    norm-1.5r6 | 1 


Detail of failures
===================

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3437c6d95e61af458e1981e8e52ae3687ff630fc |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/33a55218d50612134ed1a48508a1c866c31c0539 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6f455a334afa77ae7007a147bad3ed173fa07db6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4ed6a502f284d4d7d11d10338bf0a4827f8cb987 |     
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/21851973a6844adb996e2da0ced619a8e68a1f8f |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b194541b0c492d4fe71c36eaa475423dcdf7487d | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e51899c503ad8f54c808903dfa99e3beaf48cb22 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f771ff36d881f73326f6eac45642861e369e9f0f | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a434d1b3674c8968de2208689575055f5c0494ad | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/99eed430eecc2804ddda3cc270398c87f2d50a4e | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ec84c5b8d26859c8b8b4b299cffd391242954c6d | ORPH
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/6574c0df4a2d51f42fc2553fb7232ae5ac5df6c4 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/d4d6dc69e7e04922f2665ec355e395a509398cd9 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/78d34cdf38e0d38ecfcd0c35179d19d9d05be65f |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/608be7887b24989590494df2022d715e0cbcc21d |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/5f8cbd4b626eaf487e4d79314a774b4b4c784c5c |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/d8638a66f8ac60f5653863e7ca5078af3b560607 |     
        or1k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/46474d9217f71d15628c6f3506db1d18e843085b |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/595ea2d12d3ea9fb0d01516d5b5803df5d951815 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/d570602fb6f14a062d64cc626071fbba17aca759 |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/83b7208c47694d104cf2c1fb2565a341227a0102 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/e64800febf76aa18e2f70c9e69806526a4e326a6 |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f859294f0dc990b54f0042b0ec9761648a98b445 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/7eb0e185b88340c4019447838b048578d3dfa20a |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/745aa3363373e967e6d93e84daf1f1891f1b1754 |     
       sparc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/050d7e1ad9a8e8cf01c6c8c6d8ee24756048bfb0 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/43bd412a2b9ba3d5fa88c4d0e22b3f28d9cf2ead |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/314effd7a1e8cd508660ae3781f8b3c042cee172 |     
microblazeel |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/a1f8e68e48d57bb2b2b77ff53c883001c7989f55 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/ab83f6edc9ef3dd7dedb0c3a027564950ab6d306 |     
       sparc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/51b2350a9eec96f997d37f141b4bfd5a4d1c448e |     
     powerpc |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/4a6522381e8533b96feb71ec21342969ebdc8a8e |     
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5e90965f49838f15739c38c0441c6e346481cbe8 |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/a625a55395136718e375c8fa101ed7e56e018cf8 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/e2b3307a2efbf78f85601e8ced003965d673a9e5 |     
     powerpc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/90b1cbe00de3f60a9afac9ef86d578a739f8d04c |     
      mipsel | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/9800a0e528219746bc38c4284f3bc37438688a08 |     
        bfin | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/2301d7932310d3863ce411fd4e0cd6c16f470b40 |     
         arm |                     lugaru-1.2 | NOK | http://autobuild.buildroot.net/results/38917f8420695a9dbb24830fef04159252fceea0 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/fb67f453683078023e9d801176ef6871bc720c67 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/a870408d1c21ca89875f635d8a2d0679547be887 |     
       nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/06dc53e3a7a17aad1f08c9ba319fa573a760682b |     
 powerpc64le |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/457055f890ce2a1167dd4045ced098865a47ca15 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7847c7e3c21a83ee4d066c2be0835927fd1ea9f2 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e71c571343e1e9419059cf84327dbfc819da52e1 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/beb7221cc1f9bc3e2ed201a9607c9d2f41b68d96 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bba5e07d8792e7921880dc0be25fa0019637de2c |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b38bb0cc4237354a51a78576f45a3b889678f3fd |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a37a57cf48b5db1beed48adc5b5c3ad135f1d349 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e2abaceb7acab597a582b280940ef46d47892be4 |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f51a17b4293d24df15182cad3d59aba4ca15841d |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/94c2dcf214fea065490b8dde82173be27c46ce63 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b4796d4b7e00677d79fc05813da2fb07641b08f6 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fe7b8791eb2255e25b2fed3a32fc9ffe244df4a4 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7cc4b47dfff26ba8f2ce5087dedfecf9e12f0110 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e60a134b5bb5976644aba4c79f850e15acb328ce |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7498b0e10da9362cd0537d197e78f8a33a0c96ee |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/645cea5b9dc768e1b53d5809a383e307c5d45442 |     
        i586 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/6da409d07fa9d6a7ab96d99f8bf014b7c20f200a |     
   powerpc64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/5726cd5e46e7e0ecad6bed32879c037ad5568ef1 |     
        i586 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/0c2758d91bdb2616ffae5dbfaf5c43ba4bed125e |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/877309f43797b0370cc6f69849371ba118df5180 |     
         sh4 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/e1b016c267fd8c111ebcae48116757e10e93bca6 |     
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/26be807d0e740ad736c84fef7c5f02a4e555f7ca |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/65c72da9d6497f3eebe271b8e98e610d4d40ad5d |     
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/10cfc3957ba67023692155f29bdb1207721a3375 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/fd8a1a8e0cef3aeed9588540e8e663664f6b43aa |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5ad73ea8b471321988c50d80a5e50d4504151dd6 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/c10f64fc06ef771aaf474e882bb1ea1d93d7790a |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/9d7994fc54856f5f86633742bb4fdd47ba13f105 |     

-- 
http://autobuild.buildroot.net
