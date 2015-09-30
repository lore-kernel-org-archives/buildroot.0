From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-29
Message-ID: <20150930063018.9B386101638@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-29
===============================

        success : 210
       failures : 92 
       timeouts : 0  
          TOTAL : 302

Classification of failures by reason
====================================

               libbluray-0.8.1 | 35
        ltp-testsuite-20150420 | 8 
libbroadvoice-f65b0f50c8c76... | 3 
      host-gdb-arc-2015.06-gdb | 2 
       kompexsqlite-v1.10.12-1 | 2 
                  mono-4.0.2.5 | 2 
                pulseaudio-7.0 | 2 
                 dropwatch-1.4 | 2 
                   perl-5.22.0 | 2 
                   hostapd-2.4 | 1 
            host-python-2.7.10 | 1 
             lttng-tools-2.6.0 | 1 
                 mesa3d-10.6.8 | 1 
libsigrok-fe473123ba836445d... | 1 
                 libssh2-1.5.0 | 1 
                     aumix-2.8 | 1 
              postgresql-9.4.4 | 1 
                iproute2-4.2.0 | 1 
               w_scan-20141122 | 1 
x264-e86f3a1993234e8f26050c... | 1 
                   libndp-v1.4 | 1 
                  boost-1.58.0 | 1 
                busybox-1.23.2 | 1 
              strongswan-5.3.3 | 1 
             bluez_utils-4.101 | 1 
                   open2300-12 | 1 
                    ruby-2.2.3 | 1 
             webkitgtk24-2.4.9 | 1 
                  libssh-0.7.1 | 1 
            lttng-libust-2.6.2 | 1 
                   bdwgc-7.4.2 | 1 
              gst1-libav-1.4.5 | 1 
           libfreeimage-3.17.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
               polarssl-1.2.14 | 1 
                  guile-2.0.11 | 1 
canfestival-7740ac6fdedc23e... | 1 
         conntrack-tools-1.4.3 | 1 
rpi-userland-b864a841e5a459... | 1 
                  ltris-1.0.19 | 1 
         lua-periphery-1.0.6-1 | 1 
                oprofile-1.0.0 | 1 
                   tinc-1.0.24 | 1 

Detail of failures
===================

         arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/2e85e0862fd7d394b619b2c5f01c7747b37d0d2f/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/e9073f62b7825daf0a73fc14ce2d4129425527e0/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/fe9791fd7af351115ed9ac07fb26b32e8869fbc2/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/624c3f60a6ac68919d8ea4be8aafb3c853ee07fe/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/69fd4ef170e74327258b6ec56d089276c9402fe5/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/6e32b0cd21664c70b019f82870e9df33f45cdcec/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/e49713f3189db9df36426176d4cb266479e8d43e/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/324eb54f5fe85cca252d55d739c075c041654040/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8eb70bd80a3f96045638ca0aed3232db6e8c9705/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/90f1b8cebe6eba755d114d4ff1b6647f567e4de0/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6579f88f786e12e1bced84bb181a13d348683eac/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/4952e9ec2a118a4d8680ab1881f2e75b0ec1289d/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/305d3d1254b999a7c9d5916ff3770321fedb38a2/
        i686 |             host-python-2.7.10 | NOK | http://autobuild.buildroot.net/results/3bfd87cbb3a030ef24d0c3c567d60a67b8d24dac/
         arm |                    hostapd-2.4 | NOK | http://autobuild.buildroot.net/results/db1b177e6ada15e26b2e4524a72a51dd84580d8a/
      x86_64 |                 iproute2-4.2.0 | NOK | http://autobuild.buildroot.net/results/6e45eee49ebe8cc3ad3ab74655d43e41f01d5506/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/af6711e8f854f8c16bdfd5756e315a03ce0836f8/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/95e6321002717f159566e2dce7420e0c7aaa4661/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/e7bfe2932f8c45e73f905cd5185607156b74b75c/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/e8790359cc12d73a22a168a61f59215e50a58f0f/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/5188391fecc74fb1e4fede6704076b70d63c6bde/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/47b2b62f44aaea374852401db12686eff1c0cd66/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/0a49fdce36d3e6c39835c007bd77ef66ce07d0d5/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/3a96d98d1af8b11c45e7443b6e6572a91e6cb58b/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/60b0718b432b6e969a419634ad23a5da3306e288/
        bfin |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/2c7565fe495dd4126b10880d4d8c90715a32a2ab/
        i686 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/1adac6ef9b2747a62dd64dc874a551a87825359c/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/22923053709496d8fd6a0fb7a61a353262e17b64/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/7963a72c5946852cabfe1390d44c4b7aaff15c39/
      x86_64 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/2c13b5c0210713aa60b34e68e3d419f2de5862cb/
      x86_64 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/872c1c84200e6c115a45b299b4c33d39c3f01aa4/
      mipsel |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/f9c1f3cf8bfa9eeacb7719459c22bdf7dea26ddb/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/bb33effb844fd6c06efa033cc3e3cb4b4495d1d5/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/26d763c892370d43dbafd66d12b7fa323f38c4f9/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/3fb9c077d4fe772774f53c7611b4dcbaad361312/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/dbfbf09f48e7ec09be34a3a40d3c859b74379eaf/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/a2af1b038fadc40a414e3810fb582f3e2757233b/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/08ed12bd26d6f848ebfbe2e00f2d1cd3c75ff936/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/9d0a4d8ac4d5c931ac8165e2779b495a02c5a1aa/
      xtensa |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/78979ec21b0a328d3c0416694d51f910e50c2fb8/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/33533302302dea67cfccace4235ad5ad9acfb48e/
      mipsel |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/8497ee4985cf275055a9cbff101f37e145eac92b/
         arc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/5843289e124d842bae8cbe132542254ba08bdcdd/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/08a8f7953cc66245164b13ffc9c4c96702afc976/
         arc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/133d8f6f46c6c02bcb00b5b4c948366ad31f42ee/
      xtensa |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/623de2013eba2bff2d0863968e76f299488f9f35/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/688b4657194b34e2df65c0214e1dba423923f00f/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/06c69e0d57220e1d3a952f12e0757136b0d99e4f/
      x86_64 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/9299389e4afa395f617e0c61b4fbb01d722472d0/
     powerpc |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/c35527b17973dd6d2b2ac7e724c8d57a4cf2e08a/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/2d4b831f8673b86a946b63b9faf9e6457dcb3be9/
    mips64el |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/af8168e343dbc2ca38951f2517712508093c2f95/
         arm |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/327ad5d7e393d852a04b3c2c909254342e3d7599/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/9ca4ebb12823029e29c6debeb1fac8671fb605ad/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/946ffd04323496d808898b9bc835475536dd1c0b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/cef455c83165bb570ba7cfed47fedcb1fda165b8/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3316fa8180c79a2690fd1402c71ae1a441f36903/
         arm |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/71e5f48a1151b7d3f3e534a38cee5f43756aa639/
      x86_64 | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/d3cefe8c7d3df0c09e4e79bfb50968ec98baf49a/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/d6dd4a9b787d654b4173c03174a2fd72bdc017b3/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/82b57de5feaf0084c58c295fa417fee2580e4db4/
         arm |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/8b6f7adb5546387c25f3a4c9d8e6f72f4b62b9a4/
     powerpc |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/9df438307a0179d163b59720ca457135ea2c8c4f/
         arm |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/2c069e80e9ee14943a13b06bbf1a198bb12bb07b/
     powerpc |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/ce1666e75b886e457da83ca4398b55a1ce5a2632/
     powerpc |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/35e723afab0cad326e7c942be9269977b3952535/
         arm |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/4a3c7ea4eb08248f2aec45d8efc111087bc1327f/
microblazeel |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/3015eee7b1b6b240e7948b08954d273d28f44c32/
    mips64el |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/7441671c11c6e582b08a84941ce02ff252faf6af/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/c2fd1c70fefc10ccc80ce53a9c050e18280c7f05/
         arm |             lttng-libust-2.6.2 | NOK | http://autobuild.buildroot.net/results/f9bf1a21703ed84a0df22386eace99e64ec8ecb3/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/2879a7282d152eafff04adc451dc3f25efd12c0e/
       sparc |          lua-periphery-1.0.6-1 | NOK | http://autobuild.buildroot.net/results/c2fd64ed2f17c53a4704284a8281305f97a48169/
      x86_64 |                  mesa3d-10.6.8 | NOK | http://autobuild.buildroot.net/results/369cb7827ddfc1199785a2218d34eb2d482b507a/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a3ab2824429d5037c3e448c0db24eada54df0733/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/40ad0692f33bcda7533268f710f18ff774032d23/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/d08c91ea7e73ccff1af52aa9d7a3658c6aac1b8e/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/448601c9327c586e71ce00f2ba4f24b6eb99f30e/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/ca6d5015cd798ae1757312e69ad51fe31c2abe64/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f800225fb389b809bbbf0d713f6dbe32f868075c/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/99e29822fb78d90045e90890b95410c5a2321f4d/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/02e233a97ac14f438e7b15e2e41c25a17e14d5b0/
      x86_64 |               postgresql-9.4.4 | NOK | http://autobuild.buildroot.net/results/2cca5f8d8a8cd1bf9bbbc8c955aec477839e059f/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/492476b911733d9786a2e79b4dac50ab57417593/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/b69d54a8fb518a87655001c9c6b117a6e2f876d9/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/8838f31baa891620a25562f8f739053bfb17cfbc/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/405b90fdefdddb80f1e437f646164be267c7e9f8/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/98a73a0e3646d33b5a0a3b5cb4293b31073fe55e/
     powerpc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/f51cdc44f8785f9071bea17a900b9dfcf2b87afd/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/d4f2f60fee09d4970def12c8eb28fe10e46d1890/
         arm |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/d497c0b23b7f905605f1764c136a9d7682e8137e/
        bfin | x264-e86f3a1993234e8f26050c... | NOK | http://autobuild.buildroot.net/results/cc71403fc9fc465a01fd0c60f13d4286048306cf/


-- 
http://autobuild.buildroot.net
