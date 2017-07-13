From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 08:30:57 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-12
Message-ID: <20170713063057.861D221FCA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-12
================================

      successes : 169
       failures : 74 
       timeouts : 5  
          TOTAL : 248

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 28
                  lshw-B.02.18 | 8 
                 sngrep-v1.4.3 | 8 
    azure-iot-sdk-c-2017-06-30 | 4 
make[1]: *** wait: No child... | 4 
                    git-2.13.0 | 3 
                  cc-tool-0.26 | 2 
                  cppcms-1.0.5 | 2 
           python-pynacl-1.0.1 | 2 
               qt5webkit-5.6.2 | 2 
                   trinity-1.7 | 2 
                busybox-1.26.2 | 1 
                  bwm-ng-0.6.1 | 1 
                collectd-5.7.1 | 1 
                    efl-1.19.1 | 1 
gmrender-resurrect-33600ab6... | 1 
                   httping-2.5 | 1 
                 libssh2-1.8.0 | 1 
          linux-headers-4.12.1 | 1 
make: *** wait: No child pr... | 1 
                  nginx-1.12.0 | 1 
psplash-14c8f7b705de944beb4... | 1 
       python-smbus-cffi-0.5.1 | 1 
                   strace-4.17 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

        i686 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/318d2fd0f050f121d18af502d6001ac08d640380 |     
      x86_64 |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/169e7256191b252d6cbaee1caeb50cad3efa6af5 |     
      xtensa |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/652639f6765b245b31aabfaf57c39022b62f3f0e |     
    mips64el |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/80644866e9e7b3dea2b48da5b46b5d130ce2fe19 |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/1f73538c75dd85823c0148a40cf144520fdd250c | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/2691dbc010ee8e1b65d4f8234622e6e4231edb46 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/afe1e81e948e78d27ed02009beaaab9631c3e9d9 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/961a9ebc6bf6f24aca24ac6143b0cd716720fb87 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/a1200b76b78e5466c77179e2a6029b399c9ea962 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9faad03de4734a1381893391a35e075448e3b7ed | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/194345414b77f6b29c227c6d2a13d5e5a2cd904f | ORPH
         arm |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/53db4087808c18d298571faebe31084f701a4b0f |     
microblazeel |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/c8717619a1307f21cb9fe61196511cea44f72015 |     
       sparc |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/e7acff51f988c333c3fe0c4a18eed42a273932d3 |     
         arm |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/3041c69af49fdaec4b82e65929d36acc6c89cc44 |     
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/1b289397f11553d5366df9eb96704c95ece0884b |     
        m68k |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/1043729c6a21072431046b12299d28fac0ed684d |     
      x86_64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/515fbff620aefb4a087d6cf9116fd6bb593913fb | ORPH
         arc |           linux-headers-4.12.1 | NOK | http://autobuild.buildroot.net/results/485997f6e6967c1329d28d91b4684b56d9884c48 | ORPH
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/e38c881a2e4934e709953ff0aa051e6e58a01d65 |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/d8448b6fe645057bef02b7a2ca5e388c28355026 |     
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/efa212c4a88ab19b6ee533f4a5f5e5a1b77b3d02 |     
     sparc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/850efd190cfb8529071c1d3957eae096f508fc25 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/aa7fa4bdbfa6cf565b405844fea825cb5fd937fb |     
 powerpc64le |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/70b43d3d26b3313411c031657aeb378106e64618 |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/fe32a2f51a6b60f71aa1c7eb0a529c13b5f5e046 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/31bd8edf429e6feeae63ea511d8e640478cd1eac |     
      xtensa | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/9fa05dde2316f0feb66864b9010667d21b4f5974 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/f77b8fe46d184257f07d9c805da5202d93cfa2d6 |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/9f0a957d796d7f2c4581589d24782f8717876af8 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/80fe55c363c48b7fe20c8f6049a289a67fd47da0 |     
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/717a1cda12865e06bdf98de370acbcc4d4886862 |     
        i686 |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/0aff36e9aac052fb5025efe83cbd8e41bd8e80ce |     
         arm | psplash-14c8f7b705de944beb4... | NOK | http://autobuild.buildroot.net/results/ca0c07ffdc930b9fd8bb1eb42544a48470bb9d59 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ad6810b130735858f836e140dc4732a1e46b7652 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/aba9b85aa79fb267bdf9f352347d499aa1202284 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/29a56023dffaf79fce0751bd2efaa2d1d2333fbe |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3bcc68442eb75ba1daeb898a1cead3d2590562c6 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a7f4d43e6d3f58b3a6257c3eef1b3002e39d8620 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0852dd8944a1ea13e23d3e4e3af4322b277cbdc1 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2d5091122f1b1ba8eef070eb8511d701983ce059 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/94083db5aaa2c9ca1db4e21a55f2970535103e03 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a9af84f2d845ee25e2b7d8b92aef485112b46060 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5dbee588ec2ace3a5cada6237d61e2a4af1b9e46 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1997bbb03abb3562a010988323a558bed6e1fd9a |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/17c956c88db3ddb7da042e54b051fe261401b102 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/55477a05e757193e207e37543b4703d5b4677774 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/82b1f9f83e260224801d3161b226f239d1211d0d |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d6382ddc6294e3bc19e742d9cb0a9c8057ed0310 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6c42aa4664f3361f153796f79ae518085c6ac94f |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b28f5182c7540a2600164a07abf3dd7c5b1ca605 |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/be03ce410162690c7d84113ee388da7aff9d4570 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cdc498588fc756e5208884db5213e7c9d5d5eabb |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dfd08890dd816b9de6c61ae75869ee61cc3d606c |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/37525e5b96cf1576a6ea92b43d5cbaa65a5ef9bf |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fd048202f1d5e80e0dde5a7aeb1cfcaccbe7083f |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bc72e4ed9f084f542f6762b214b4b8c009b6112b |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1491ded9f5af5ec77204671506ed065221a4c394 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/72310155657367c9df9090040cc414c153c0c848 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0c7d41be318635b6549ba4ca9eccd683163ba8eb |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0fe2201902bc9ee0a42b370a326a3e6770ccee05 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fd100e3484b9bce2118addb7485c65e633764606 |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/e8685a0a88af8d3ad40b5204a4a9ac21e5e53f5d |     
        i686 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/b017c4f6b4d45c0afbf06a80dbd3f2ebe5d49d20 |     
microblazeel |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/25144ea191ad46d851b31d3a2f0ef939f215494b |     
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/ab6958d959e238cff0e66c12254b4211430e8014 |     
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/f1cbd9464fcce565dd3a79809254acc14fe278f6 |     
microblazeel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/bb96170e48c22ed69ac1fea68e7b8861396ec78f |     
     powerpc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/b14add74aebdb35e797f7a696174d618a41d643b |     
     aarch64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/6ca88d122d7f08a86ca339f7c79e12353a8256e0 |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/8c5e86d4fce40e2cbb94ff5488a23c35d9281597 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/43c8fe554ef26f7358b71ca72e9dbb4ff6a40a28 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/3c49618a595f1094fd25bab52b532e5ad75709c7 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/64889120ccf8e7d71055db39761f03b32d03cb08 |     
      x86_64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/394ff47a257b6e5a9e9dca99b657c446fd8c4e44 |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/29986343f1117fccad6ffc4c2df9dd9df3b2f8ee | ORPH
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/546a669214f4e3f0c22748308de254bcccf30e33 |     
     powerpc |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/862e1720a0ffdeabf1a8f6ccf76d52626c42c0d8 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/08bc3e7c1bd186a68a2583b3326467c4011d674e |     

-- 
http://autobuild.buildroot.net
