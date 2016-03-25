From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-24
Message-ID: <20160325073023.AF302101F04@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-24
===============================

        success : 215
       failures : 188
       timeouts : 3  
          TOTAL : 406

Classification of failures by reason
====================================

                     tcl-8.6.5 | 22
              gnuradio-3.7.9.1 | 21
           libimxvpuapi-0.10.1 | 13
                moarvm-2016.01 | 10
                libldns-1.6.17 | 9 
               linknx-0.0.1.32 | 8 
                blktrace-1.1.0 | 7 
                 qt5base-5.6.0 | 7 
                cgilua-5.1.4-2 | 7 
                  connman-1.31 | 6 
                    cups-2.1.2 | 4 
                  ffmpeg-2.8.6 | 4 
                qt5tools-5.6.0 | 4 
                  boost-1.60.0 | 3 
               libgtk2-2.24.30 | 3 
              gst1-libav-1.6.3 | 3 
           lksctp-tools-1.0.16 | 2 
  getent-buildroot-2016.05-git | 2 
                 libgee-0.18.0 | 2 
                 copas-2.0.1-1 | 2 
                  stunnel-5.31 | 2 
                 opencv-2.4.10 | 2 
            webkitgtk24-2.4.10 | 2 
                    yajl-2.1.0 | 2 
                sg3_utils-1.42 | 2 
                wayland-1.10.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
              rabbitmq-c-0.7.1 | 1 
                    norm-1.5r6 | 1 
make[1]: *** Waiting for un... | 1 
                   mplayer-1.2 | 1 
                    ustr-1.0.4 | 1 
             coxpcall-1.15.0-1 | 1 
                 jack2-v1.9.10 | 1 
                 mesa3d-11.1.2 | 1 
       openpgm-release-5-2-122 | 1 
             lirc-tools-0.9.3a | 1 
      ca-certificates-20160104 | 1 
                 rtptools-1.20 | 1 
             stress-ng-0.04.16 | 1 
                 setools-3.3.8 | 1 
        host-gutenprint-5.2.11 | 1 
                 mbedtls-2.2.1 | 1 
               libsodium-1.0.8 | 1 
               iptraf-ng-1.1.4 | 1 
                     tftpd-5.2 | 1 
               ipmitool-1.8.15 | 1 
                  dado-1.6.0-1 | 1 
                libgpgme-1.5.5 | 1 
                  ltris-1.0.19 | 1 
            lbase64-20120820-1 | 1 
                pinentry-0.9.4 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
                   systemd-229 | 1 
                   taskd-1.1.0 | 1 
                libgtk3-3.18.9 | 1 
                  gamin-0.1.10 | 1 
code/CMakeFiles/assimp.dir/... | 1 
               valgrind-3.11.0 | 1 
                    owfs-3.1p1 | 1 
                 lvm2-2.02.147 | 1 
                  cairo-1.14.6 | 1 
             ipsec-tools-0.8.2 | 1 
                      qt-4.8.7 | 1 
                 mono-4.2.2.30 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    mosh-1.2.5 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a3ebe5c8d65fed8abae5d337d52004c10785d025/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0a38408740305c9033aec29259f860d5c4fca00b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c5c391ad0e402fd8423aec27f0c35bb8ae1be1cd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2f7c37897267bfdfea7698cb22b0ea1fc99c5b24/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b9314ddd438d898e4ca2c7d212d9d301a3fde5fe/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d645805c3e8b46108e88793e3eba6153a2730c82/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f1c1a03114279f3d6dd26790177a9ad64cf742d5/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/94b794149a8251161f37ab5f013b85551c93cd7a/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a6be634f1bb18795ce8c19b9a850b9b3c0b50253/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fbc6f73d36118164557b8ff8f4573986da82b753/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/c79f6a378858e3de3e42eba6050846401600ecde/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/0de120cc9a4354479c22cf4da69bd413a230906e/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/a4d6c822e79c776e85841c378f8584cd4caaefe9/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/2a9892e65a0b16a0fca368c2d9521b97267931de/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/164d3cdc1fa75e49c7775c084890a0a39ddb6d91/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/b6781b5fe8f1f6cc84aa4810370af154d56fd169/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/9b00d54856b73f606e73c67e148bf8229adcf882/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/b7cb6a3f789372f37b6453435bfb10312f657be2/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/ec665a56616b1cc60b96652934cd783797c2de80/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/6329efdc0fd529a3be6a02a2c9baeff62ac36c44/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a69391b458a2f00b95eb8d546d9076f209e65a99/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/03e180e503ed2c196816cdf1ac538297c7042339/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/befad573780a2c9772e43add914c4a7c4212bd46/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b567b7fb6b44c62a2edcd8008cd3e1f85ba393f9/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e10558dd302527e2f7ac3438f4067a27273ab0ab/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/2a46c51a73b0770d32a73a3fdeaf4b4a6ad91484/
         arm |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/ac9edae0def1b9262265c2c42a3d94540ded838d/
     powerpc |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/cf0dda1d5117cd8a0574483893aac362744c97ea/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/0be3258a3bc434bf04260cbd51963ec7bc41fde9/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9c9bb3d1a6c48898ba48dcf798cee107e6d5eb35/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/2061c378186827c33d75fe1f1d0dc92484b8f867/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/8f2032b1f0622baace3bce53e82d1a9614c6400c/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/436a24b03b30bc9ee5fead62b4463b3cbed247f5/
      mipsel |                   dado-1.6.0-1 | NOK | http://autobuild.buildroot.net/results/df50a1f6e0e5d1b6a3dce3aa85a5c1af8c0e8024/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/558142e70a9bce566c924b0dab9c1823fa81aa6a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/ba42294b0f4ed20a2638f8584a6ab64fe96b6fa2/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/0ccf450ce018cf494ea43f471914f6decc931c4d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/19bdd06a788d3b06c7662686549bc0891e31d3d2/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/dfbf94422bcf5098e30ac5679731da1162ee6e37/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f5a7ae88ac95f7f6528ae0aa16f30cc515895612/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/acc2d3f52eaa7fbe5812470b04fe076b191824ab/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/44b867a503deda32a7e8ea9900b8665d314630d9/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/332d67168a118001add6f85192fd033c10e44599/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/04b4ac45ec11e9ec790db47e5703ca7448cd1ccd/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/cecbab933453019c6e2ab621365891a445b52029/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5f1acf08eeed98fb4ecaa8681b0ae7560bd9ad01/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/bf5784168d8c2aa75b45df90801be65154fa77f6/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/542275defdcaa07f37653ce2c511e832d881168e/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/aa5836bb73feb16e1a99269974e9ad9a1ec72d6d/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/711d3068e5ede0f53eaaf4d04b893d78c38a3078/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8b15364265a0e7fb708121c24f8befdf494a98d9/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e6fce2eda44a6340a0c6326a131e33724d6d42d6/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/12b237468ec247a776ee44cc3e29f04973275eaa/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1ab243f5f4d1ad0789594dca081d62636bf701d9/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ac3940d1ea3cdfe3133db220671ab1c478823d41/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6c37223e29cafe1192a52e18fbde7c81579da355/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/4672dd3f6dcd5a63e0db29ec990b233edef4896d/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9fea0e97f4b69d360a03317596cc24b9676c4180/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a9e66ed6bbb3e75c496de20e74a4f031970c5a80/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/df3c441899b77c56a9cb20b8306ac4943c5a7991/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5aba887080282b0fe03694d28605e1fc814ae7d5/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/be57a5fbfa29909132373ada26b19ff45a5857aa/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/cbc3198f86d57d5f46efcf46a728a7e93e0bc959/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ada2d38db7507486bbda3ae9f4c5b9a3080cf760/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/6b6754353b94503116bc73a754ddf01cd1252d46/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/3e57d5120a7faf433e08eb7729bc3200677f5e7c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e26a3a1b4431d6c10efa131224ea2c0be4f729ee/
     powerpc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/72ae20cb710edfe1e5b6af20dd275ef92deb04d4/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/ee1843e5f1cc53197e7ebe6cf4fd3a7387ef18fb/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2e225c6ddcda44adee9eec690c85d7283a926d20/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/7b4ec361779fedc82a295fcd17672a35c3d7e6d1/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f47b14ecfc2b2db638dec432e34c011ce3a32cc2/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/e244607240b5f231ee6b12423c55732f847eab66/
         arm |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/5d6997f2bb597ab46b067e929788249ef325c5e2/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/4e11138bda524e20074dad16f05514155c5ef861/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/0407c03078a77a3358c31f7336e9f7010ad69a8e/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/c0e930b22eb607c867cd84dc43d439648fb0041c/
         arm |                libgtk2-2.24.30 | NOK | http://autobuild.buildroot.net/results/74005eb9ce266ef54122816d39e37b24a4c34819/
     powerpc |                libgtk2-2.24.30 | NOK | http://autobuild.buildroot.net/results/f789d26bee0d20cee2a102125af82132e048c1e4/
    mips64el |                libgtk2-2.24.30 | NOK | http://autobuild.buildroot.net/results/bf493977817a750427aae82e71a5257187bd7344/
         sh4 |                 libgtk3-3.18.9 | NOK | http://autobuild.buildroot.net/results/190f818e77bc809ee991395013a07090911affe8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5780ba8ee494ad8fb02d12fa7a6cbed8caa2ea62/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8726b8369335a0178031a4eac668641596085088/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b73692bdebc01580b679da042803bd5f8a574213/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/7b92ec6c3459d6dfe7c2af7d5182b569f52dc3bd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/cd1b4da582531b5d207f5489043c1bf10b2b1e5f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/16344f93d1b1f359fae542538fb4586055e1c5d7/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/bf78bcd5ec395daabd3a115d64033fbe551d40af/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/fd175d05da966c1de5f6339f2f327401ad7ab3bb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/59a690b3cf3049b7d1c821d92303043051323f1b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1245e6c61599c0143a0e52bde289699dbd54b799/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5fceeb805be8c7b990540adbd4238d4b26ab7d50/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/63b11231c5c2f1b8615dc4192af420b29336ff9a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/fd9a33f7cf2a74aa99fcb97bcc55fff093212935/
        i686 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/32519c6d4084f334b7fed9edfb8a8c68a1f840a8/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/20bbaea73a8f4a7748f9902b267c139fbe764660/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/09c87281d87e9e4ea0d172a68f16f3070b01e04e/
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/72772f861e3657fb193b467a00df96079441b64a/
      xtensa |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/96ce9b6f48a74b562ef293a21c00eeb4bf337dd4/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/8f7f842087129a5d1a8cdf208c3c93600edc1b7f/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/a199b0f88e9ce7ec394a2b3bbf05b3eca98037c9/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/157cec8f0d07fdf9a9358ac867d93a226d4d4785/
      x86_64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/56d76ce304b881bb7da6373baec87a3b48071814/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/87bab0c93a0860770c09b431b79e75133d2865cf/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/63b2055ad6ab28d9a98a2991b654ef5ff84efdc1/
      mipsel |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d6b9ee65c8cfad83a681abe6b3ddbdeb2cba8777/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/9d23babaa739ecb8e7c2ad09036a5bc0461d3a8c/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4e5018fbf56d29dfbe75bb66bc100ab583d90931/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/c1b44f942deaffd76531ae70a7ec5073819c1ccc/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/5db8e7f7669158388cd9d75122e64c74da48af88/
     sparc64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/fe884c8693062a393ea98682dd0270b745e700c7/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/48207a44bde329b6d42125b766ca1912f448756e/
     aarch64 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/5e4021fa918aa8cdcffaa6945849f0aaba2ce76f/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/c50c164103ee6e5faa224a96596036a19fbc8c86/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/5c300dc635f9a4106bdcd02d9cf26fb9970d4af9/
         sh4 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/807770fa65b92147ccff3a4b0a3a447c025f8185/
      x86_64 |                  lvm2-2.02.147 | NOK | http://autobuild.buildroot.net/results/1b44f1142336ce5a4e37fb4b2e349e5ebd098487/
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/a6dfa8cbbb5c81a2abce47f7b3e38bf73aaffacb/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/61565f1a88b7d6eea03a355ccf8dd3fe6585c4ab/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/0b7a2d461a62d980cdc70e4948e188d0d822843c/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/9ddf59b55a67a9d81bfae864e134aaeb25b58084/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/a938f9bf84be84b52472010ac45312fbf682422f/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/eca527ce81cf764629ecd61a537e959b28fa3f4e/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/5ae25c346b78f50f24b4b784ce1a1ddf0c85c588/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/940dcb8853eee59e1c4532011887d6f5d9b88886/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/6a0a249238e4e995634b855da7596cc31bb36573/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/62be64bf0713ff1f9271e134e98e81cd5a03ad5f/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/d306380356cd25ba3b8a2123c98364ff6e4e2cfe/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/f7f73add7cc0ec5f8907cb3d01dbd01c7a38ae55/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/1d2099f5c2a8f466bef6b1d33b515175a56fc08c/
      x86_64 |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/f33c4eb32fe50d4a3487f5e7be22c8639c4f168d/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/4a24915b9ef12726a6e6acecf0dbe64ef292740a/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d82217ab86fd65621bc86411cceefe548c0ea2e3/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/29d3600d226e7f478107ca2c422c2dd2ba9c5943/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/5ac4cfc862555ad9cdce3e73190a597a017fb92f/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/998a823304868d03d5aa4d52a94ad4eb42170cb2/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/38c582e9cce717bd587d622b37f947ba258eea92/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/0557f8a35e2ff3dab934015eef5e425365d2b8aa/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3a8fed41689e2aecae91afe16e689a07b2d9a3d9/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a9d12fffb167b4b7429d177498d63b0e7ee573cc/
      mipsel |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/566b343294170e03edaa1272e4576c767dcb0446/
     powerpc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/5a13d9f73eae51494132256358a389f83f1be628/
     aarch64 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/7d6c1af2e70f0705131f383e8980fd3af63e9187/
      xtensa |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/3a795d9e471f615b74fd367264a38d1b49b602e8/
         arm |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/87a9729b50074ffa24f517ad2102f59970952e66/
    mips64el |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/11608f85fcaff72746f19bfc7cf80012bba9ba90/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/de074417444c41b1b74e57ad1de18fc3b10519ab/
      x86_64 |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/9ee252953577e00bbcac1a02682297e4a2cb7c5a/
      xtensa |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/eb9ae5653500628538bbc6010d1a7fafe4888507/
         arm |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/e07ef18844082e1ce5a95caf90b9de4ec5174de4/
         arc |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/f9e9643e12bbe58969a82851930bb52a76cdc31e/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/ae32f4cf3660d309363f2a25b629936019eef614/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/cbd205b0761256fac02067e9b12e9896a5592d00/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a146d3555cef300377a949f2611a6b0d9dab4178/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/dc7f14494ee351058f88da942fd15c52fc190f3b/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/93c1f2c45aa3dcae86691faee4e6891ee659d53e/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/1dbbf869386cef325ee2a42eb77c090a95c821f1/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/fcf5a0f359403267840c940a93febb1170efb473/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/bb70a7a07068a5743ddc772a128fbe8acc06889c/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/48338ac1197686f0e32b03e9319101d92acb828a/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/ec49cfc6d8c0f7e8b0f88a710685190dd8b63052/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b7bb0845f1e737ec5052bf4eb40de7f7e35459cd/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e74e47b888910f8cab2dad09d2dab82e25c2f6a8/
        sh4a |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/23d27e1ef4d552129b97ca01b6a61f71fa512305/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3e43ea90e2293a5acb749c6ad456a102fb4b11b1/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/bfda3dc3e0d33ddbcd0974e61170079b368524cd/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2fa88c0371f25bbf9cccbf21b588807191bbd86e/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ccdc83dd194d4b718e195e8372a3dc5cf76e2034/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b5c743498827b8136c3a8a8b00862c0d9aa36d22/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/43f89cfcb7215984fd9d24f70c4523818b2941ba/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/bd0853cb9406c69980176c04944aeba2c3043084/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7973e110a0658c266f5ce09b3cf31964adb46d60/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2cc30531754ab93e91e5c3cbf06e8d3b025d0675/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fc6af1810d730733fe13ef6b8ea51526450d7dd2/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/54599be62355c762a982e521a88bb424063c82b2/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/40e58e814b4f04540c2b744f2d9ad40f4709cd1b/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3fc1a88e59de79e422b6ee743087599dc14ccd6d/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a4f9a6f7ece7c9a7dfd05be1ea19782e5d1863c3/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6c7040bb1f725170956e89312c0e13a00bf04daa/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4fb7501b0ee78043f1652fb9620ca37fa6090fa9/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fe8256c14227ca7ece7738021f7edd21a403e907/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e7a76f1feccfe59223aac4b26eac3e27dab36e63/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d06aaf85d5fd1628f0bfc533113daf1aa188fab4/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/a5caf2af509185cfdbf5c16e93ef59a38835acbf/
       nios2 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1bed25eeed2716b5a5c729d1c02460e79846f6d3/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d74f6ea11752da252640a1828a89afff8e2f6e6b/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/9fe8ecc03f41ce078e24ab2978bb668368ae6abd/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/eeeefc5f6788bf7b60f5f8c08c913797b7032440/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/c4df22b9812d71b98449720bc95484937f8c6914/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a302246d5d905ffd7214d5beeef607e3360224e5/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/00ffdf916fab6d761912647b8745eaa3c5e74a8c/


-- 
http://autobuild.buildroot.net
