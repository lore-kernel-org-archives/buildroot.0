From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-19
Message-ID: <20160320073023.93392102E23@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-19
===============================

        success : 203
       failures : 177
       timeouts : 1  
          TOTAL : 381

Classification of failures by reason
====================================

              gnuradio-3.7.9.1 | 35
             lirc-tools-0.9.3a | 24
                     tcl-8.6.5 | 17
                  connman-1.31 | 7 
                     dt-v18.32 | 6 
           libimxvpuapi-0.10.1 | 6 
                  multicat-2.1 | 4 
                   systemd-229 | 4 
                blktrace-1.1.0 | 4 
                  cairo-1.14.4 | 4 
     host-shared-mime-info-1.6 | 4 
  getent-buildroot-2016.05-git | 3 
               valgrind-3.11.0 | 3 
                  ffmpeg-2.8.6 | 3 
               linknx-0.0.1.32 | 3 
                    yajl-2.1.0 | 3 
                  boost-1.60.0 | 3 
               pulseview-0.3.0 | 2 
                   taskd-1.1.0 | 2 
                 igmpproxy-0.1 | 2 
               tcpreplay-4.1.1 | 2 
                    cups-2.1.2 | 2 
                  gamin-0.1.10 | 2 
                    ustr-1.0.4 | 2 
               trousers-0.3.13 | 1 
               qt5webkit-5.5.1 | 1 
        ltp-testsuite-20160126 | 1 
                  stunnel-5.31 | 1 
                 gnuplot-4.6.6 | 1 
        lttng-babeltrace-1.2.4 | 1 
              lbreakout2-2.6.4 | 1 
            webkitgtk24-2.4.10 | 1 
                 mesa3d-11.1.2 | 1 
zbar-854a5d97059e395807091a... | 1 
             netbsd-queue-1.70 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
                moarvm-2016.01 | 1 
iputils-3a86a2542c6fe29413c... | 1 
               wireshark-2.0.2 | 1 
       gadgetfs-test-undefined | 1 
                  thrift-0.9.2 | 1 
                      time-1.7 | 1 
      ca-certificates-20160104 | 1 
                   nginx-1.8.1 | 1 
                      qt-4.8.7 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 rtptools-1.20 | 1 
                    ruby-2.3.0 | 1 
                 opencv-2.4.10 | 1 
          shared-mime-info-1.6 | 1 
flann-04b4a56533faf8c8228d0... | 1 
               libgtk2-2.24.29 | 1 
        host-gutenprint-5.2.11 | 1 
                 setools-3.3.8 | 1 
make[1]: *** wait: No child... | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c7db446b0f89d266f00cbcc5953bfab9602691ea/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f1e29b1f6badf16e1e193830b50933da84cea63e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/aa288b23fc12d5330279601e9a2202ddb28d9e52/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/692a22e18ebf1192f38a1be03d3abf21e96e0a3a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8ac87d0bfe60adfd5d0fa88d9819c7654cefe8a6/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a61546135db18c43d9f126c654d95104a1017f23/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/830c93889a519c32bd66023861f3ca7bfe7fb1da/
        i686 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/fb2a5cf4bb6300bbed10c4899c83af36ec1a308a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d0fee054a7b7d65f40f522fe657be41b15b63ac0/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/2e1a28cf093dd231ed1d8ffec521121baba7872e/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/c4afbe7eafc80aeffcecd3a5c619c0eff58afb21/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8efb79878dbe28d8cd9b8a792a4368fbb7085742/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/09b8d949162be9ae8e63cc11fa082c5c85828af5/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4a8cec079813e31b67a634483b25b77b0f94402e/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/6ebf0fe796a49fd181762e047e44620cfa222947/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/065b6cdb396c4faec9e172a7111dc1f5be6cbca8/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/654e6f99dd690655def50952c810bb24c077a99b/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/efa8acc2639f3e8f0682ae9a0526480de41cb61c/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/cf3f0da812bc48adb2ad571d7b71af4847e66d9d/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1cbb9c5a52b488bbfc3066de5b6902fbda52b06e/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5b066006347e81b8c80a5add35ea80983f6f792c/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/203f71beb3f83453269735cd0ddc7c22ef6e07e7/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/f3accecc565ec58b3ea37f6e52bbd8e502f4a0d3/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/8c7ab1f33d8dc443bdb8f9e210be4c50ac8f065e/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0c1ed7987e249a6012b8f818eeb2a359840ccb43/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/4bf3e1eb2b8b76761e72fc3c6bab298edae638b4/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ebc32791b7546510aa142d733e38ab52ddbc22ac/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/648179fd96c8cfebe50feb7b1a6ffc53e62a54a5/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/5502420162e00a0fa9197fb5d4d648487ffe549c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/29769654c1d37170e38a3290b542af05f685c815/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/4a0da03e28fe4d642d9b033f2b08797894605329/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/b6ed835c04f3aab09c57c8493e57d8a8b6ad5d90/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ea6e461d84974bb32558b5cebedc986c6ce0b65c/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/4bebf8092b1d3c6723bd11945937ae48e23011c3/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/49d79903c49581e0586dea831ef4f01a193e9de9/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/226d9d3144443e88eca44b6302075538037a1382/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/ec35beefa53133d58bcae91e5591c3a854616f95/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/f6b4d7afb60eee1d82f4ab30cf885f83413807f2/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/33748edd3555296c1d8a8b49c83bca6003781993/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9a2c5ba503345d2d295b943776882c33f4f0f1d9/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/eb099fcfc5f98daa9c06e24d45dbc97df19b0d4f/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/4469c2ba7e4611c7841ebac980a2fb17720b0433/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/71960b94efdfc3c00990315ceac9b6e871a1f076/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a40486033a535dd11a90eceec80b41fd350bb394/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/415d8475aadfd2bdd8feeac973c11b51b0bd1f80/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/11024182df6b604d558cba07f2f3898edcdf5a06/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ddee04bf8c477fb8ae6fe7f15b112485797dd96e/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c6c1bb98eb42ee1d23183e275ea02343b5753846/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/046a0ecc4b6b0d6df60b4ce3e279123e1c15123f/
       sparc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b44383ca61e1a235ba2be0f2d2e47ced7391798a/
       nios2 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c0ee1bf791618da28e9faec9db30e7114475f211/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/51a1161693e3d3a7af8544703eeefc14dd418590/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6cc844e7bd7761e2238f55989e71520b91dd2a9f/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c814797698adb4bba7044c2edbe0ca3655d94fd5/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ae330a15a579b0d26d801ebbeaa1abcd896df177/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8ee3626e2523032218e17d9e6644403e64768f2d/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6b5cbf50a9c7c1f275ad876c77892c72358f23b5/
       sparc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8b79a1e597d5f3f73d0534e90523692c6b8a18d2/
        mips |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c264cc6a5266b2703e58e0222f5b79d67ca3d450/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5b644a88f457a8c5dda7961c8ae8b7299a774e8f/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1402de7f2d7ab36bf92cf5abdcb7ae90f0d13604/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/30d4322e0a9fc3d8b04c1ad779e63cf17196fd5c/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f3dc0c224174cd8beddeaa8ea089320ddff621b5/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/aa08901dfd81f6845dc632462bc32d921130c6b1/
        mips |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ad5bccd2c4496859824f84327038eba5f6206d97/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f7b4fb5d8a65ecf45361cded2572eaeba1ea4302/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0277af68c363af733c3e6f3197d3ef97597c5d7b/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8e038ac8b6e43abc4c7d437f267e497d7f808926/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1399e81c32ea60f9ba37e9b5c1e6bf07541fba81/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c3f186ebfef53e60dc2c4c7c8a27e6b3771f001a/
        mips |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/17d1292adaaca5025bffb42191d9b2172246a514/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/71f97ac20ea41a66daaadea5738b636bc45e805c/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c958d9a11a3ec1c6c3a5792193c3b0df0529c812/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6c53683b5a1482a0be7ec980da6aca2cb07026e5/
        i686 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/33eed2a5a57db217fe5217bc5a6c3a2d0d20750d/
        i686 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/87bf2e5de9678f134f85ae444b1e6a4c4a353488/
    mips64el |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/0fb4ef3af80bebd6bac3cda0eac4f377a267157b/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/25c431bd456d320c98b0cee66116c25f68b74439/
     aarch64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/c61c3ba2aae4ef53cdf9922bb1d1e9241ad2fe43/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/083f38546ee4748744629fb2e3a3d291b6b8857c/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/d8e8454da9b213799a855f1239d6b8e8b23699a7/
      xtensa | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/f1109ec28aa1df8b08a9a59739dcb0321fffcbb9/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/8805968a14237959fc0e20675a7b6346e351326b/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/8a3b5391f73149c46b78d5d864648e0d8c17801e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5f6f4fbc97baca8befe662aeb3cd659be3ba44d8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/94fc617eff81eb29c98f24845457d65a723923f1/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/43ac7bf33b486a9afd8ef4c792d7252ab467196c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b506781bdf8b20384b955f4c5a569c4b8e763fcb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8d8f4cb529f8c71541800670e7ace9156ebfc285/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e37d9fabb4ee477cd6701c4be339f8c89138162f/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3957b00fee613ddf316052b6dad4734f555a6085/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3b1b89ed511912ba76081c5db8b2fc921f5bd32b/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/723a9fe2ae12a0fbfd38865c0966b58da93f8c7f/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/d9039e46270202fc5202185e895f312c0077752f/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ab3433936f28bf78c6a21a9909f2fbeb48003bcf/
      xtensa |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/d9c7a376eeacc491b1a35a2ecc8aa0a7f459b522/
      xtensa |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/fc9f9a1c01f5538076d028c3b53725c2db2acc69/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/2c489edc4e858401066f4acd8497730887492a62/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/a5fb16beb6c3e856ef213cca9612fbf65391e6bd/
      xtensa |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/c1b168425d04e9b1e996cbe42fe9a3546c803785/
         arc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/16affb67cbffd2d7497c990e6a9c7c8aa0df9bf2/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4993fed542eb97506b17f91de657c554e1fab9c6/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/d768e96a8ec77dfd2859b4c8fb217975db037bf5/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/1ba226f7af5086642ed8897f6702974f4cc24d87/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ed2184131ab6a0d230ca9e4575ce7abb84729e6d/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/e5c4199a77b66a67da1060d1e9b74150c1c12a7e/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/b15983dee78cc34ed4620d85e36a7ae93dd5baa7/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/864a1df6cab5d3b5b48ec74b3057ba3ba88d98ec/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/31000cbce9e658cbcd60da12b4500243703387c7/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/7ca081774ef434de7823263c59c34b90929f1026/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/6445e34020833aed2dfe5f085fde613d437584f4/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/edf8f9c50845fa85538a86861a4c5d7aebeb5f17/
      x86_64 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/f417a17ad24eec8f72402a634588c6b3af8293be/
      x86_64 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/aa497f2a5df6aafa733102a38d6190ac6e01b719/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/6bdf361a9f8496afeafb7be0321b2970e7e4c476/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/9228edff068d5660af85e6d2cdea35011bb8afbb/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/2c2ca43c60c5b7d580182a52d42ddb0d0a2fdb44/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/23c53b832362628a2137185dd228c2de47a71724/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/ae83bf49274ccc246ae1945f2bf6fe1177da4fb9/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/1f421e1dbab64a9c4bc9cf046d83925b31463d04/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/d22d8307b8e632c2243ecdbef1cb26217d4bfd64/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/bafa89bca753bf0d7feb06f4776919f12c88830f/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/964505c1c6cbc221b2b17ad1fab4ff332374c8d9/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/f67da69f33783164bfa0013a47c949926911d1f5/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/b930fa051fd7931633a66ee33e0d75fdb69c444c/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/63320174fce5ee2ec68521548ecc0350e2698272/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/010fd134d091678dad21399b0f7e1f4fd5e10403/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/0087678301c3ba4a1f291c4062481d313ea92303/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/e6cf80c21cf356bf0f5c6414f50d69026f69a0b0/
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/0cb5d2407d8e295ffcade22eb8cb0bc3e164a2c0/
microblazeel |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/2ac1c2fb79a46605be829ddfd44db671ba229f26/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/38d8c7f64c7b83a3a3e8eeacfa73b0db6fef322d/
      mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/f520f32afd07b8520665214b14462f4d4e20e8de/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c3d199999c1a2e056d2cc80ac2ede440f8513a3c/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fb0721e69ca726b7e4dc30462aa00805ddbee211/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/4f5036947ce9962d47508ac520836bbbbc923d53/
      x86_64 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/4a98d3961d59ab2f1ff7210d0f8b15fee9086219/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/df9f891568e4bb1ae2869870f3c81230146318a8/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/31df73115698fe1c20a30bfe0d51fa46cfb4eb38/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/d7a2cbc00b433adf8766d475d603e8e49cf17390/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/93127282f938f6248f76578964123f77ffbe203f/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/57e07246437f1250c4cf36009d35a6a8b8121bd1/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d33ebf537f785a0b58d49c27b5a45a81eaec5da7/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/bed89a999c7fffa9c88e9a3248c1a0fbb4d5fc67/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/147aca388a61c966b09669bff7f669e938b13607/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/caa58336b9967c6fba8f3d13bbe712f0cd873f22/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/db1cb6b96207db370f9cb2d320551cdfc3014782/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/97cda873e3b4a88f164d43c6e3a9fec3bead6bf7/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fe1a440fb8ecf123027a8c82650fb87619e60555/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7b5d9fc541363ab946bdda87db4ab450c867261a/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3900d7900595a58c72ca65371ec99c5ca0ae6fae/
        sh4a |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/68f2f48227c6f11f51070c2b8441567b29fa9597/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4cea61e335ddbc9b14fb24ff84e594e6da148df7/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f2b180ce6bcb07f33be1366be902f5e8b9ef9988/
       sparc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ecaa6f6b6cda2a02b76e9bdba99c86de717f3417/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4dfe7f9503cc2651898c37f55eddaa29eeb6b4cd/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d699c1cd2a478eaa87a5bca3e239a73873a26a0f/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ae8a2e1c7928b3e3b3dde72b31257fbb74ec581a/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fc09ff306105cbc9a090c633a8c7fbc6ff0be470/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/88c1b53075e4622cf433e4d124880f8c215b0612/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0ce4eeb7393d966fd22f0eee47e01c24bfd507ce/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/dde7a49a33b0993106f9d0268c7af3119d81f578/
      mipsel |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/3e33a67965eb37471ec3303ee26f6a66a82383a2/
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/04fe89f1f0d62f175b893a3e50f1fc0d2cff6b0a/
         arc |                       time-1.7 | NOK | http://autobuild.buildroot.net/results/6852d4276c7e3240ad175cd7a4c2ef2e31ee72be/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/46ae004a9407e796dcfdd08e9d1bc7d0f12e1748/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6b8028d01f652fe9b794011dbca5ba60d71dcdf3/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/dd1fff8d70bc37676c922ec73a4cc5419d648b53/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/10c95bbccb82ea8718d798e1accee319170740ab/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/8a8f785e4320c254eb247041cd51ea35aef1e2ea/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b2cb3065338046eecb00be5cffb1d5229331cad4/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bda0e64842a58d70c40bd25e52c77a114a339ba6/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/11422a736f2d5decd29dfc80c20c3baaeb35169c/
         arm |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/ccba0f58cf3e1c680faed629325c4ea2164f3ff5/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/cf9e952f38002658459e924420db6500c1313194/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/8118c29dcfb9ea1e5e14c805cad46faf57973a69/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f21f363f794fb786c029b4dabe591be4d4657b2e/
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/855ca75ac49b422bc1b89b19e9f093eeaad07313/


-- 
http://autobuild.buildroot.net
