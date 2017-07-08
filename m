From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Jul 2017 08:30:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-07
Message-ID: <20170708063044.C992C20958@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-07
================================

      successes : 167
       failures : 88 
       timeouts : 7  
          TOTAL : 262

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 39
                  lshw-B.02.18 | 7 
make[1]: *** wait: No child... | 4 
             host-aespipe-2.4d | 3 
                host-mtd-2.0.0 | 3 
           python-pynacl-1.0.1 | 3 
    azure-iot-sdk-c-2017-06-30 | 2 
                  cc-tool-0.26 | 2 
                    efl-1.19.1 | 2 
                     gpsd-3.16 | 2 
                 jack2-v1.9.10 | 2 
make: *** wait: No child pr... | 2 
                  nginx-1.12.0 | 2 
       python-smbus-cffi-0.5.1 | 2 
                 sngrep-v1.4.3 | 2 
    azure-iot-sdk-c-2017-05-05 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                     efivar-30 | 1 
                    gdb-7.11.1 | 1 
                    git-2.13.0 | 1 
gmrender-resurrect-33600ab6... | 1 
               gnuradio-3.7.11 | 1 
                 gnutls-3.5.14 | 1 
               libglib2-2.52.2 | 1 
                 libpqxx-4.0.1 | 1 
         libspatialindex-1.8.5 | 1 
make[1]: *** Waiting for un... | 1 
                    mpv-0.25.0 | 1 
                      qt-4.8.7 | 1 
             transmission-2.92 | 1 
                  tremor-19427 | 1 
                   trinity-1.7 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

       nios2 |     azure-iot-sdk-c-2017-05-05 | TIM | http://autobuild.buildroot.net/results/5384d57ca50ebf3fc553498eaffe4100a8858ae7 |     
         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/fe3e2361b1235ab0632ae10e8c8131b61a39d066 |     
     powerpc |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/249063e7689402d03bf5ca330d23bd93cb92789d |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fa47366efa777fc36a5901064c1e291b8e2d13ff |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/bd06092d58f1229b4dde8752a42a365cfe6f7715 |     
      xtensa | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/146adc62479027f2e0db85514739acefe3ab563f |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/3b61246f8b04a332d1c61732f0eb6e50ea8ca366 |     
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/5f43adfa13e0dbd74e409d7695c87977f273f4cf |     
      x86_64 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/63a52876d14e542e583756a186b7eb324020ff11 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/4e3d1fe243148ceee856a8c20ab8c60e3ee45572 | ORPH
    mips64el |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/713f2d1ec6cf5d2a48a962ae1a35eae74c6d5f7b |     
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/ca8d3c33f38f346da432f0457589d26393f7006e |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/36a66b7ee3c0977d410f1a2be00376f1ed79763b |     
    mips64el |                  gnutls-3.5.14 | NOK | http://autobuild.buildroot.net/results/be59f8f6b4e30cd41837e30c67f56d3a9d216f93 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/2dd3aa74f2ade025f38edd6643fd5946938186a4 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/85d1f5b8bcc1f0f03f03fc0271e50131d0949cf6 |     
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/10bcb61060c1eee79eead27bcb1ad687d7716385 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/2800de0315a477b230766af3b8d7941bf6f27ff1 | ORPH
   powerpc64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/0cb9713b0fdfcc31aeea0bf693dac11ef9021a67 | ORPH
    mips64el |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/3b1d7bac1c608daa66342048a3cd99b97ba08e9c | ORPH
         arm |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/e81f62c8bbb35983bdb49e6a03fa891dfc452ad9 | ORPH
      x86_64 |                 host-mtd-2.0.0 | NOK | http://autobuild.buildroot.net/results/3c85f4be79c30ec4824056c63cb814fb9c16d69c | ORPH
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/fe3ec93c6ded39e7267e0866e5c4d45d952c2227 |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/85b337112a41d0d49abcf602e9a2e1568c78c431 |     
        i686 |                libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3c951c79a491ea0a304481af5d0aea6361f6689c |     
       nios2 |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/9e461645c38d6fb152f7c43ab952e05f09bd8dd2 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/b2405f8d51e549ddec336b265aa0f578b216684f |     
     sparc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/a1551ea38ecc179c9195b33f2744812ae5b68b36 |     
     sparc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/d519006ec053fd64fc8a348cd43f1f7cc694e63c |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/a69a67fd331036ab07a8d3a675303fe3c05a8b11 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/faaa03ff6cc200a92efe0fb05f0b89a233866bbe |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/dfb60af0e41dc59acab22004a8e26ce0ed12f9cd |     
 powerpc64le |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ece5d4282388c9de6fc79cc59262a7fbf289c55d |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/49fcfc1cd808e3bb6b48af8cc625c085d5f03770 |     
      mipsel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/451e6ddcd96c3e878ac914e74cc75b470bb63fb9 |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/ef2f3df974efc6e3bf00c6a9d23d39145aa74380 |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/988bca6a81da6795a399c02a50a41ddeadfaf40c |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7e7442235804e02084325788ea902f737a095ff8 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/966d23ee071c79dc9f57d9bcaa46e5dc89d01e04 |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/f0da03b57c25e31370ee60b2b262c4b6563e5383 |     
     aarch64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/17334de02746bbc0900bb86308edd4bbc4bbce5f |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/f2d85b22bf28511e080f7b1b6f7b8e1aa25ecab1 |     
microblazeel |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/ca8579563977f6187f3d8d9b45b52facdf845427 |     
      x86_64 |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/d32fddf4a597a4373c4d1ac624f3eb1ed8591a9e |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b65a7c5ef8fc6c1d1f75207c82cd1c32693dedd1 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f098ee87550a76a4ddf2181714aaa7e638ff9a60 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7207de135d0a975851442861a04633808b06802e |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ae9c9523e5b97d23d147529a6041498b469e5e48 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a748acd144823da960202aceb6e175eb96db5744 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/199dc00bf6687c890e21a734aebf7c71085d7983 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a12187ee4749744e7ede61a680cdbedf23156c37 |     
microblazeel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d080f4d896efcc2a5619014637d458e813e259f4 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3bb2e11cf37e93be0321d27451636403ee846924 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/db3a520f5956c8941e7593ba2a1980e9e9401025 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c86796411af1114be7e3797842836965f9c34288 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c2e90e8218493d5c12da0537f1325fae32b08186 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3170a8e1077e16c04c1bf74c34813ecaf6f4b678 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9cf7f36faa6facd6343c56df69f37f9128ec0eb6 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/92734ce5eab01bb4da29655edc05bc27e5f7bb16 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f74d7e2c5e5af75aa3935e24610970563b2609bb |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0a9a28aa16cd2f768055a0f27823e8d0b09e5692 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/78ee4bbdfa0d2c3725b56e458468b3ee818bc136 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f94a4c75b2d49a31f7ce9748a5abcfc638d16ddb |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c69d9311126742ddbda03b2bb49ebd995a435bc2 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2db01cac7757e3488bc48c51b38a40501d2065be |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0139d0fdb83359b39e1820ca6313a1642a0b48eb |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/806d96ae848b294702b12383f9bfa54f6021ea57 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8936ade425431adb54c596fb1013dff1d7e3050 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/12c657a910a8e2421766c290d952e544d320f963 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/08356077d6d2abbd91dfa4a3c1322610b251c9d2 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4e1aa5100f709542b5c6b2fe78816c8399ff7a0b |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/095677300327079bac5536ac8ecd0b5449c63323 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4a0a35e83eaadbe3abdbddcf8be4c95f58c47c5b |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bd5cf8e7152293323fd70ca8be10a06042711a83 |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6f0bf90220d62efcc3aaae83eb2ba4ae7f485e66 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/726b95bd678290af3e449173bbe180a578ab66a6 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/92585cee6eff8d08a7a4e2b64539a2889b1799ab |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b554058409deb66611ab89d2bcc82a316f0fba92 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/647583eb683053863dc7583ba11665700755c474 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f43c394dae6853267d1a5b0c752e7c20361c2c0d |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b10649f1b9c288f32bf748c350a7a0e5cf55b3f3 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d56da138128b3d84fd5abcc52cf543fabdba8920 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7c9d904c9655659c1bc1a0c845dffdec89fdad6e |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/d04ea172cc6a45d1f16c19025741b02ef6dd22d6 |     
      xtensa |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/82bb5490cce5ef1bb4fcc0152d43d5cef1ba8686 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/7202d3dad71ce1ae70a10b97d4ce699bf2da04f5 |     
microblazeel |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/f021d1806ef025ad3e18c3edeeaa6943af1d70a1 |     
     aarch64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/b3204af5e80ee53dad6affcfabdb1a5f3faee890 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ea52962eae1b2fa0d55b76253bb8fba0d6f952de | ORPH
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/b2b4cbe81a35077c0fbc1fe8542123ff9a19659f |     
       sparc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/1ba1c02512dd160f307e3682c1761a2f2b25ed50 |     
 powerpc64le |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/6b6ce352a9edfe3aaba82be143092a878e7715ed |     
    mips64el |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/b66d2477d49f4d915ba3afe3fddea8ce692b0b4e |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/ff5b38ffa4c890029a27009dce17dd5522005022 |     
        or1k |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/dc28e3299dc3b4186a5cd926c548c543599eb271 |     

-- 
http://autobuild.buildroot.net
