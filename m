From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-02
Message-ID: <20151203073021.F3940101FB4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-02
===============================

        success : 230
       failures : 311
       timeouts : 0  
          TOTAL : 541

Classification of failures by reason
====================================

                     crda-3.18 | 56
                 pixman-0.33.4 | 40
                  gnutls-3.4.7 | 39
                     flite-1.4 | 25
                 libass-0.13.0 | 17
                 rrdtool-1.5.5 | 14
                    gcr-3.18.0 | 11
              alsa-utils-1.1.0 | 8 
              host-cmake-3.4.0 | 8 
                xfsprogs-4.3.0 | 7 
             lttng-tools-2.7.0 | 7 
                  ffmpeg-2.8.3 | 7 
                 libeet-1.7.10 | 5 
                 mesa3d-11.0.6 | 5 
               valgrind-3.11.0 | 4 
               libcap-ng-0.7.4 | 3 
                  trinity-v1.6 | 3 
            libsemanage-2.1.10 | 3 
                 liburcu-0.8.7 | 3 
                   bdwgc-7.4.2 | 2 
                  connman-1.30 | 2 
                      qt-4.8.7 | 2 
                 dropwatch-1.4 | 2 
          modem-manager-1.4.12 | 2 
                  ffmpeg-2.8.1 | 1 
                directfb-1.7.7 | 1 
            gst-ffmpeg-0.10.13 | 1 
             stress-ng-0.04.16 | 1 
                libtirpc-1.0.1 | 1 
               arptables-0.0.4 | 1 
                  gauche-0.9.4 | 1 
                   libnss-3.21 | 1 
make[1]: *** wait: No child... | 1 
                  nodejs-4.1.2 | 1 
             util-linux-2.27.1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  udisks-1.0.5 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
ltrace-c22d359433b333937ee3... | 1 
               findutils-4.4.2 | 1 
                  lshw-B.02.16 | 1 
       openpgm-release-5-2-122 | 1 
                 gnuplot-4.6.6 | 1 
                 libusb-1.0.19 | 1 
            shairport-sync-2.6 | 1 
                  apitrace-7.0 | 1 
              squeezelite-v1.8 | 1 
                libvips-7.42.2 | 1 
               libupnpp-0.12.1 | 1 
              gst1-libav-1.6.1 | 1 
            netsniff-ng-v0.5.9 | 1 
                 opencv-2.4.10 | 1 
                     mtr-v0.86 | 1 
                    neard-0.14 | 1 
             host-nodejs-4.1.2 | 1 
              cryptsetup-1.7.0 | 1 
                   czmq-v3.0.2 | 1 
                   open2300-12 | 1 
                  c-icap-0.3.5 | 1 
                   cmake-3.4.0 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/7e90e878b92f941902fd56400f082750ad25f72c/
         arc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/215a518a33a33ef5b0f6eb50d5addaa39d6f4e72/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/b444249c9de8acb43f503d9ce808d70d6a7a3f4f/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/e12057bfdbd7c662525134493865640722e4f0b8/
      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/dbef1a92f6144851477d170ba1ab6837d35b88a0/
      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/5be4f15f09b794d5276b093d797986e485c001ce/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/503b38c357e2b9682745d43d9b02631f209cb1cc/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/3fca1ddda70da32e4d1b86ffdac213ffb5d23262/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/cc2d6d8513f6e7437b144d63dbb96ee84c01a3d8/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0b9d4dcc2f50a7e868ff5570ef59c49f683874d8/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/220b3d49b8ad891e5dd3aae759319100a1500701/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b7465d175f03c9461693a92885028723772c7814/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/4a83bec7722335ec19871efde0ed20cf69df0e82/
      x86_64 |                    cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/ec23b8ae63da0370ea135655642c169c9c7e9ce2/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/3336df777c758cba9a660a0f6f31646258baec52/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/efeb197654b552ad9a80e102226c3e507640f037/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/85ac9de375c8b344ee4f3e74ae9bb8afe1510c75/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ebac34614c6067193c04817685ac7d3b24803420/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c244be00ac5e13e9de0672d45238f9e326e0d92d/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1b3b274e9d9c9af097cfb480c8803b4781f63429/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/87be96c54062d3812f899e5dbed38ca9d710fae4/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2faaafad1df5602f3af93a2453816c743e63b8e6/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e366f7f7336d3114d280f6df9d49580b81fe1d91/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/22fda8a2359a44b02aa26f1c7a543a3234bd6f6b/
         sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/512d17b40fa96fd267d2e97b1dab18d3490779bd/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0289c97275817c679505cdb175c102743e234520/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/8254fc573d434838e717d18b5e654f783ae7a771/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e9945eba2b85dca2ea8b63f11898cf890e7d9264/
        sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9274357d44e98203c95faf9fc2e8a9bc536c88d9/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bf422936bfb9fd4c08568fa572d1a315712305f2/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bf1cfde15174c91bf0444f7ad612b70d5fe0cef0/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4499438df44a17e9eb85b6c8b3df0f1b38521ec6/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/70abad948a9a964f192a2db3f97df17a1e551bec/
        mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d7075ac2f96fb6b3b3fca77bea617dbbd820f798/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/79caa5801130f9f85dd90681632abd62818545d0/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9a0f458030f32a428cad594d772206505fa1e4f1/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a04c8b45e400a8f13b10ba6ceb1d74ecb291fda1/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bb929d2598c610f5ae81f35f947d740720841b9b/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e1e93419cb527698cb63b836be96b13b83b763bd/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/98f7c71b8a970541acbbdb74d09a6e0da7e90034/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3de8e82044b539aeb9e69e1c01ceabf9c25acda9/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9acef789db6a489df32195d0453f3526eb7b7d91/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/00e938ac3cce4dca774277b970b81ae3c1b1747f/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e839468236c646f6c35b702b56cb8da92fe0b690/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e91d93d2b3b79e47eec206413f97167eac8a8248/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2396010c079c78e0a20c3c3758f17b1bd0fae0bc/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/aaa5e1d8056f9015b7659d5f9c09e4667c4b4575/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9dd6c3cd46cac0c7f5a3b7f21cbbf02e9c3ede19/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/85b4a08743a6e7c670bde1c12c47194beb940977/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4fd0457c660ad7dcbd06f31e2105329c098139cd/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e1662294a9435a0f16d516fa4ab99780bb31e33a/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ca1370939e1221a3fa21f54533f489326ddd5510/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e82415405497984e070580148cc81c15083e9f59/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2662948434be502a4de501ecedc577ff863dc5c9/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cfe40d007bbc69193671c080b0e5ff6a0de08289/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ae73e04f8d6054bc3de75dc84f0268a72fbc83a2/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c07d2ded340d0725348acbaa5b378e9ed6d70d9d/
        mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/17feccbe72392af7faddf249f33b27171c393c3c/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b15cbbf81a1c3718a4cf01eec2db3e0011a697ba/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/8a731c04781d0d00911bb3c0ee5aaffb201481f2/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7ea7cedc1a9380290d480a2d2fb37bfbadb88baf/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/fbe520a6fbd3f944d2810e3ff26880beddf9e65c/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/81d499320082e20e87cbbe9cf034626fa2a2787a/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/686a997431c76f7f93ef267fe4678f29a810cca7/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c782f95acd109f8a01c6452a4f3497fdba1540f3/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/16e4e421a8283a6cfa47c5f31e3c9c4983a101b4/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/818d77408c17cde8e9fe40c04e389ef8a099002e/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cef040591531c82202984e8af70b8f8436663b89/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/33f6fd1466103d31578f0ff7d2a1baaf943656fd/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/76b4bd7b36f08e71ec3e30ac66ec2e5c769ba4d9/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/937b6aed6c87954fee0cec2fc1e34d8a7c932899/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f2feeb96ddbcc45b37ea3f6993b4a5a657b54742/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/3875614caff0a9c2d428231b29f70ec2b3c3e6c2/
     powerpc |                    czmq-v3.0.2 | NOK | http://autobuild.buildroot.net/results/caf002d213c9dd09df07858c5c199411ca8ddfa3/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/292baacdb53bae0c58ffddaa9300e79f9ed9b85f/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/d94a219e626efb578a107a587165d00212e11b9c/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0ec6449629ad63655878935e84b51a320e4303d6/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/d90dbdad36b27cbb652383830524e2f099c4ed45/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/7d17e4293500b5dc876d77b2fd854c49a4909657/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/7a84a3008226f47fc8029b15f7a71aa8de15fa53/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/81a66d69edb08ebafb58be2db6723099c7e701fc/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/7fee4d14084d5fc06cc7d49990505c8605348416/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/92996075a04ed2bc3504fb3c474da6f464b9484f/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c766d1092ddd1fa26529f43df3087be8ad192b6e/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/427dba70a2062af5b2ac076e8ccf8ab846bdda37/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/5dc3d752cac3635da053703fb8cabc814115311a/
         arm |                findutils-4.4.2 | NOK | http://autobuild.buildroot.net/results/3c6fdc1d721ea65ac084e1c660c7f0bc62c76765/
     sparc64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/01651e2ce7a3e169b66cd0c4c00b79d0b3a0ef7c/
     aarch64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/63a3d8b3434f8c205a0def90c17ef3b746101699/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/57c23829897b4fd972a9c4bcc4395d6db074e4bb/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/02490de6766853c37a458b7af6304182bd85d796/
        mips |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/bff849add01f7e15e475675fa3afbb6d52f8a3e9/
        mips |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/d27bc9bbd798649787f92418098eedd6b7079d7a/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/7b7e20af6db8cd60d0c08a796e824a9cc0559e07/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/4c1d873644358aa7eb3ac5eb6e3fb6dbb408ee4b/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/6227606b316f6ce534b6a771e5318421b4485df0/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/5e7f3314860c99055db5e5a08ea971caa82b5313/
        i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/bc23ef9c70a545be408d224cefcd989562aac357/
     sparc64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/fa576456b39859249bcccc80e89371c4cb351646/
        i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f0376890ccea658186dc7138813d4a444564ca38/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/260c6894d6b016cdf2ffe3ee33e21cfc571de321/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/9e39d8698ac3a9a338983a3629f14a5c8d6ffe9b/
        sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b5237a82de220af1a61bdf2130d42fac5aeac88d/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/a789c0d1f10c9458f19e28207c23e7badde36d7e/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/cd1376d0354c8f9d7366cef065bb20384e41aeba/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/1087e938d54fdd2ace137c0b253f8aac47d4f216/
     aarch64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/27e7cb6b6f6b02c3abf4088c1da3a3fce436843b/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/46eaa2d7a96b57db8e36a0b061ec6cd7d43ecfce/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/70d230264ed8981fc0e63638ae032f197cf12a73/
        sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b22e2198080c19e60b17843587b96d2bae8e0186/
      mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e3164430e5c60fe7d6c1de90bb372ed2f8f56ae3/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e8737166b50c3f239113240259328d171f20d178/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/20255a9c1abf73059ac2bf91774f7381b4beed5b/
        i686 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/7af769b7954467a26deeca10955cc335c1de1e99/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/284d7a4d9235c1e84e32af8f5e80220cb3aebfe3/
       sparc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/d0d4e9758482924ee7ac04d00b066d9ed6faf71c/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/c3177224ca2488cf4740a2d22d1a861872d2dcde/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/beb8854821dfea22589c165fe88fe95e59cbf0f0/
         sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/41b905eeac9cd2524e369476014701c8f1bfdf9b/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/79a09c2b05753b84493a6b8e8c89ec19e4e5e44f/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/135affd20b4b5ded1c22a11f2fe2ab0aecc9c07c/
      x86_64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/c7251b134a512efb9830435b3d78724681d429dc/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/5bfbf2db7fffe9acb209ea8198810db114f1840d/
         sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/2f4c456bb8bbf0cf335d178fb069836a6365500a/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/50c5185c967647cb40cf18c614af42f3e8d57697/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/02e3a0edcf4f7001a4b2f9808e0cd2913882dffc/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/7534704b390b097c2b01f9ac014acc00e911288a/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/470eaff2b13163d1f487a297dc9038c80c33ee9e/
       sparc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/1ebd103b8b9f1b3c718c776f0b0c82acd37cefe2/
       nios2 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/9e1091489af44c990330a65ef9c375a08203ab28/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/2febfe70763a5af7b7972b63b9ac17f1ee19e4c0/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/f337fdbef246edf66443e064042eb2fe9126384a/
      mipsel |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/6bb75d3f3710c78e3837802ad13a6041099b640b/
     sparc64 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/76b24a06f7b75a5a98785455d4e7d2075f061791/
      mipsel |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/473eeb3b5fb55bd5877862d996c685fa11a59cf1/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/2b642f2413987ac056345dc5d6a984ba8d01b5f9/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/1f70f651e8e77fcf87410761a9b76c3d8d0fa13e/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/510cd20f0c41105f2b3e4d3dd1f7b0c0cd9a592c/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/e3311531ce799aac70e724a221e667456168c0f8/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/53b01e072a5339f38f75360fc658129d2d7547f4/
        sh4a |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/e7a7a7ad07d02d403053ff812b0804e5631aacd8/
    mips64el |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/51ac50097359993dd71de7cb076f3cbf3414119f/
         sh4 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/1a213ab9da5af7bd9550cbc9a56b465a18484280/
       nios2 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/9cd991ddbfc9ba6203f785771281867404f979d2/
        i686 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/21c98bf9eef8124e4300e0ceb912985adab77ae5/
      mipsel |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/f0ed1c8d9221f0169018cbeb8695b302bf5d1ed5/
     sparc64 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/e6fbed4ded431a23f1765dcd42e356be01600859/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/3178da5f7b17dfa4b7413638dc26039ebe92cf7c/
       nios2 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/4b46bc41b36c1fe997795c5e3eb9636ee9b495ad/
      mipsel |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/94ca93291ff0f6275c83d4615f29b7a754c9cdcb/
    mips64el |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/89ec9c8abae06564464413078811f0c90287a9d8/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/963afac6f0036a5d9abc4cff04a18950f1f2d46b/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/678a292698c26d5dc6e3a746aa926157e075de0d/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/ce7490140778c17290a04b9be890c8b50f7e1dea/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/326f9ca3f86c0398b3646b8b32c51d5069544418/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/38087de21f273d83990a1ab9191ce59b65201ff1/
    mips64el |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/665d57c32a572657dc87450109e17f1f53156229/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/5c394cca00358688c97be6c76d933bfd1cf1735d/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/766da53b9b0a96a563c868125b8f43fb9491f66d/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/5e2e5d41697f0a8a18ebe89c404de81840716f31/
     sparc64 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/3a86a8952c8292944ebdfd076dd113c067f6999a/
    mips64el |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/8d3918d395d939152e0c2d6da9a83fc8e87e3902/
      mipsel |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/3ecac965455dc169162cbdb50f8ff07e2880e504/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/f2ac0a68921d0157979db295d3e7a649a474ace5/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d90392ea9ce9a5959d2d828cbac573a8f810ed4c/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/2b7356bf50e348fa03eb0655907344362822e63e/
     sparc64 |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/315501bc3c4a6059f63619c9e9ea047463d1f9bf/
         arm |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/40519b534c976af021742f9d0bd2a8961f68288e/
         arm |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/0f9783fac45a45ab340387510fae5cb2c7b05652/
        bfin |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/7359ef7f4a18327d35c61d5c6dfe02d84e97a68b/
    mips64el |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/fd6f25f75156ad1b91d4392215f2733f19950db8/
        mips |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/88ce8d3ed76bfc45444dd591018b3e9fc052f400/
     powerpc |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/528b6c0d72e04ba21986eaf217efbd1229854066/
        bfin |               host-cmake-3.4.0 | NOK | http://autobuild.buildroot.net/results/b1ee5a358f74495e90b4a54a79e66c619dde527b/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/2be631afaf4a19366048ad173e62ab9cc684c8b8/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ee894cdad529b05a6adac49838af673ee6e4c2d0/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/82c9331c89a7520ed676cac9d8b0a12229022919/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0b73d27ffc722dc1eb8b3c62e1b907c16a487461/
       sparc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/5f7ba1a40312f6c35b6d443fb797af4f0d462f66/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/f83299641f76f4e4193c0fc1e8965f61fa515a64/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/842cd12c14b9d9d4d7d9bd87fdf933e65f1e9c17/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/9548b83dc70f0467df96b203d9e6be2ee95bbbd9/
         arc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d2874706cbcd998db22c270cf22a7d91eca4f207/
       sparc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0732af6104c23ec10e4eabdcc4c12b09147cadda/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/2a82f08a743f72a4823fb858b82bd5c39e723abd/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/4ecee9dec740c924e9cc65d7e828dbab918f91cc/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/f8b33ecda78003e8a2a372eb19d2d97903a66646/
         arc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/56c14a18a24b9c2bc94f12b02a46e3b119af5ae3/
     aarch64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/212213533432546c7f3ee08d13cd4cf46b18f3fc/
        i686 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/56bf4e0cefb9e8199037317683481d0cddfe857d/
     aarch64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0c2ff80d025d64c72ae4b2f73551057f8139c826/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0f08763a79b596286c838a7ba86eca197d4904ef/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c5e1687c26b6270079357d9858e8891fa952f00c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/03b4048402db6adec4aa21dff220e45bb3831d18/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b365ce147e955e504171d217def6d61291f6ec09/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/dc47589da9924c90c32d98625f72dfd17c686b24/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b715f8fc2debf077b9d5d29f839d8748bd032ebd/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d82488f7d9baff77524786fb6976c7896008a0f3/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9bb510f95a4f875ddf2f20468979f3a6fab81e57/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/5a9b5f3679888a1569ac9de94611100b4b698cc9/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/74ac23ebf51bfff59df8b9eb279a2ed805179aaf/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/a6a0c827c393a5fb41653d71d1ee50df283a32fb/
    mips64el |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/0783a63e4694ffa8463ef5533b635c7e7c43dd42/
     aarch64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/40726abf3419a727c5762ef2791dbf53fa1736c0/
       sparc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/9fa2f0f9a071c7eb3cfbabd8da6df8d614d2a6a1/
     powerpc |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/8b8c9e6049be890ec44c71561eb635681e6c7542/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/3f3f9e928fe527b8c0c613916578f974df8e40b7/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/1c13a358d6c50d33baa6c5b40bc43857e7e48cba/
       nios2 |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/c9a6edd23748d9c0afcf61945e28dfd97853c677/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/ceb3f0484989c0b313d0cd0b4261cbb3647e64a7/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/1033241a0fd59ad3b7c04eeedcddd324a112933f/
         arm |                   lshw-B.02.16 | NOK | http://autobuild.buildroot.net/results/075423a70b9bb80b2f13cac4fb95502180e68b43/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/5e612efae641251cc232047bab5fc10e9967912a/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/15d75d428cc7b6f18b4588e27c042fee0815feff/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/6257c562a9c196374b36510d3058f4f636c698d9/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/0178e243eb27376d1507f1adde5d12bdbc0f352b/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/03c136306f0b2f44f7bf2e326b95f9e1f24a04ea/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/c35a5c8c909b38f002c7fec05f32c50b473d9392/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/b5f081b256c232c79045aa24d84ea922068f6600/
     aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/1547b21de18b1e679d86b78dbf5f8cf0f59d8db4/
        mips | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/6f3924c276d74ef233af47e4aeccc472255a0a6b/
         arc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/da78b078fa5cdff140c64a3ff7cc17b3bceeb13f/
       sparc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/396329a0783cb513bee8bbbebb1a22b5aff26e7b/
        mips |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/994a30146a941e15a89f0899bfa64288d7a79e05/
         arc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/a34a4f6d29692d87106ad1dc5cce28b0ebeb421f/
       sparc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/162033ce1f9ad514f79c75ef45e95bceae0d93aa/
     aarch64 |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/320c052bda0f1b5afb1e5c83a7fb4dca6227c5a1/
         arm |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/3b096f882030325b9290ad8860bd9cd373a11dc2/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/7cc09916fe1da3cc1cfbd473948a7173b9d380d5/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/2f87d0abcc2d82e3e6c091a1f6d124719ab4a22d/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/64731eb8f87e72eca1317070fe2146cf8588afdb/
      mipsel |                   nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/6ffa68fa22f4ec13586834dcc45dafffc748e6be/
     powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/58937797da94cd0d967c4c68d46e7fc5b8c1b276/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/dd0e8fed073a3ae5481a565d325c121ffe269c7a/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b0d59539a3f38af74971df4a2d11ad21a35daac4/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/c67ca3f4e2ac09cd4175d231aaefdf393acbf60c/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8acc4ad43506491ac01817c57ae9f9ba79604e5f/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7fe0158720d567c2dc45c0fa9e6f65eb51b72166/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/ca47702b93efd6f55e59532d5530c60d687901c1/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8986272a885dfbb7e5566ddfccbe00d174c84a7e/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/4b80339dab89d0cdc8adfcc4b8c9eedd30a4e7b5/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/6d51ef4d408a566dd22b1b21e8fb2c61ee799e1f/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/29ad35cde104f237e288eeb6f038a8f09ed108b2/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/cffa96d18215bfc093441b107c15f7b9b2f9c157/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/060b335e07a158d338c052d333b0498fc0081e57/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/61dac06e80f737e9d9e38c8a59cf1f90cf500a49/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/f84779f1ee4436806d6007b19729a753abb52695/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e5945cc273d8f641c3340c6f617a239ac01499c0/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7cf5136ca1dea35bd302fd3f5e6a52d0f535384f/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/95d527a9e2edc240a8d42e203f0131b6ebda202e/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e26fe0ebf84b1e4b6fd0ec8a07ae1a8fdf37b566/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/2de45a11c3a79c4491fd14d27b00ba4479340889/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/1c3061d95d9616e1feceafd887caa36e32b27d02/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/301dc75acb787a24efd21d966f73ef45b9ce20f2/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/25922cdfa555738b2529901f8b4e711c66aafac7/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8f62dd245b20403ca4fb3a62d1de41dc416c3fe6/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/01f9dd77a484883ebc2ff4cd59154923a3557569/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c86ba2407ed2417d7399b13113273cb6677af718/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/8902101091059fdbc01ee96c86457fd0377e3b9d/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/85c55ac903756eb6eb96c083a6288a1a3b691a53/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/ea76796d80650f6755c2dd3e621b168c9c68d23a/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/fca3a05dd7312df7c98950f2b4b876a6635b35e8/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7f5a1c1ceadbf4886cd564358bbd29aaef3dd71b/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c55f6fb617bb3b29f7636d1e522be6abc006fa95/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c85cfd4443f819e4bea6a26994cbdd6dfec1ba5f/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/08042f10508a6d35ad1384444b5536131e5e5af0/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e7e00a01bee5810930856e439244a95bca6e2a79/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7e96c972d9d13073aa8bbf2501756c08cf799bc8/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/1c297c93267865d2e36d36220a73926c790d2ed0/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7f8a476ccabb2f606ef1c717e9d9fdab5b02230e/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/e2ff73e9c32594a52ed7234fb9d807ab6367bf36/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/940da0d665a873115762791a38eb73ae88764d40/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/856ad35c8935814d4a56c01c6d5780904867976f/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/cb3d602ec4ffa9607c3305c4fe83ebae8c7a7227/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b13d3f64b590c13f857a631c9fdcea464d1f6fae/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/6ed8aba76dc2bd60321822b3e3913c3f18fd98be/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c3ba5200aac4431de519af08afcffe18fda84739/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e2f10a9dd2476c19a3ea9bac709a8e86027ec313/
      xtensa |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/402d34e7ebb7a48cbcefe7edd71245ee992ebaae/
      xtensa |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/574797a441d9e3952c2c6a8f183571e09e7b9c80/
     powerpc |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/aa0f69dfff38319f01eab28d7055253676dfe502/
    mips64el |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/6112729f44a62b9bca0088805bda80858fad0586/
        i686 |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/45bd91e6a3c57fece35518828bb9fa7c9dbdf31f/
         arm |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/6fb94127af6ff53bdcf52ee0eec8971ccd8858f5/
    mips64el |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/60ca31bae58d8e1f99bc20d25ba6720535745a16/
         arm |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/6fc6621a740d7349aa3d54f1da892101ad790b53/
     powerpc |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/42199b06851e968a3bedf6a8c6e6658cb552bc21/
      xtensa |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/fa3bf07ea0ad8f9db8cb6b9b468f58fc106af8e1/
      mipsel |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/92ae9c24ea20907be3202c040525a6274feec789/
    mips64el |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/a27031bd1c9ee7609c576f91f9d3e4716eddeee3/
      mipsel |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/b9b645e6f0cdcca6295cf4ddfaeb0c95e4ced18a/
     powerpc |                  rrdtool-1.5.5 | NOK | http://autobuild.buildroot.net/results/5c914970a2c909a24a6893d04b3484fde57e469b/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/2ede12a2fe048160670c2064ab85029eece0ec50/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/6afb0d54c260023fd195695e49d855b69e7743eb/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/31cffcf66cf548748faea51aaf69527c97c81d2a/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/c95f9c11a3995d4b51db87f765c1b3f709ca54ee/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/f096410e6f141fea0c482f70cb6c8a7c7a2f60b9/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7853e2e4881bcc7f2d81819898f18dbf1db7d031/
         arm |                   udisks-1.0.5 | NOK | http://autobuild.buildroot.net/results/85469eeaec798382919c2fcfa970d9c79b7b87b4/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/1300a1e4cd7d8b1438fb36112e8a789bce4c73a5/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0810679801347eb19e7ba44ad5ea5ef650b8a758/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f637f9ef0f0856cc466cfb82816fec0e6f52e73c/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/8892a58217644fa11a2f8c8de9c980cb8745ce17/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/58b45311b98d4c0fad020d118b5b30a346f35b09/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/23c15cefd95e3fbf135f3796827131ebe699c131/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/aadcda0156254347066b4d1a32515913af027869/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/5d942f1e13623f3b14b935b1cf82a5689526198b/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0da818d0a8d744d2e63bf3af24a97f4ed2371010/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/3225127718e33bb0633c05be2334a7dc843cd1c1/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/8b524a7564e408f7e08bd16cd9d0a2f42b798f8a/
      mipsel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/7945c6f4d8594bbbedf756c54bfabbe8ebc6e118/


-- 
http://autobuild.buildroot.net
