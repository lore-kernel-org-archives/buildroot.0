From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Feb 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-03
Message-ID: <20160204073020.DC186101E93@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-03
===============================

        success : 183
       failures : 101
       timeouts : 2  
          TOTAL : 286

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 18
                      icu-56.1 | 6 
                  boost-1.60.0 | 5 
                    cups-2.1.2 | 4 
                   fio-fio-2.6 | 4 
              gst1-libav-1.6.3 | 4 
                      qt-4.8.7 | 3 
iputils-c8ff6feaf0442f8efd9... | 3 
                 libraw-0.17.1 | 3 
                  trinity-v1.6 | 3 
                  lshw-B.02.17 | 3 
                   hostapd-2.5 | 2 
                oprofile-1.1.0 | 2 
             bluez5_utils-5.37 | 2 
        ltp-testsuite-20150903 | 2 
                 libdrm-2.4.66 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
 make[1]: *** [all] Terminated | 2 
                 opencv-2.4.10 | 2 
                harfbuzz-1.1.3 | 2 
libubox-e88d816d6e462180f03... | 1 
               pax-utils-1.1.4 | 1 
          chocolate-doom-2.2.1 | 1 
                    vpnc-0.5.3 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
        lttng-babeltrace-1.2.4 | 1 
                 mesa3d-11.1.1 | 1 
          sane-backends-1.0.25 | 1 
                    sox-14.4.2 | 1 
                  samba4-4.3.4 | 1 
                    mosh-1.2.5 | 1 
                 opencv3-3.0.0 | 1 
               valgrind-3.11.0 | 1 
                   tinc-1.0.24 | 1 
                 setools-3.3.8 | 1 
               linknx-0.0.1.32 | 1 
             util-linux-2.27.1 | 1 
                 lvm2-2.02.138 | 1 
                   slang-2.3.0 | 1 
               trousers-0.3.13 | 1 
                   mplayer-1.2 | 1 
               nfs-utils-1.3.3 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  gamin-0.1.10 | 1 
               wireshark-2.0.1 | 1 
                 igmpproxy-0.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
               qt5webkit-5.5.0 | 1 
tstools-08f6be304040e7b8476... | 1 

Detail of failures
===================

       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/bd5cbe43c16c8d26838b44b131aeb9fada8ac7e4/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/4effd1d67a04c204b34e657e380cb3d2332cd38d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ecd20829e0e6a9051eaed227d9795bda4038aa48/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d2df7dc3211572cd6a82d09d3954d10c7812f105/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1551cd9a7a2fe279be277c16823c4177e7fa2aed/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b4506abf3b57269976127d3b827e58dc134b5b5b/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/67b0bcb941e950221b325f0066c1de1c02d868cc/
    mips64el |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/091283d9d8e515b6115ca544a70cdb825324f0ea/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/24bda6bfef6455c74decdf8c1b0c3ad5ebef9b34/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/27b764bef567c578c9fb78d171f6404f695d2830/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/96aecd62c3101f0819c3f0f631c3bce5a6b06c94/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/db734e89041e3d7213f74bf1a8ac12208c8bf62b/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/160770ecc1b014803b6b94f91b309eb5a65f19f2/
         arm |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/450169913ee73fb1d6ebcee7b778ebebd3007195/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/92d205ac3f86d66b78df073a135736316271a968/
         arm |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b14700fbc013dea58249b50456de1f3d1a384e85/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ffb6edfcc699de69818c14cc5f3713732ab01b1d/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/47f727de139ea7a2004e88aa68c5ea8162384c30/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/26006e7623c59d438bdde96fd90aef4c2e75fb71/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/d4d2cd27f06a59d2a47723588b26a7f2b784221a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/dc7bbb8ca9ee9374efee9777647d300a2301738c/
       sparc |                 harfbuzz-1.1.3 | NOK | http://autobuild.buildroot.net/results/67a9c810ac7726c55f75814942400683f70b3106/
       sparc |                 harfbuzz-1.1.3 | NOK | http://autobuild.buildroot.net/results/a1ba4c2420232dbc71471aa72a4b9771c734ab8a/
       nios2 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/58c02872f8a94d0da36bf9fd02f17e5039f17e9c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/3d5fb319d91695e2bae3f85460b675dcab7f8eb3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/67ed87732b4462961694b36464797d556c1a8f86/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/161d692806bc12f167070472a2a1f298e2d767ac/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/5c5126065280423e40d320e876a7eb1428f3573d/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/479da3405c3e0c711733b89351949ba8574e9204/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/381e883eb708e6f4d55d6c7137d464289bd88c31/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/abbafa42f428437cbb319d73bdec55dfe6632d26/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/1cb0bc2d164b31bf3e873cdcf32eba26db224283/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a2e00496a60b363f95597a3e37be38d66e8f448e/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/ab477b779858a58b735118b36e5a86f12ab74fa8/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/8339f9858bd186493fff8f96f5bde7c9fc341c8c/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/503893d3d554a6ac8814b1f94cda871421deea32/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/36877b4bdadedade610fb7287481bd8158f031a3/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/828749d6fcf5c555fc4c970585e00476b087068e/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/935044a056b7add3735d7b586ea0cf22d6e3d69c/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/f74beaaa07229f69d943948d66fbe63f0439bd0b/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/fb60b4e8bc28c5b43b47603f0a1df0c242f45648/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f25934b9900d7b75dcd47d5cbc581778c0d5ce27/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f87faf86033a08e4fdc2fb95ebba79b4b2324f7b/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/986b3c608845a2bcc87df8dc94263557ae11550c/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/9bfb1ef58d5b8f6f7782ce28ad98976d69a56776/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/eb1dda2ccdfc6caa303f247887442e587ace6eee/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/90bac2c053d583b7dd25afcf5c2a72572d571f53/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/84602826a4f9c5b7992c058f50d10d5a5e534773/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/a0b7f392796080480afd8a00153db684f120641b/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/e4150f49afbb9c05232b481dfb193c5b4a795656/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/bb052c3ff54197ed8bfb4732bdcdad23648061cb/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/f4cdc2cfc0acefc035b35598cd7d1af989d92f15/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/7d84d896055cf303908e1216beddbe405acd60de/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ddde7de70e02335152708b31f5e7bb19ae2596e8/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/1ce4c1d0047b7b67afa6f81dbdaa182f5e95054c/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/229f9165c227af8a0d290a6a0f4cb307f183958c/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/dbb304b39f1083ee76985ec4d01d769dac99cbf7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5a2d46d74962a1c141b8cc51092ea2a22d395dac/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ba44c92d35b81ef031c1d1c1555c0d57d6df1848/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/be82a4cacea26236ae433a89ede535d9434213e9/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1cb4bb4b54b3163943e4908213d0d68a2db1391c/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/4512c0de02b7eda7255cba287770af332762c10f/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/8c630e1a1a5c503d75a5b281e36f3e745a690a82/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9e804306ae6513fa6027aec29be2db804476ab3b/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/82b5dd5256d87bd54dc0779e8613289cf413bfc0/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/21adc17ac92aeb92ca42a566cfbd0059b49af23c/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/003fcbff0c6064e7a3a293b26238abefbdbaad3f/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f2b4572edd7aae0a2f49fd74f660f9404fd762e3/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/72b4a01fa4c3d177d7b8fe70a50ad1fb1ffaf82e/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/0a8e6e064a03735faa8a2edb79766ccb5c271644/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/2ac92a6f344cf1517fc29104d94a0c879053c53b/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/3588e9cb77d5f8532a958c9f3f33f19eab7c0310/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f4c52d2c614102f69202d5f999e5886e982910a8/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/3f984891d875eb9adcf180414735733e01a79530/
     sparc64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/532d26a0e6cbdf41d5dc45e6feb2c05a43edc557/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c007624898b627c56ade3053023bac2b1fc211c2/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c14fc20579db62ce919865272500e76db46c6116/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/918d45163335eef18edf5c99707ad6bd4be678cf/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fa580882d92f69cebe93ef579082c622c3030707/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1bf5a211fd282e5c4778e17db95ff9ddbb366efb/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/a08e4df45dcc91049db8b8b50f68a87495d125b6/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/2c526a455c800463756e5d764e8628fe57d9afbe/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/09917e5725fd52ad419f92eb07a9add5ab37d5d5/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/5bd10e2ebc6805777b7dbc2184b87e255a6f8e79/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2d2a1dbd42ea4b6e5fc14e0f9442c0ca6971953c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ff76f57e2d566629ca28938f032829a542142d2b/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/42825c371624c18a1b376f86a52649bfd99c2fbc/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/4bfecc95b2dd2295587214bfaafe45d9f4bc68d7/
       sparc |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/7a8e75488dfaec213e03e48207eb5ad3f0f73619/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/1ffcbaaa249b3b096c854296ad47f17a2982dda3/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f4e95c6d58465de3829c2ab127445b1b4c49cea3/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/e7b88cd2cbda6bc757f093d971eadfe6a14c47ab/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/42357944fbae46a6bf24a1e05c42af0b2700f074/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/eb4193ce910186ef0cdf0b48123993cf5c9c876d/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a12e852abe35ef8496a3ab893cda4d753d9d6d4b/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0e56dad00e887b3a9262a893605b2ea7b076085d/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7bb370dd3500362d2f4db570c5981e0215683bee/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/536b6f46fd6aca5b0a832b121533cb76b30a8684/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/0c319c69ead27a2216834682ebaf87e37a4990b6/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/022761471767eee4867056b61fee9703adff1df2/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/172f5cba51a808e7eb76652b253b73975115c328/
         arc |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/b373b2ad7aa43fe32e34dc9f9af9aa607f5b5b0b/
         arm |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/4e75727293c78bff575af47936013031d70244a5/


-- 
http://autobuild.buildroot.net
