From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-08
Message-ID: <20160209073022.7E3C11025E0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-08
===============================

        success : 204
       failures : 130
       timeouts : 2  
          TOTAL : 336

Classification of failures by reason
====================================

                     kbd-2.0.3 | 28
                  boost-1.60.0 | 19
                pulseaudio-8.0 | 9 
                numactl-2.0.11 | 7 
                   fio-fio-2.6 | 6 
iputils-c8ff6feaf0442f8efd9... | 4 
               libcap-ng-0.7.4 | 3 
                  lshw-B.02.17 | 3 
                 libcue-v1.4.0 | 3 
               valgrind-3.11.0 | 3 
 netcat-openbsd-debian_1.105-7 | 2 
                   erlang-17.5 | 2 
                 mesa3d-11.1.1 | 2 
        ltp-testsuite-20150903 | 2 
        lttng-babeltrace-1.2.4 | 2 
                  ffmpeg-2.8.6 | 2 
                 libdrm-2.4.66 | 2 
                  stunnel-5.29 | 1 
             webkitgtk24-2.4.9 | 1 
                    sox-14.4.2 | 1 
               nfs-utils-1.3.3 | 1 
                   mplayer-1.2 | 1 
make[7]: *** [libavfilter/a... | 1 
             lttng-tools-2.7.1 | 1 
                      qt-4.8.7 | 1 
                      x265-1.8 | 1 
                   lite-0.8.10 | 1 
            host-python3-3.4.3 | 1 
                grantlee-0.5.1 | 1 
             host-nodejs-5.5.0 | 1 
          libpam-tacplus-1.3.9 | 1 
               pax-utils-1.1.4 | 1 
tstools-08f6be304040e7b8476... | 1 
       openpgm-release-5-2-122 | 1 
               linknx-0.0.1.32 | 1 
               polarssl-1.2.18 | 1 
          chocolate-doom-2.2.1 | 1 
                 libraw-0.17.1 | 1 
                 rtptools-1.20 | 1 
              xmlstarlet-1.5.0 | 1 
               trousers-0.3.13 | 1 
               tcpreplay-4.1.1 | 1 
             host-nodejs-5.3.0 | 1 
                       unknown | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                   qhull-7.2.0 | 1 
                   nginx-1.8.1 | 1 
               libgtk2-2.24.29 | 1 
make[3]: *** [code/CMakeFil... | 1 
canfestival-7740ac6fdedc23e... | 1 

Detail of failures
===================

    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/13647768796db87de75dfa8effcd9f1d6c3d4161/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1d8ca44d119f764d34ce6e9a3a8588b044a03273/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09484075d98b342a7e7709be29bdbcc30ad5c69d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/75fa38fbb75d2f0e320e8bd6d41ad2ede65b3946/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/12622af018b3f9487c99c065f1d04c998d448196/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/63d4c095ef11ac82a745cbbc434985f15335e151/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cdb2752c3ddec4f90a7028b34796b77d7eee1ca6/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b37a82389797c03c988443b35a397e10fc57ed24/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/14758b6856b985899419a420449799055de1f8fe/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/959d190138bc8517a564515663bfe3e97514a1b0/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f64507699f89f92592c3182556a024f30858a28e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/31da8ae1593ef8a98760844051c5af6c5a2b8eed/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ca0230542a1e82b6e11dabb96f0ae6947134157b/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d95528aa2f7c91b7243547639ceb083ea2417f16/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/49dccb955052fa0fc0651f311a628c2e5a17b99d/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/34276682067375c562372f31e6b5e3021c8e1a7a/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f9e70df3c9d7ed4d617c2c94fa1aac6548b4d941/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0f1b486c41a1a29ec1fdfc2348a13a9a624b5676/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4ab2024111b24b46c10bc50dcb2efcb29af37a94/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/37826994aa8f5dd76b5df850c1a044856bc20651/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/0ea64eedb4ffe14efb8f6b16c8e11638c8f92a70/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0b5ce5b4f481571ca9152f0c958771d7ac55308f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/fe38d8b6715c19df4d2ef92bf7ce287e45605f17/
       sparc |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f6b553a787911120f4165f6ce0e4e5132394299f/
         arm |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/07508a765391741e2065d20bfe444e49a7c8100c/
         arm |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3e2024fc2c8c9517031ce5ba5303f4e980a16e76/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/fae954cb3f0d79dcf449b0423500890043a36ed2/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/7a71f77188e652f050d7ddfa9dc1e0b6145eae5f/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/6f0c92d6361b68d036f7dc91d39bdc64966ed306/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/1780f1f199719f668a58f9eecf74daab832e033d/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/36bd343ed7566a9a6c2e4dd9f5317feba35b40bc/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/c74d89584b42aa4a048dc4c66c91b80fef03ccea/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6929d40670dc394f8aea0544c8f62e9ee9f9620b/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/d3cede1a714c803c8cc17e8e3074e16c030a9dca/
        i686 |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/a72f420d2952e1d6c5a2ce23c6e606acbdc60eb1/
      xtensa |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/76044495f1b62b21efe092274f7d3bd6325c0e49/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/8bb9f1901b4598c8cbb5286eea95bb1e6b28acc7/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/ccc4033682bcf719c660ea303119816098aa729b/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/23c42cb01a5f448863b8c3d550eba22725357a1f/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/5f92bc764164f75217050786aa11a347dac85b34/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ca45684c5037a95ddf3396538465d2240f9014f7/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/57405a31af3a8cc7a7106a7f70c6ffa0d2cbd385/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/318f3d09884a37fdfbd5f2e61fdb70f23f1c74ac/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4b6eb0c89d6042535f77b58d86e1d07b507ba391/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4981e61f20c3b9bd1cf9b65e358b549dc6223247/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8865b126b9958e92c6f7b83b41e1e02f53e7eaad/
       nios2 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/fe17ab872ae99aae4c7ab0f5b3a409b9e065e912/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/dfe3ea156e524c3a1269d81f17aa7b16309ab009/
microblazeel |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7b67b9e446f90b444f1c8230fa4d39c1a15275cb/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b357aa6ece187f24053c51f7950fbff66d57120c/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/24244c1324092417c99de9f969538e66197ef303/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/21baeb5978851107c1abec6aa65182cf2d0df28f/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9c556655ba19ee69b35c2cb1cb82ad102ee74010/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3dff9cf919bbcf1cf0a16bc8ade6b1dcbb4ba7c9/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/352eebad609a2d1ed9ce71c6b9eeaad9e4732722/
       nios2 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/62e0b43ed01203a4c4159bf82b6cca7505fea2f9/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/892230666e318ae3560b6e9cfc097ba1f6a5b060/
         sh4 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/1c46f4319dda12f3060694966f86b6bc3da3e47f/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/a1b8a20e5c4df70ecd9044cd7e0e006fcbdc61ec/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/77ad27c2c49ce6e885502a449cb6aceb36b6eabc/
        i686 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/920323d664659ccb86847b9393e87a5e898c1cf6/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/cd5c88081aa7bae21dff5328c9088c8adea2209b/
     sparc64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9535f313ae684cf5227ead5a1358637832e3d698/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/590798f4bacba29c3a375cf7e2af38aa70b9fc23/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/c7ef973da94bc5d1f5a8705812bd3409fef7404a/
        sh4a |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/5238137454182447613c5bd8affec6658054d563/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/3370c8eb7d612f4f4369eadf3abbd123def41194/
      xtensa |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/47a92f85706853737367eaca4ed7299d880e262a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b7a0405c49f391c378806065a29759eaf687f6e8/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/826c3a3f1d7d89dd1fec3be7b005243ee615531f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/fbfe43871bcedcc1e400a7c09053f38eb9ba94f1/
         arm |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/cd128e96f3bb147b8aabd007ffdbaca8a200201c/
     powerpc |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/151c7ac8ae1966c2fe09586bb2559e2142859118/
        bfin |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/20b6d02c2b640e7b7f1fce10d529411bbed48335/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/31729602280408552138ca4032af32b7d6914a04/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/a9fc1807900f18fc3b3fd4920411297f0cb29437/
     sparc64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/e1c31ecbe9073c6f3bc698564b6f7c174ec8373b/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/5b25a36c90b20b0b4079c619e63664003ffdfdf2/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/dd84c554eea2e5c41e89deca537ea265c9ed4214/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/7cd2269d2b006db9f86f408a5ee8def543cb4999/
         arm |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/15f0b2c5ea07d0e9e504aff9a2093695fbba8297/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/1bf1a7f161c6d68444dd63b875df0755b4e31440/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/b7381a7d024ff99bdb579c4b2323037daa75aeb4/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/b7d80bef5f0e405af0f34e55aff496917f0c2d26/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/af7a870efa24c1df71654e3fc872c2514c9901da/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/eed7858d15edf32c1d20ee288143d7a91ca14304/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/77888cb0deb48997ee641bc1c173b40e81ff42f6/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/dc9ea0933fd9d82c2e9f0800414a7110b823f4ec/
      x86_64 |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/6674cbc6eeb2d2849a782841078e2cad452c1dcf/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/f6682d4fdf1eae635d3d2293d742684199d60d40/
microblazeel | make[7]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/7f6d1e69b57a35335ccad277ab60d22ae8c51ac1/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/f1d8788d9f3e4ebbd14a47391563ca91fd1f24ac/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/d23191e810e7a202ab1ad8c1e25e38d6e7bd04f0/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/75fac5555f9bde23363c54ac153d7701a28775ef/
     powerpc |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/91c0c2222746a1bee0234fbb41aa942f4b899cba/
        sh4a |  netcat-openbsd-debian_1.105-7 | NOK | http://autobuild.buildroot.net/results/c55bf704dacaa3e381afcd8d7d830f3575c15355/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/1f0c66cf777f89f035e963212cbbfbc810ed3c5b/
         arm |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/382699bbed15f598625b9296e464d1349ef559f8/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/374ed62e8de6eaf9de45b7cd6e18cc34585ecda0/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/f52fb77c67c8f0eb21ea1b7523db74a9d7b0a21d/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/11f867b5672087ad1bcdb316ba489ed4eba20685/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/502f3071e24c4fb204341b4d368fc58ea136d853/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/030d4e372469e7e252b3ee35a894a507ffb145c8/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/44e327d847567c70d1d78c100d87936c73dd017a/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/c0c33155a4a98609a445f3fd9e9c6fff61452be3/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/bff39f6fe185209571ec9408b321e6ee230c460b/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/2c862dfbce3dd1d795dac56cd4436099829c08be/
         arm |                polarssl-1.2.18 | NOK | http://autobuild.buildroot.net/results/64a755902a9f5efb0cdc20d20684e89704ea3302/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/838a68dd68c42f1c0186c49049055ff398994da5/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/e32a00b6d518ad8d2a17eb218011af5c08fadce8/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/22ed5fe005d97382a4445c48ada98192a4fec17b/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/9be9e0919e86f51d32a38bd6f438785a9e21857f/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/1d449d6770397f49bc003e40092df16b0e3756c7/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/0e75ec192e11fd55a0fa71d3097c2f6007eb0ec0/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/a2332052914477fa1f902a14c5805312db6bc823/
      x86_64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/03beca01cdae10231ba46bbe7ff5f88efe2c0be2/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/7e45f275d7639b6035e98794be349236ed630398/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/ebf88c52e2eb04056bca6525875d12fd349d883f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/38539cfa02f50ed5f0225c399fec64b0ef702414/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/bf5d9d0348d0c2e397449604f449caa9d5a3f338/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/0ebdd9f1dd5474321d88fc62b4e7bc5644e67016/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/8fea075fb00dbe8b6a09987e99a7366885ed0544/
         arc |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/0155a6be7bca1e2b2bb44471bda49a7299e9526b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1a7da72889b21c0b26be2904555e92e362bce594/
     powerpc | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/5cf13f8a9e5c80aad4cf8cd65644ef97ec3c8c8b/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/a92d130ef9336b8c853f41d6cf1b476421c3b411/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b27c17a0fa35256cb483eed7c82d54e0a8c76607/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/75b0d62bca40122def30a99f7bf21762283ccd65/
      x86_64 |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0b132296ba67810a937eafb419372202a2253543/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/083ce94b1ac61a60aa16906336612af59e32b18b/
       sparc |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/b1e43ac14c17f8446950379027335c19cc822149/
         arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/3cf70526dcb16407bd7c782c4070f524fe486564/


-- 
http://autobuild.buildroot.net
