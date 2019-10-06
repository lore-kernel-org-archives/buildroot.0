From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 06 Oct 2019 06:17:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-05
Message-ID: <20191006061752.B28AF2010A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  2  |  1  | 28  |
  2019.05.x  | 24  |  1  |  0  | 25  |
  2019.08.x  | 19  |  5  |  0  | 24  |
    master   | 143 | 110 |  0  | 253 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 23
                    bird-2.0.6 | 16
                    brltty-6.0 | 14
                       unknown | 10
                 uclibc-1.0.31 | 5 
                 libdrm-2.4.99 | 4 
                  uacme-1.0.19 | 4 
                 mesa3d-19.2.0 | 3 
                libcurl-7.66.0 | 2 
               libsigsegv-2.12 | 2 
           libwebsockets-3.2.0 | 2 
   openvmtools-10.3.5-10430147 | 2 
                 python3-3.7.4 | 2 
                  cmocka-1.1.5 | 1 
                collectd-5.9.1 | 1 
                collectd-5.9.2 | 1 
           cups-filters-1.25.6 | 1 
                  ffmpeg-4.2.1 | 1 
                   gqrx-2.11.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 host-icu-64-2 | 1 
            host-mfgtools-0.02 | 1 
                   hostapd-2.9 | 1 
                      icu-64-2 | 1 
               log4cplus-2.0.4 | 1 
                   mpd-0.21.14 | 1 
             openjdk-12.0.2+10 | 1 
       python-matplotlib-3.0.3 | 1 
             qt5location-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
                snort-2.9.14.1 | 1 
                  spdlog-1.4.1 | 1 
                    strace-5.3 | 1 
          xlib_libXfont2-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c3beb2b7520f76d8d99d058fd63fcb57dfabee98 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/813580d61614e39e4032901b57d71071c0be77b5 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/20640432370d3fcdcab98595e06234bda1789f66 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/82fda4aa90293706c06a84634aec871a975e8467 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a1e5c7e66c54eafebfcbb4ab26bb0ce14f853b31 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e32738fee086c519a6a0703a1848241806faef27 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c23e45b4ecc06e6b6b9f6c02dd587fcf2c9f2c8a |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e57deb84afb31356fc8e1dfe5ea2ac90812ef5e4 |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1b11212e9130823b6b5913adb100399371643aa3 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/a97641a33793ad28dc0c3685cf3fa779e8b61be6 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ddc49496faac079141cc075e10eeb68aee0dbaa3 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/76d18807fcf94cbdaa2e9b043ba9c7172a2c4b01 |     
    m68k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/66d9ab540ed528dc084242160a4a6f07cdc6fc35 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/29ef08b352888b552ec083c12ce45ac691aa42a3 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2099928d42d7d214a9c12a9a503b43cb2f37a0c9 |     
    arc      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/13e906fbb549f215a57d7d2a854eccc34ab2c557 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a59cfe910e636e0980cdc4a9530b3783ea6e28cc |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6663ecbc987aeb6b4c825cc9f4fb324808c93225 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/911642eda57d0dba0792a6e4af54e80e4dd9f113 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8e8eb5f6507b08bd65c6eb41dae9555f373e6fff |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8cabe52357c620bd1f5aea4f1d81ac36613e1daa |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b70f8affc82a9679010ed6ae6a7668bc8062865d |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/de9d082fdd15a8d75fd4ff0c1253040630654a85 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f19cc297be54f0c7419eb7951b664cf8ce828553 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6f4c7d968cba3ff8a4aad00de1abf8749b241d29 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2c37150c6163728d076652d7237438f3576fdfe1 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c5dda4b4cb576506eb6f2b592d364b2eb092de1a |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/21502ed6c917b875d12c5d1fbf353417c30df3dd |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7868482f07ed5b658cc120a5f3e95a031a0154d8 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c320b285c7a515a0d98aa6769e7ba9bd5911fbb |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/d716771785f22941e26a2e9b1cd80d72431dec9b |     
  powerpc    |         collectd-5.9.1         | NOK | http://autobuild.buildroot.net/results/56fcdd4704f99bda347c8d988bff5b6ce755afe3 |     
   x86_64    |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/f534c641c0ec5932f5a123964c5128fd92284db0 |     
  riscv64    |      cups-filters-1.25.6       | NOK | http://autobuild.buildroot.net/results/0880018157d8ddc9cacaa7d3098e84d31681d10e |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/99b2b63bfbb0b30769dbd1a7107ec95aebe7de5d |     
    arm      |          gqrx-2.11.4           | NOK | http://autobuild.buildroot.net/results/b72e4e2d06a82a7bc427d939a25109fab5ff1fe8 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/01ad1687d708436efff7e35e6830405fc87940e5 |     
   mipsel    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/a02730843f05d1099272f60292a61d75ea5627f9 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c63bfd409f3c305b250cb5c7396613abe69820f6 |     
  riscv64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/db6b3d03ec97ed7d9ce9eb40970fb3a1d46b6568 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/daf7827e3059daa2c4d4b53b1069945dc70fb9ff | ORPH
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/aeb7d66f1a9196b7d47c94dd448b0866f5cf4ac1 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/1494bb0976c2768fe08d3ec641841ff5f8125907 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/2e82f027093025fa1b98aa0eddf88b3d0931c6e1 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/26c05948e62df741c9b027e6f2f328803b788b1c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7163cbe49d10ec2eda651729a0dc35a0e49ab0d6 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c1c0802a1000df197f6f19b4f5054abfe03e78d7 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/e900a70642a3db2374d8515fb9fa809b4093f7be |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/9b2bae7d59d1340e94d2fb9a5a81eb2f53e9a533 |     
    mips     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/bd4267f3283c9bc6e8409c6e0a4ee076e22a0050 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/b793911f76e1d7d46c89005debb33dcd548455fb |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/aacaaf8b929f2450911506f763e093649332996d |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/f835acb344083d2fd39be1ccb92a097c1b0e0900 |     
    or1k     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/58a5ad106b3702fd4cefd6ca5567a5520c692a54 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/ce41dd31ac4fe036ad5ce837203b5fb015e7b076 |     
   sparc     |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/9a857c1583c5d00b76a0a84ed08eaf469d7869a9 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/0bb434381e73d42b13cbc3f66500201907e28320 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/62f0b789a7c709f0e1038b3c1e2d8ceee2b29ed0 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/091473b9320653b0aedfe3c65fc0bbb11e437c84 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/0ab2f70ee6c83d4a0083f2c3f827131527f67824 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/e5bdae0583332ca09a1862adaeba8330be0df3df |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/1852fada9cbacb2eb1722cf4028b9e77a24fb18b |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/99b034715ed6b5a93897ce317c21f40d0c26d898 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/8fc88640f8d2b969536f8cb4572b69f90ab00098 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/094bea90968d1e188d8ff9be7d0c65d74f304a6d |     
    arm      |          spdlog-1.4.1          | NOK | http://autobuild.buildroot.net/results/26e866b5f3145727f4207bc62886de12342e99f1 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/3f8e0a290e3b9b13c237b78f300bf9b89ee45420 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/702767d9aedbfea3bdc6793ad9e3165700b67cf6 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2476f544e21acd15bf3055789ea87b521221b2db |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/63d268d5ae3393c4a4a6863c815c7d4c5be97c1a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e4ce37edef10253c5c0ee1ff397a7ec007de5e95 |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a80ed9d95230ec9e29d59512652ac4ad54957d88 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5ee04a9e5c60d345888f499a57661e16fa57ae1b |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ab96e6ebd779b0f7640bda1ad217de8ca5a5b56e |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/513e92b723343fb7ef41696f8a0a06b78eea0d56 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4aa06893ccf24a0e4f4c9fe8b630a49412fc8e8a |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/891cb4528313c9fdc636e60bec7707efab385fff |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9042b1fe80f21edab749b58a323f2339d59a220c |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/126a34112348d8354f67baebf43628b3e61b2fd5 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/08a10c69592d78e028e527c434ea558a664caa40 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b15b87bb5a191cf76ed2f421a359e29c58cdbee4 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b618d2b97208b698d0156090006cd398fa0d8518 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6a7dc8fc68a7318e06f84c8350a35466ef9844ac |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a61b62ad7f80a2aeaf55f377f2cdaf59323a1ea3 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/cd28e456a60de29a90bfeaa1052425cf0387c149 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/19c9a47bffa8f7d50c3851d3f7264cd53324f9d9 |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/935dd0718abb2b23d9f2212c91cc2606110dc852 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/408ea5f8eefdc42a6832d5713c595526c7799f4c |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2123052645600a34bf649d80734fc928c2347608 |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a9db7d51a03e2814a8566ddfcfeea11543f6d3f2 |     
  powerpc    |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/f86584cc3066ab99f70a49d65dab9435135f4a9a |     
  riscv64    |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/fed1cd3a3ced15614c59b4b7566ee33a7667402d |     
   mipsel    |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/796299954319caac101978de053d1de8f8b92d07 |     
  aarch64    |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/e632ea9fa8f4866d19c434e6efc5301d2a70c91b |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/7374c11bd4509e1c79c7334c217135b6264db457 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/f895a07f15a618ff5f3428eecd5c2c3954c754ab |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/c38df51b4e424a6e01875868a8f59364127fcac6 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/6138641c094cc4fd42a25e799d0ab875bbd6ff7e |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/1f9adb83ecb21833cc2996e6565f603f993ab16d |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c49c957c94dd13ed595f878af5e1ccf9540f40b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e495e43b8b98a8e77f9cc648a32b607da288ea49 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd2bce486ea0ec9731ae3f8154fa9a371dd470c0 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1452411f80415464f5529f115118bb4cf1672f98 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ddb1b04a29cbc6d9ad6a4949f11b6a0a96f11607 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/604664eb7154de81802d8a062bfc2fdfe58d071b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a1a8d2a84db5ca41479124c4f991b9a73dbbb67 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/e3260aaf9d56141a3429d0e54cee6077f5c74c60 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/378768431766678ec18b614dbfed572650be2d99 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/96792bccdddc2649a2d2fba1bb5f1cbf983e9bdb |     
  aarch64    |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/3c3dc8979cf807897873c979964f9c444a9d32d2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.21.3 | 1 
               host-qemu-3.1.1 | 1 
                         mimic | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |      cups-filters-1.21.3       | NOK | http://autobuild.buildroot.net/results/55d77bb587108fcb62c48ba9271476002150c79b |     
  powerpc    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/66d25a9762ce489d8067327fcbc509d55e3a7f9c | ORPH
    or1k     |             mimic              | TIM | http://autobuild.buildroot.net/results/315d36ca90e58d896d41572a32a4501ca7bca016 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/43d061d2fceb8150573589c0e1948cb0e1146a23 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
           host-harfbuzz-2.5.3 | 1 
            host-mfgtools-0.02 | 1 
                mono-6.0.0.313 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f1a105b275187beadc071d5a1df319149ad92219 |     
  mips64el   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/907bc58cd3aa2e80074875e18de5696ef3c044ab | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/91a04ddd9431559115545f90db03f520b0ad660b |     
    arm      |         mono-6.0.0.313         | NOK | http://autobuild.buildroot.net/results/0c935a4cf0832c83a781c3309316a4d1ea1fc3ec |     
    i586     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/70aa9f6e761c6dc906dd50cc2b0d53da5aa09277 |     



-- 
http://autobuild.buildroot.net
