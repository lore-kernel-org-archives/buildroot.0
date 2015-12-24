From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-23
Message-ID: <20151224073021.93B8A1014ED@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-23
===============================

        success : 254
       failures : 165
       timeouts : 1  
          TOTAL : 420

Classification of failures by reason
====================================

                  autofs-5.1.1 | 33
                  boost-1.59.0 | 19
                  libffi-3.2.1 | 11
                 mesa3d-11.1.0 | 11
               libcap-ng-0.7.4 | 7 
             util-linux-2.27.1 | 5 
              rabbitmq-c-0.7.1 | 4 
                   erlang-17.5 | 4 
                  libnspr-4.11 | 3 
canfestival-7740ac6fdedc23e... | 3 
                alsa-lib-1.1.0 | 3 
                  connman-1.30 | 3 
                  aespipe-2.4c | 2 
              gst1-libav-1.6.2 | 2 
            gst-ffmpeg-0.10.13 | 2 
zbar-854a5d97059e395807091a... | 2 
                   mplayer-1.2 | 2 
                   strace-4.11 | 2 
                  ffmpeg-2.8.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
                 lvm2-2.02.138 | 2 
                harfbuzz-1.1.2 | 2 
                      qt-4.8.7 | 2 
              libsoil-20080707 | 1 
                 fio-fio-2.1.4 | 1 
             webkitgtk24-2.4.9 | 1 
               dvbsnoop-1.4.50 | 1 
            lttng-libust-2.7.1 | 1 
make[1]: *** [sub-src-make_... | 1 
                   glog-v0.3.4 | 1 
                rtorrent-0.9.6 | 1 
                    ustr-1.0.4 | 1 
               linknx-0.0.1.32 | 1 
                rt-tests-v0.89 | 1 
                 opencv-2.4.10 | 1 
                pinentry-0.9.4 | 1 
                libtirpc-1.0.1 | 1 
             ipsec-tools-0.8.2 | 1 
                busybox-1.24.1 | 1 
                  libnl-3.2.27 | 1 
                   kexec-2.0.9 | 1 
           libvncserver-0.9.10 | 1 
               wireshark-2.0.0 | 1 
                libvips-7.42.2 | 1 
                iprutils-2.4.5 | 1 
                 gtkmm3-3.14.0 | 1 
             berkeleydb-5.3.28 | 1 
                pulseaudio-7.1 | 1 
libsigrok-fe473123ba836445d... | 1 
                     vlc-2.2.1 | 1 
                moarvm-2015.10 | 1 
               qt5webkit-5.5.0 | 1 
                   slang-2.3.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  apitrace-7.0 | 1 
                      gsl-1.16 | 1 
       openpgm-release-5-2-122 | 1 
                 openal-1.17.1 | 1 
                     fbset-2.1 | 1 
               libupnpp-0.12.1 | 1 
                    kbd-1.15.5 | 1 

Detail of failures
===================

     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/3bc0c06754f609a3167784e413b0c41690fdf67c/
     powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/8fe3e0c2157a18b4a7448bc776bd6f62127d8df1/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/8ff2c59840af2a1a4b57dc332d62aab53d0f8522/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/6fd6d8efd85ba9bdf6e3fe60745d1d5a9d1671bb/
     powerpc |                 alsa-lib-1.1.0 | NOK | http://autobuild.buildroot.net/results/f6215466e82db89a0248579b8149075c2d954c18/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/6213d565a9c17a2a62cf6c295f8ff2e69320a6f8/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/43ea8af58c5e4c98c8729fb49b70104d6a3e79ca/
        sh4a |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/e9d3ccebd7d33af05cc581bf487417cfc2a924cc/
      x86_64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/076644979c1135a5834f28c51d2c2a58c0b9ee47/
        i686 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/937858cb571297a097923acdb7a90b349a16d913/
         arc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/79083374e38ab901cfa7f2ae4529672a8d3116fa/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/753d01831273cf5a8bf82c48f40da1b05c643b3c/
     aarch64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/002c3c9453204843e9568a132802e1bf5d78d842/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/fc5814aa3fde0a25001b79ad00d7dafbe769a507/
     aarch64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/97cbd8d9038c5ff3e8cb24292dda3f17cc6d4599/
    mips64el |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/fc92173e6e0f8361e5497655df4407eab1965cec/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/fba10236357be6465fb1fd1f71dfe7e9844759a0/
      x86_64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/67dcb7c736aa6477c39b94bc707447a902ee008e/
        i686 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d85409ffb2e79b360bfc992d7576af29e2195add/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/413ed6d2c3a632989b12d85e8dfe8b48f81ae0b5/
     sparc64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/897e17c3f86227f8c77ed0369f98d3fe6ca63c9f/
        i686 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/ea4fb87721d70a1582166777ce3680f063b2f8f2/
    mips64el |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/cf49ebc99e6652218eb4b433ba56d1300063c529/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/06a89685973e1bd8394a5860ac272a45e7bb8047/
     powerpc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/b03a2516180a64af814c83b1babff13cc7473507/
    mips64el |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d462aa78734da8da991f7891ee6d173fba44d13a/
        mips |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/1a33d805ed2f86d66283313d7bf0a21232f3a634/
      mipsel |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/f1d09f108ba4006ab4e6ff3dc32da98828c41d57/
       nios2 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/82d4694836f866b66e561e5055ddcf4784077785/
         sh4 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/24d6baacea863cc4379dc4e51d07f68cbe7bc09e/
      xtensa |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/469a84a80a929a49f2a04ac99ea09a7927e36ae4/
    mips64el |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/4cbb9c8f74411cee87d7baac9ee62a5a2181b8ab/
      x86_64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/0453aa41854ed84760fcd299431664a996b1867c/
    mips64el |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/80dc7639cee9bb1ac9de6c6d7791def4574f8a8d/
         arc |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/60f05f192c9a4398cdffc0da5854a4169f178c18/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/fd65fff488fa416a4b23ee12060bca897c23da1e/
      x86_64 |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/d7237715f4ea24a63eba629aa26bf5f0346682dd/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/c883773baf78c09c6ae6cadc57a2537a6bbfbcd4/
      xtensa |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/6835d623929a0c70ed5d1efff9c5a0a56fd55ea5/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cc3d9adc4c796ca2710e6d8d6820beb9359b760f/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/70bdd63b4b533035dfc4c94e8fb1f6eae420d738/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/584c03939d784a88360c36ca4fd1c11e28125a09/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b03b239a1f699c6aed616b0f8f85573df51835a3/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e934744ec30e62c45b93cfc423197bbc560c092b/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e7ea694185629f19fafc8bdbf1ef24230dacaaca/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d0360fb21d8be675a5fe36fc6f71722257583047/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b660fdd75e5cea045705b17facc7a299b85c90ac/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f9b2edaf8c3e98d4047042424492fc46c918492d/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/da556fefda53ee11e9663dcb2d79f56139f66bc4/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/50ed105f986eaa344666d72da23873200434ef2e/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/2dbc946a56366898becbec14410092bd3e01e765/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5e2d3457cf5459dc4597027366efdc6434d4bfc0/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e0f8d128df1a7ddff2fbe10e0d48019091c80e5a/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5d209f6180546f61edcbb0002bf4d201c377b6a5/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f4c62605af6ae2d27cf78fd70f18ffdaf58f8910/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8a9c3bfd0e4232dd9dc735153c0d4b461019375b/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/81a1aa0acc1ea4679bcfe80fef48819499a804ea/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a2bdca1e1a3964df3528fe02dd08bd9eced8cdae/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/3d03c412c8e054024f0319f6908b60c5325a1a03/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/95b1a45d302cf2ef73866dd55f83a6a642e2db9b/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5e352a8872319319d50f5f87b38a3d87610d3760/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a365a93002f0b959f40533f4297af56784606951/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0978863f183681abb796d36bc72b96707475ee4c/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/8237e5f3574aa6c16feee78c91acf797a55b009a/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/96b78bb644ed4ef3493782521b17e3b2113a405f/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/f307f095c5ab654bbfbd33df143b39e0931575ef/
     powerpc |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/aed80f4e6cd8d8d37ace69320df9419a0505f494/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9d867659c03c37d38ec1c066d999082dabc79402/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0f5a6e533fa30f40b45923523c9aef397a94ad3d/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/bb0f6098892e9e9811b26fefb09c0f1a834f21b6/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/25c4ef722c5aab822a4d7f1364fcd1745086893e/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/42ca9c99098a65f3f02a146ca6a9be633842302c/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c6c8e4add9e73883ea13d456d6c298b3d338157d/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/9dc88968cf212e259822a0d750d4f71bb7d38dfe/
     powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/7d1e75d49d57491fe2d688d2fb121932c65e0ba4/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/fcbdd8f86e43f5026e805182376edf11cec7f135/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c304bf749b915d2d019da2ddbe78457ee944c5e6/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/121f5493ed968d404ad0917067a4f844439f5457/
     powerpc |                       gsl-1.16 | NOK | http://autobuild.buildroot.net/results/a30586739b84bf307ebdb5215eaba08dd4915fdd/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/976a1db460c4c94466fb2ebf15016d49e66be4c8/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b9c5e7c3e10c19268951a157a2905828f1bec2d5/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/308dd0f631885f7d74f76150bbdcba9e374d2bc1/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/e8a4b4ad81267b6048af4c4da3f1a85bff99b519/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/a5dd8570f2b3e89b8cba62dcb45d147b3b119188/
microblazeel |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/710af23826371a5dea8ad8115e8c5009ea45e96c/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/714500c22536225f6441ab4e34c695bf1b943520/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/31a77a68289e82777f7d8794b4dccfeab9892bd4/
         arm |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/62e60b5d04ca528c3c7e8a591b83f716a400c059/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8ff17f45471e036f073be55fc2ebe668b0b06922/
     powerpc |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/0e1396d5f4507cbc46c6fefc85d25b0716b90611/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/cfa9e0c107777da271b7ea5a085ca8d3b9163435/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/260be1eed14e1d553ed24313dab3454da3d5fd48/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0532310ff4da5f2cb827047d42460a8133d14577/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e7bb9cb518d5a23a1577a4c17bed92ab52f3ba45/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/f1c96c3feb2dbef3baa93b6fec70799bf18f6f80/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1458c599bfaa667d2f6295a740e1efe3b008010c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/11b35f8b29eef72bcba88458b7bd1905e89815ea/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a8c5fb9fd399845a8090a64ef8a67ad448a9be38/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/86da5454676fa4a7ac8209e00efcfc003d094be1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1e0ea5d7cee3514f3297f7f80d9290241c9f62e0/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1f71493536d066d8d4cfb0126c5ae482feec0961/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2e647b7634e7ebe88ffbd2d2aa2d0508c760f638/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b8525e94c43706ee4638773e3519f66d36a72d18/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ecac3ddfae6e375c89c22fcf60971c1a22bde31c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2df73d6c401a7c2f7cdc43e2d63050dc4c73ebbe/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8a03befa134735f15c0cf50b44842eef53bd711f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/17c41da2086256e3fb9c715b227423284e770cbb/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fc4e6aee3e4dcc651a250093baa0775da9a75200/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5b119e6de16bf4b6ce28f3cf6a595d5dece2a2cb/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/9a12b98743ee2bf9e111a60b005f28600fd6975b/
     powerpc |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/fd72d7d673a29f8b2de40ebdadce2022ad772f25/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/dddd032232126f1e476e6aea2c6a32e9cd1ddfae/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/1918c5ee9f5890293b00b38f7d58fffb42b67e6b/
         arm | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bcf8cbec4e2bba1c6dba9ad42c042b37bac36ff6/
     sparc64 |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/baff2d0ea49e4a3a3f55747c1fdb009a85f01080/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/c3703594b2e1d98ddebf50359ccb247db2d172e0/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/56afad7f0b28b96193ac6c95e7b3b42c466c628f/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/947fcc8c3c777b9f28dc6fb88a1500717294e349/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/0e46aa4d0ab675114295a3e128af680e4c993efb/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f18a0da0172940f26c81232c1690f5537fc1ee15/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/51c20fa86697e43b3b040c7ca341c1c9311e7e21/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/7c08da1c76edf7e38ba682a49827dda749e2a917/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/299635929ea00cfeabc010582563d2d16c862a74/
microblazeel | make[1]: *** [sub-src-make_... | TIM | http://autobuild.buildroot.net/results/4a2fcebf391640846fbc31d0995dbd4207f013a7/
     powerpc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/d2f0d07502e350f41da52550df082683c4520293/
      x86_64 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/7b7973d5235699da2f3a2883780b6d0e7089f344/
        sh4a |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/4b7acde0129c05245dc8e04d471a86fc89cc7dbd/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/885bdbbc5c8d1f3c7f06ea37da700a9d4c0522f2/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/6b363dfb1d1d900b1e80c88c92659b7da5b1e9b4/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/981e8687667430ea3d35db240c0c467d90ed4042/
      mipsel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/2d7f36618bd60e0f78c1bd8eb9994b8953acfad6/
     sparc64 |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/e0760d54ea54307f53d4aad040b113cb0e73f652/
      xtensa |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/f58a9c8972aa851ac810852f8d0ddaa917e476af/
    mips64el |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/4c732e223f72c346eb3856c39ac371d09e0ccd11/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/0e829f920e440cbf87f3dc685f5ecc3fd3b29464/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/30a91ae30e210de3c3b29005159b91b7cb44c03c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8b7ab1afd5c3208a7d7879a52bb3147f16186785/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a815c3517b6d794d93a74a968817d14404939553/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/5dcfdf2d6052707f1f4eb4d007824fba1c630208/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/2a3838c7f7dc5659d22d1aafe1d49510c6b0c0f7/
     powerpc |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/055a895ad4c9191d31a0cf50da12fb22a2b88b32/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3ad1e64ca7f04265665eb6a61cd2a2bfca88f8fc/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/0f8d68b11c6807a9d1d4c40a66430ac096902720/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c945bce96966e5e39d093c4265058a66f749eea6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ca981c419bfedb38c591f6e75151a943bc9535ef/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/173f1a60f05e2d677bd4447c796d7d9150290c15/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/cbc0781316b84e39bf127704d8358b1d7df453de/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/60939a40eac561142e053b550f10fc22033f7a7a/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/60dba9fcde32973a4e399bc9c41045a8fe649147/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/fe3f0b9b2ba1e04badf2826a67dd4a2f509ce806/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/fd65c85b249c86db385bd781c3e2bea9ba9e4d73/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/cb20201de4899ba5eeb16b3dc78c25a9bc31a096/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/dcae183c7bcdc22904d5f715a3d8b8b514a5d3d5/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/a0344152682346ad9d30e3e1508896e91c3c9158/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/e6cc711415b3924edf70d9eae79d96e01bb5ce67/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/64773fbe7c99a592a538c77644a77403755f0c6c/
    mips64el |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/14c9c120d2afb0e29b81f720e3efd91ac88aa811/
     powerpc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/3eef6666f12523a259fd3c8b924952a38a603594/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/4219ef9c876127baf3cc2ea9558468fa84b2e44f/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/9fea4cc39bc8aceebb5159c5a7f88334161bd61f/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/7dc14e560627c15ec2d7de849c81482e46e7bfb6/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/ba7edbc898c5af231b8e3018e1ca05b9428c7b93/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/cdb5abf57e5ad5b008affc0bce36e6f3d81f7a77/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/f62f14b684d655c816b9e4254acc7a16d20492d7/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/08a38b10179b08916f5651c2311fa6064dff3ac1/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/917d6c0096548d3e5c83c273332335065b60ea1d/


-- 
http://autobuild.buildroot.net
