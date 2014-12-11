From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-10
Message-ID: <20141211073016.EFDC7100E7A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-10
===============================

        success : 267
       failures : 131
       timeouts : 6  
          TOTAL : 404

Classification of failures by reason
====================================

                 libusb-1.0.19 | 31
                  guile-2.0.11 | 14
                libexif-0.6.21 | 9 
             libxmlrpc-1.25.26 | 8 
              libsvgtiny-12121 | 7 
                    liblo-0.26 | 7 
           libusb-compat-0.1.5 | 5 
             armadillo-4.000.4 | 4 
  toolchain-external-undefined | 4 
          libcdaudio-0.99.12p2 | 4 
                  perl-gd-2.53 | 3 
            host-libusb-1.0.19 | 3 
                  sispmctl-3.1 | 3 
            modplugtools-0.5.3 | 3 
               w_scan-20141122 | 3 
                      mtr-0.85 | 2 
                collectd-5.4.1 | 2 
                    ruby-2.1.5 | 2 
             bluez5_utils-5.25 | 2 
              host-mono-3.10.0 | 1 
                libedje-1.7.10 | 1 
               libcap-ng-0.7.4 | 1 
                     rpm-5.2.0 | 1 
                   zyre-v1.0.0 | 1 
                    fltk-1.3.2 | 1 
make: *** Waiting for unfin... | 1 
            gst-ffmpeg-0.10.13 | 1 
              libarchive-3.1.2 | 1 
                  xerces-3.1.1 | 1 
            kismet-2013-03-R1b | 1 
                  python-2.7.8 | 1 
                 qt5base-5.3.2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 libssh2-1.4.3 | 1 
                pinentry-0.9.0 | 1 
                libupnpp-0.8.6 | 1 
                 libsoxr-0.1.1 | 1 
               libsigsegv-2.10 | 1 
                xapp_xfs-1.1.4 | 1 
checking for memory.h... pa... | 1 

Detail of failures
===================

         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a641065aeec64c254c1bb19da02fdcdb7106a6db/
        sh4a |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/da9231916946d083cf322e36a7296a3eb2a88c1d/
        sh4a |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/f3b66d916d9a79e807757ef2ede2c7bf7c25dd83/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/956af0edf5288461950dd73cd2a805633a558b66/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/da4b77dbb98a1d6b905779bba4f485b8c98ed553/
      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/678e9678963993cc7136b7e730b38588c469eafe/
         arc | checking for memory.h... pa... | TIM | http://autobuild.buildroot.net/results/bd94e716822dd51cbb596a50f6e214f8e2163f7b/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/64a4ba5b5a7ed2116cabf559e33c7675e785d4ff/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/2d4fc9cdf24def083944a20df007de4574dcdc5a/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/14e99623f6925469c62fe96ba9009ab55c7fa3d7/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/1b1682347b3c3f7cca1ec50bfa240606434d6fa5/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/76811ee773076848c414093ecc817ae9595dd3b6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e27319d4428fa2680ad59ebd20ef1f7f2ad52d14/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c4db3a983ef92c6ad844964db0d13fced419c7e8/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f1e7742e2a4f85fe6211b24d078e8916839c9e32/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1995592dbb0f84b731a95cbe3cf47712e15ce8eb/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/60ca72723c21706b7c31891ce644e399198fd90a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/886b9438a37af30b105b6a32917c74a8a4cf96b4/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8bee0ead1becf72348a298e9f43471c7fd3dcbf3/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/95813c5c56461b88913ffd74f43c90980370fab7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/86cf55ee35da16f2738da2b8160c2fb9829bcc19/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/100be9e24423d99917a65f647100d8f0eb04c0dd/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a753fdb3c4ce406512cbe45d16171736ea8b3fbb/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/78dbda15062eb517d646a28361e77a5ebcabdec5/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7bc2d5448cd60009510af8aa7d3e15a495d80e2f/
        i486 |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/c962b3f01f769f8d1f909bc737ef3fa776c4cf98/
     powerpc |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/572e10f48a12ca213273acc834400b7ae81f190a/
         arm |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e620d80af0de325fc3a3f7e568703c3eaf0d5e9e/
     powerpc |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/940c9aaf633840b61aa2877587c3e02f1b2bab30/
      mipsel |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/965a3e345dc0a432043b72581bff7d33561fbe0c/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e10986973580fee0e71e3b30b4f3551ee756a598/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/be9eabd0b82600748c82a45290257ec16fba6ff1/
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/e567539184e006370e8c4bedbf254b080d659132/
     aarch64 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/97240f1f7354510019119997c33f078f2fb0187c/
      mipsel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/d092c1da69f822e760b70e9945bb41e791ca38c9/
     powerpc |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/503fd012d1ea2a4e2c7d98f512bd39056de0bc38/
     powerpc |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/c098b590f279d6c4b555c23f02e100ce2151d82b/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/2e6bc7b6a0fc15104ecca43f699ec523e3e92b6b/
     aarch64 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/046bc402341e31477929e61e9d0248857d7dcae7/
      x86_64 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/d0335beb594d781fa3cd69bfbaeba41886acb815/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/63b2f520482020541747ed4ca36ca464957debc8/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/e6c00f5f88276d361d8ed7b4b544a525570682f3/
         arc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/3ca71ac02fbd0280e6824c683f15d779cf5accdd/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/4b850be08350033f1e70adaceac7d5adfc590db9/
        mips |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/4bc0505f423ad923713f5c44e94bd6c42f5612fa/
         arc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/44aa62da810fbbbf12c97fbca9c13023fa11da6e/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/9a8dd3b3bc900defbe5e34603fe335d3fa689aba/
    mips64el |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/113c423c0be778f4ea6cfc10262327d981adb333/
      mipsel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/cfc33c458d54920066d2ca1465871f31879bbb56/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/16878e225bda89139723dcd565fc54a844f6cf38/
      xtensa |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/04a4d6b68cbe9fa4d780ec2c6643a9031b21841c/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/e9638680b8bb4eab14b4b389f49a67a5e2206829/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/7918dcfc0d2626729a65a64adbe72e3d15abfff4/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4a5f4707a1e9771f82d584190dd1897813c0b881/
         arm |                  libsoxr-0.1.1 | NOK | http://autobuild.buildroot.net/results/3e0bedbdaf9f48d13e89254ec55369788fc4a3ad/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/c72988a6a1a8928711807a35b3ac20742d4cfed6/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/ac6ebc326b0d0d13a61f90191d3c4d16ff255d1b/
        mips |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/e2ca04378271c196b0a5e64444506b2d6420cdff/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/f3d9ab591651f95b40b67a3867ec648d19c959e5/
        mips |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/474515650e4b4348c4dc4070c45cbe7b6f82c7fe/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/cfbeea3e1bc2f9f6cf4cbd123264eb129ea32d34/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/ad90870305e75fad6d459bd9472a6c4a4fe0859a/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/ae59f1358236fe82e7639fec931067f11bdcf79f/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/3b67b8d3e133931495089f2a6f9a4e7c80f465fc/
      xtensa |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/29f75d8cbc068151e67e110acb2e60d153147ad1/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/a2ae1d1f1e45fbb1986ca0f62f425e3b9d02ed0f/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/95808612f440f9f6dfc74f644ce72150c7219440/
        i686 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/5898ffb6453eae89ba61456a725fa627e4906e65/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/42437bad2c796bcd365966a5337f5bb050f7d523/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/3202341f76f627c9fbf47d18a5e75c5180357858/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/00b96eae64f92e8b11c902e8733a8e54babf2c7c/
         sh4 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/92002f1a7bb1fa4007df1bd4ed5c3e270ba6eaac/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/7b92b0dad2fc6644cfd8ee08a741811721f2380f/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f0ec91833486b9e7738a440d0f586322fb182e8e/
    mips64el |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f8f4f4a161a667165a970ef22ca5ece93da22366/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f281301fb029d7ff79656e96c6748154b6474567/
         arc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/783f423245ab98c3f461d6400bf48644ea88b95e/
microblazeel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/edd6d8aa86953709ac0c1a469b2bacbebfb0672b/
    mips64el |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/2bcd4958515f5d6475c8b0a1b595f2dd980416e6/
microblazeel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/5d6f45c495d81229e4f8fc611ef4713f27627998/
        sh4a |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/956b45cc7b1cb178a828d1e797e5eaa7c2e6094f/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/835c661888362b08d118f3c5142926818ff09c8b/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/0e5540986b984fa695404a46a11a5f0a581a8774/
        mips |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/fd6f26da2059c6ec9a48e5b890aea53c7e5a1938/
    mips64el |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/1929b7010e1ee6ac20d6bc2c9f8587f8a8cd1b21/
         arc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/608a0038aef52e40faf37025fd743411167340ed/
         sh4 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/be34cc462ee087e6f229635c162fa3877f60e254/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f9fcc78e14ecf0af5cf432c74cc2547f659f6f29/
    mips64el |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/4f2829a7231eda52b7e9a70241eb2116d4cdaee2/
microblazeel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/77c39684d26fac17be324ea32f9ce469695e5df6/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/784083bb1d31c64f2889adcbae5950c988fb738e/
      mipsel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/5b1e82fd718b7f597fc745200b27ed0cc48596b2/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/c8cfe64f1913e7c8a244c73762ea9caebd0ebc8a/
    mips64el |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/74dcacfa8f34d600bc5b0021d1359d8079049bc7/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/b9b75124fd7df2e237c92c00007b8434a8bb8555/
      xtensa |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/d07170dff825a01bf17dcf0abada173aef011670/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/e98fddf646aecbcbcf07e69a3f6edf49b13e190b/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/a69afe0236f71fac9ef711f016d56f5a97d99e3f/
microblazeel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/667027637331825efbf8403b4b5c7bfe651123ea/
    mips64el |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/91f5be83b80822efbd5cec9705082b6b9284e9da/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/fc2781fdafcd6ce14a613ae9e3653693a409f133/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f7ae38b0522754cf12d6bc053e468fc43f9be39a/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8e9c950e9110b0e68a6e5e85bc9659e656a5e350/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a38cf0a93946bca575de96068f040443b00a2d68/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8f5e51209ee0f8b0cfa07e5620940ec2d80d890d/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d442a4514397fd790b9ec6e71e29f8684c19f288/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d29fcf8157bf63b5a9e0ab10e38d09c565167128/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2eb9e65fef2f3e43a3b9041dc2310b192fa22adb/
        i686 | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/f3c81d14a18384b5dc5e86d96781b8a4a5099819/
    mips64el |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/239902d651213accc4dd8790f14cdcd777c97457/
     powerpc |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/26a2b253c6a70147ef893ed0f7e54dda0d3a1c34/
        i686 |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/8858878dca5387cc67e07a98bd31a4a23aef8745/
         arm |                       mtr-0.85 | NOK | http://autobuild.buildroot.net/results/bc203cfc17e99ee7e91a9e1a1ae98f4f134656f8/
      x86_64 |                       mtr-0.85 | NOK | http://autobuild.buildroot.net/results/ee064cbcd8e4fe9742dc9f3cac9fb7fde84fcf17/
        i686 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/4ad3e2655c3b15b91669eb6a6ce7bb87eec489aa/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/00d11408100b21e18046a36d45169477aa090839/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/6bc445e2903a4966e87ac4e96397564adc3eaedb/
        mips |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/62ca977a7a44d1ad2bbf9e5bc2df716d469484de/
      xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/905d28df891c70312734bc0ce172a462e3384af2/
         arm |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/7c4c872cc05cbdcbc760082e7bfeb81938e24503/
        i686 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a25098c07f5b6e23a4e83897056246dd951d4ca3/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/c65c5ea685661865fa754244139b6782e61dc334/
     powerpc |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/f6726daaeec825d1ef13f14f5aa922a881c08a8e/
         arc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/83f5935be1bca2dc9cad455ea9e35380c21ac51b/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/8326ba69c87edecdf3bbfd5d6ab9051a83db0f2a/
         arc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/841b970655889264fea5697fbee3d439b9c26ea3/
    mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/06254d55e5d15318a192b3de33d65c50b1b736e6/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c70bc69f07c5151ffc89dfa31ac18e5131617662/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3ee47dbd7a4f2c2728c39965bda7678812ec3c62/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b990ce73b0ddc6e9a9b26cd7283848ea0f0be73a/
        i686 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/cf628195fb825bc2ee338e14e287361160346cb9/
        sh4a |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/7946eda59e52b6de2f6054473e17bb2fbd02098d/
        sh4a |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/68c301f537ff09b6d1003356319139bf64ccebbe/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/bd1b326bd0180300e8c47f8afc0e6b3c4bd18598/
      x86_64 |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/002330804e403b072a2895fc5499d119f7172387/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/962b6fe123c883174bba54464af74dd9b1b581e0/
      mipsel |                    zyre-v1.0.0 | TIM | http://autobuild.buildroot.net/results/f38de5d2ebda70013dffded8886755d70e672575/


-- 
http://autobuild.buildroot.net
