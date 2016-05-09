From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-08
Message-ID: <20160509063023.2DB5D103487@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-08
===============================

        success : 139
       failures : 59 
       timeouts : 2  
          TOTAL : 200

Classification of failures by reason
====================================

android-tools-4.2.2+git2013... | 8 
          php-geoip-legal-info | 7 
      python-coherence-0.6.6.2 | 5 
                    mpv-0.17.0 | 5 
                   erlang-18.3 | 2 
               valgrind-3.11.0 | 2 
                 host-go-1.6.2 | 2 
                 rsyslog-8.9.0 | 2 
    erlang-p1-stringprep-1.0.0 | 2 
                   mplayer-1.2 | 1 
               linknx-0.0.1.32 | 1 
                     nut-2.7.2 | 1 
                 x11vnc-0.9.13 | 1 
                    mosh-1.2.5 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                    quota-4.01 | 1 
make[2]: *** [code/CMakeFil... | 1 
             stress-ng-0.04.16 | 1 
                    ruby-2.3.1 | 1 
                  apitrace-7.0 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                     rpm-5.2.0 | 1 
       openpgm-release-5-2-122 | 1 
           linux-zigbee-v0.3.1 | 1 
 make[2]: *** [all] Terminated | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    cups-2.1.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
xdriver_xf86-video-openchro... | 1 
                moarvm-2016.04 | 1 
                grantlee-0.5.1 | 1 
             qt5location-5.6.0 | 1 
                  nginx-1.10.0 | 1 
                 libdrm-2.4.68 | 1 
 toolchain-external-legal-info | 1 

Detail of failures
===================

     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/506780e9903c75ef413cb7fc79a67b6d41a4e1d1/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7638102ff7bcd6b9e50ec40807dfbf16f4026177/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d1358b7c4b166cde478ff110148cb6bcaf0e8e0e/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8caf72a580db8e95b0005c6a379e2b4b8bb9211d/
         sh4 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4a63a52bc9ec0e62cbf88a7510e9e14328bd6011/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7b48c4d88ee806b33e6be3f4dac53fee6d732631/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/394da9d2d4f15f0a6a5b3567896c36f8957f4584/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1d4a126d2f40ccfa08d34877244bfbe72af3f235/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7c49bafc67e4173ba93faba12beb19776ac7cb8d/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0b2205850f3775af5cf7949237bac384c8810285/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/d763598351ec6a0383b28996a55298b33cf7524e/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/69956e268bf891fe09a63597b2fb37fd108b0ece/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/4dd24cb5538d3af50469e04ac02e49d71f237195/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/086283b8e698f2927f2357b419ddb281ccb8393f/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/9567995b1ee675e1550cf859cec606168daefbae/
      mipsel | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/8922e31d20fd4edbd2409a1314bcc0e098dd6c14/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/b29bd7fa25d2c5a87d06abf0ec08a7df573fd7d2/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f615ad62402703699f2432dc399791f3146fdb87/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/1ff1fd044b6d060cc2e587f4eac46dcfe2dd1a6d/
     powerpc |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/330754fadee9e8747f7b133c66e798723ef04f39/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/9a07b03a1e08957abaec5ed05fddfac0e70e6e74/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/148829fbda6cf604a051a373460f956990a66449/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a345fe0b2ac02b5b6ab68e763ca317d08b646391/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/513c2a0a5ed8cebd4fc671115f57fd5f420af11a/
microblazeel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/15785bbc6f1357b68c43eb8646c154be8d0286f2/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/6f7e125415af5ebfabb8431b99fbdda754f5fa17/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/ad69eac01a574166bbab56040ee708f3744e66ee/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f5ed8e0c8ffacc1f0156191533b4d9a2d6583cc7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c9b68d53e7838e8023df6e203d55ce73af6f14ce/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/0466baee73191aff79ae372d3de7637af13d3551/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/d414117865a26c930da9b316af36d7c73042991c/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/6c614cd8989eb2c500b16f7a0aa1e47833d14343/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/3cf29d0d1fd7478e32150aa74e7746dcd92fc532/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1555dcf856005d56c612aebf7bc1499122d7c943/
       sparc |                   nginx-1.10.0 | NOK | http://autobuild.buildroot.net/results/20dc41cd62887222d2569d81b5865893baeafaae/
         arc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/f13c1e3713f5681537f52530d39afdc75c511e6b/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/c8fe784a0b26b3c90c5da609805820349d0d0b58/
     powerpc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/01f63e63bf3abf314add85bc190210a12248078c/
       nios2 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/1a98385662036f5daf5d99044d3a41a0baf297d9/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/61404b45d78c470ccad7df11d62817520fa2df13/
         arc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/da6c4bb0323e3f8c0bc9fd1148abed4e2df48af4/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/6d66ba5abc9dd8af13bc7d9293d88419a2e2af01/
       nios2 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/78ddb812be37e9a6bbd1bf48f8c8898b4b79d92c/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/5a7421a388a2ba8eb2c447d6db81b631ffd62c8a/
     sparc64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/7adb9354d24107980a8e198d5bffc6e9b2c3a81e/
       nios2 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/77f241432a8882877ae76bb2740c97f01a8e837f/
       nios2 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/b48ee2251a42e0843341f96f7729c8599480c32c/
     aarch64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/172d77ac7aa675e4efecc281e83d4fec14ae6da5/
        i686 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/1d2c30bc3e10e016a5c8c44010ce209526dc353c/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/9e2db74b7b4c445f110059a7ae61ee6ed27178b2/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/4a83946d8b6543ddbda178c5fdec92639056182a/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f508fa92463b1d910f6873f5c08ca33dff791248/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/350fac35ca276901233bc3655d04e1ac94480667/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/f6f4c1fdd3381a4760f0247b66b86dc657aacc97/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/e72ab45d9332e69e42a37276f6368a682119c257/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/47f221bf9a35782959554ceefb124dadfb72761a/
    mips64el |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/b15f72cff08fa8c422c28df05a89cc9e8ce405c8/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/fa837a32790aa470f9150501813b645c63e71943/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ac0c1d564b6c6dd0c349298ff26ef2abb815e306/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/96a70941ae1416a807218204aedb13ba49b9088e/
      xtensa | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/66165af1fe927fc25af2cda888c3086fe42700de/


-- 
http://autobuild.buildroot.net
