From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-30
Message-ID: <20160331063023.83847102ACA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-30
===============================

        success : 182
       failures : 105
       timeouts : 3  
          TOTAL : 290

Classification of failures by reason
====================================

                     tcl-8.6.5 | 22
tvheadend-cd9f07fb865e57001... | 12
   host-python-m2crypto-0.24.0 | 7 
              gst1-libav-1.8.0 | 5 
                blktrace-1.1.0 | 5 
                  boost-1.60.0 | 4 
glmark2-499aa81a68fb4c8aac1... | 3 
               opencv-2.4.12.3 | 3 
                   systemd-229 | 3 
                     fbset-2.1 | 2 
                linphone-3.6.1 | 2 
               valgrind-3.11.0 | 2 
                    yajl-2.1.0 | 2 
                  connman-1.31 | 2 
                    ruby-2.3.0 | 2 
                 jack2-v1.9.10 | 2 
                  ffmpeg-2.8.6 | 2 
                      qt-4.8.7 | 2 
       gadgetfs-test-undefined | 2 
             netbsd-queue-1.70 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 weston-1.10.0 | 1 
make[1]: *** Waiting for un... | 1 
                    cups-2.1.2 | 1 
make[2]: *** [code/CMakeFil... | 1 
                libgpgme-1.5.5 | 1 
       openpgm-release-5-2-122 | 1 
                    ustr-1.0.4 | 1 
                 mpg123-1.23.3 | 1 
                 libebml-1.3.3 | 1 
                    mosh-1.2.5 | 1 
                   mplayer-1.2 | 1 
                    norm-1.5r6 | 1 
              gnuradio-3.7.9.1 | 1 
          libpam-tacplus-1.3.9 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
        lttng-babeltrace-1.2.4 | 1 
                sg3_utils-1.42 | 1 
             lirc-tools-0.9.3a | 1 
make[1]: *** [libleveldb.so... | 1 
                 libgee-0.18.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
            webkitgtk24-2.4.10 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/1cca7cc0dbc11113a686d0165785a65dd1e3fb2a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/abe717d20ab8aa3c17e23c796f46bd7983f75927/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4a780ce2aa638ab6fcd0037b90c840bacab39455/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f56cdd51ab892f368a798bb078f39e1f5ebbac02/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/78cdec411dc813cdcfc3ab231b3e899d0932132c/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/153146d251c2a77d34a5a0f6f4aa1ca53f017a23/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6d62af293631b091a300ccc8d36cfcc3361ea0da/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5b82e940528df40fb8043e6949c36a8385f77beb/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/70bb3088203524035c4f5c1f48c22d4de05e964e/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0ac2110629e84185f009136726b2434a2c3de8cd/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/686e4a8ccd9e34370b649251d5bcd3732c2a930b/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/46b27265fbbcc4803f48e7cc9751e904a1e052ad/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/3083e512c8806042279bab451fdeed505c4b4fcb/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/2cfefc758d967393b2fe1ce4e85be95085fe211c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d39d8188da69114586f3a75bb6db6325d823d1c8/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/17a34daa1175ee297ee3565dac591c42813b7216/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/3c781e128b52ecc47b95d87540064519812f4277/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/5818a4e0306ffec3e266fa2cb4569e17513cfda3/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1c730cd70969b097706b7c621faa8234100e52e4/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/3a916f62914b0d685ababfad96cf19215538daf8/
     aarch64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/da71cd684dcebfc3e31367c6bdfe53927168b50b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5dce04024d6ee229208408398ca2babdfd830aad/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/03881cdbff39bc5a56a33ef75f28c6bd9eb608de/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/298051a1d40bcb9611e3f6b599c400e1fdb56013/
      mipsel |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/a462dae8df2450bc0f72cbed6125e106454bde0f/
      mipsel |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/0e2f02567a4d09339544db24d3d4d426fe044945/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/8d603f39a51c5a416e40805bad9d689663a16c4b/
        mips |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/f4260396ebf9b415fb524897cbb8625c3f8fbf25/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/a239be95763acb74cac250f09b8cf052ed9d7449/
    mips64el |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/219ccf20912a0f7726130217ec2ba0234af3267d/
     powerpc |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/89748c0bbb1bd0a21cb66573d3fcb669041cfb41/
        sh4a |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/a255291bdbabb597ab069bd2765c16a7f13fac13/
    mips64el |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/e0ee4fca0c2a3398d8dc04a05031d1e548db0c2b/
       nios2 |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/b89e6da3e08a1a01ce059ca73ed7a271907a93ba/
      mipsel |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/4007755150bb3a44ed3543ae690a922e909abf39/
         sh4 |    host-python-m2crypto-0.24.0 | NOK | http://autobuild.buildroot.net/results/f9a6c4fb1acc994a87512e5bdda5d859cd35bd07/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0ac911b632539622b33cc641fce8cfd0b7322237/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/df36cc9b593b1f28febfb4868d68f084d29262ed/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/aa4f608d7516439a530e8896406f42f54dd0ea93/
      xtensa |                  libebml-1.3.3 | NOK | http://autobuild.buildroot.net/results/4f7879f759ebfd096b9757fe44445bf2a75be3a1/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/97509be9e6b01f8e18e312c1e7d97263816bbf9f/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/e3f48db82e41f4acb4dc7de25d072f9f4619c512/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/35434ca7ee2ca1d93a7308cc93afaf3fb655e5c6/
     aarch64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/fcbee32857fec30d71382d703f90b431302a93f0/
        sh4a |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/dd6cbff641028b25303c3b462e2058b56e53f1dd/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ac2a2b64ef769f811823cebfdadc1d2b7d74f344/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/ff678411ba0d7a5171f997b619ff62263662ed54/
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/2a817fe60ef0658c78211b235fe53622adf632f9/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/f3c8f9559eda109a5b6b9fcbd436ded97742770b/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/45ea6efae431ca65c6c607cafed3b3d16b7064a3/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/5e5a5be6eefa7e9ee1d194ab90b11168911e6415/
     powerpc |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/26f5d3ab369ef51777a35e5f22e4e88f68f20ef7/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/16d2cd81e1305096c9ddec2b280a08ddaa9717b4/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/9b5373b43dfd4a35275713e311ea3a427c974c77/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/27a96f5f3e56c8f64f9a6bff62aefd59308a37f9/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/a7b8ef57a6018aeef1d850ef180ee614ee33042a/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/e2865c5ad10e361f2f2fcb05f3518877874c2d53/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/9c413bb6d86be6196661877821174119e22c3d76/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/557f728d2ca2f71b83906d914199d80dcc6e55f1/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e9cadd49af719b10afffe8e846f1940a5d3a4454/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/39b635091de609f8fdb56b981593c9c96711f3e5/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c5f259fe6b21beae3c6812c5d80a8069db893fe1/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/25ecf7fab0f74a10809c0675c649728bb2be883d/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/89409affb9de3d30037669dbf2187b039160e631/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/7265294f62591bfd4dea4a53892548f50f32d16a/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/2a6752ea05559e541ddd8ae236bb5cf87fa35b0a/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/09c23b9645f8f97e92e2a17ec68f78f73ab6ddf1/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/17991d0a65f22e582d20fa0b7d00f01bc5ddb0e7/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d6c6602c576bb9abbbf107372c9a1ce2d8cb8852/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6877267e259e5f7be611a718c276c6265af609b2/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/31be7238153c101f810aabfa2db2444374120c21/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a0ac2eff610355c82d2439ee7f22e6bebc60d692/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/aecc41ee8f1ee41619b9cc74f6e8370021faf75e/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/514073de407c06fe524fea5fd0d9123a7a8aa220/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c083372192e7cb0c14ee08752a4928a28f3190d9/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/abed19fd269d36a9778babe8a74c09f72d49e49a/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e0c887cf0d34790ae66d4eedfdbb4b803322bc82/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0d720129cae57e16b3b493fbe2735c9b4deab4ad/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6725e696a30ae63e729a8b9f5deef58d07df3702/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7789213e5b6786a6184d15db14d5144d164e81ae/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ae6fa80e1d3f36b8e3db583bf6c7146a5f340e67/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0dc7753077625dbcffdaeeaf0514b4165e673648/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/01f770fcbb64ba69319370dd092c137c0fbe3c9c/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4ce2ba701d0188fceb42105163eb5f3cd37ea909/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6b7328c8bd95ff6c91ff4736574194c80de5a818/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8751957b22fb195b46ca897dc2fc3a4458d4c331/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b3bc699d2074123f5eb4b9c3596016f0f7e984fc/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/cfe38bd1268b25d4531a54916f987346e8ff7fcd/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/326285f9fc74c6a40c46757a9de2f42fad01301d/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/01a4aecb4eb23cd4ccd590872a3e5b7ad01fec38/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/26f8a510d69571521372ba301811fa24ffcf526c/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e56410f5cfee51859e57bc8284a9f5a71e650b08/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5a46e1630159a6d8116d8109a941c7f77d2cd10d/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d1bd688f08b2ab0192c3ac54cc8aabcf35fdf522/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c5d2fdcbee943a6ab7d4619560040ba546de88ac/
         sh4 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1e847ac7aa8bf4df5ce80e0aa5774394af1cb412/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/07b20dfeac3896240f5bf3bed9c4a0d569bac513/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/8b841fac3cae1daf2529c5df3e1c66d7eec1616c/
         sh4 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e065526b1b84edf9f0a6f416109c3a66c5dcffba/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/bf9535ccfcb2de2b3f57fe82e2106f65f9bd2ed5/
     aarch64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1d57cc68e9141c738f8ceeca5256ce9ac640df80/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/43c4c602329417c7053aca54060d87d6185ef1db/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b684b0cf2336302beea8c5ddd9073e155696f139/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1a215556da63826639af9eb756a8113e01b330f8/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/5e09fbd428804aac0f4060d78ae498a00b955244/
        sh4a |                  weston-1.10.0 | NOK | http://autobuild.buildroot.net/results/9e911f4acfc704dfb02337e2c6841ae27483868d/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a9b5209377acb51e69f376e0c008ee71fe00397a/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/55fe22463d49addb42b635d10be5176522f4a561/


-- 
http://autobuild.buildroot.net
