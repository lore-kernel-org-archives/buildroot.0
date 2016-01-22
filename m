From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-21
Message-ID: <20160122073021.E35B6101A27@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-21
===============================

        success : 241
       failures : 132
       timeouts : 4  
          TOTAL : 377

Classification of failures by reason
====================================

                  libv4l-1.8.1 | 50
                  boost-1.60.0 | 15
host-vboot-utils-bbdd62f9b0... | 9 
        ltp-testsuite-20150903 | 4 
                      qt-4.8.7 | 4 
             lttng-tools-2.7.1 | 3 
                 libdrm-2.4.66 | 2 
                 mesa3d-11.1.1 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                   erlang-17.5 | 2 
              libsoil-20080707 | 2 
                   libnss-3.21 | 2 
                    mosh-1.2.5 | 2 
                    ruby-2.3.0 | 2 
                bind-9.10.3-P2 | 2 
make[2]: *** [Source/WebCor... | 1 
          imagemagick-6.9.2-10 | 1 
                rt-tests-v0.89 | 1 
                 setools-3.3.8 | 1 
               host-efl-1.15.3 | 1 
               nfs-utils-1.3.3 | 1 
                pinentry-0.9.4 | 1 
                     aumix-2.8 | 1 
               libcap-ng-0.7.4 | 1 
                    iperf3-3.1 | 1 
libubox-e88d816d6e462180f03... | 1 
             gdk-pixbuf-2.32.3 | 1 
                   slang-2.3.0 | 1 
              gst1-libav-1.6.3 | 1 
                iproute2-4.4.0 | 1 
                   mplayer-1.2 | 1 
             webkitgtk24-2.4.9 | 1 
               madplay-0.15.2b | 1 
              strongswan-5.3.5 | 1 
                   mp4v2-2.0.0 | 1 
                    php-5.6.17 | 1 
               trousers-0.3.13 | 1 
make[1]: *** Waiting for un... | 1 
               dvbsnoop-1.4.50 | 1 
iucode-tool-1cbd73013cd4c6b... | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                  stunnel-5.28 | 1 
 make[1]: *** [all] Terminated | 1 
              pptp-linux-1.8.0 | 1 
qextserialport-ada321a9ee46... | 1 
                      tar-1.28 | 1 
sconeserver-3b886c3dda6eda3... | 1 

Detail of failures
===================

         arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/c8c7f9a799d1af507a6edd5e02b0bbc8b7b5d068/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/62f386829193c747176ace05e4b26826fcabbf59/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a92fa5dc5d9d6742d61d4d293f7eac97c5355dfe/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c7d987a51f2b2b731fb60e0e741361bbfb4ff230/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b2c860fc8fbc7a025bcd3c04e9b43b04f029ead3/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5a33d69d2c11e3013b73b3f6c1d8ab3a31facf62/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a7c7eb7c2f477f8a19c1b364f746dfd31bf18a3d/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fb2f5cbe28a41161df7e3c5b2f6a36242daf5374/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/179345a92e0c1db1b8d5bccb27c6b93e484f9b6d/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8612864811bbb04d655a6040869ccb81396d7737/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/51c54c85010c61245a4ef51d4e602974809d077f/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e474243b83233c008fc2351c77eba35269e95439/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/30898a3c7a5fceb1bd14a287064b96e04fba7921/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d5d159dc004e28fed537b84fae76afb0734b2ec0/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/71e9dbb63b91980723554651071fdc3d7a2250f2/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3ee30fe28f709c63c9a0e2d0d91440d855ff73a9/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c48523b0bc50c61a9dd1bb691cd3fe3b05fdc1a7/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/04553f5d6b73b0a97901995674b0876c33d062f5/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/be64a45ac158b9057fb3e7ef9b515250acc77187/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/20cd87c6a05c91ee223b813040d9d10fa923b174/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e4ab3fa4a121f7d7edb0263f02aac2ee836905a7/
         arm |              gdk-pixbuf-2.32.3 | NOK | http://autobuild.buildroot.net/results/f271386d3cefad4a4971bc8698848b4563498e6b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1a0eb189ad91a7f2fb7285f4225555a0a0febda2/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/a5b0d3816953b5477d7938cf001fb048fee7462b/
         arm |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/e178371c2c3bf42d59c6fc26409e098081239ccb/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d35f6ee7643a695af7db3739ff480d25b99ee051/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/09f4a89e463b6ccbca01cce1d38eb849c17ed6e1/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0e8d5ab5127b5e40c58912fe16504e3fcb941e69/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/10f61d4cc5f6fdac231185d577493e0e82c5d091/
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bdcb9bbd7a07f0bde1b575bbf7ae88d006a1e823/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a25de6a6e8d68fd86ebf2c5805c6fe31d5860656/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f00e14e2360544ffe7501247dddfcb701631646d/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/95491e089e6e18bfddbf6d7d19450026e9a349f5/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/936d66543e2db55309af115ead64ded24f31661c/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/25409dfeb7ce5806115092eb341e201d680ab974/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1a45412939a3f9d6fa59d086d834a3b4a4bffef7/
       nios2 |           imagemagick-6.9.2-10 | NOK | http://autobuild.buildroot.net/results/0bf3a2a284b7d4712ab1530562d3b8164fc75e88/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/50e34db9e273ebb7b8a9198dec254f6b22e26eff/
      x86_64 |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/d3d79b55cb19987d5d5c0da9c0f0d25697697c05/
      x86_64 | iucode-tool-1cbd73013cd4c6b... | NOK | http://autobuild.buildroot.net/results/7f8626db69500a84a393053a485f04180c565673/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/183df75a853c3b0e2617c9219a356c5531aa523d/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/7d444611f8efa40e0eb81ac88365416ef553fcd5/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/6287fa5a754610f04f0df93bf611676d982f5cff/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/cdae10070b9a97066dbfd0fb2c2004d9bd1fdd43/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/0df8b1f78b671ff05b2ecbf9c4cf08b8898e2d43/
        i686 |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
      x86_64 |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/4feaa9089ee9a183c5086b791bea35c0156945af/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/4d63874fe2efda8ac7aa3a8c82affa99f0ce5af0/
       nios2 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/00346ced295f481eca192668fd1f4958efa0e5a6/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/01d0608f4a7c83a289c74d30e54fbc4af989de31/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/005d3f3720682316de3db4fcddb8c49ec51997c7/
     sparc64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/0cf734a5e0733fb139cca55f5ef176230c63b0f8/
       nios2 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/f7cbc43e0a42dc19070b38077078a6a488a6530b/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/ce684085a2222bd0db953f3ed3dc9955915f1237/
     sparc64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/74257e93c05d6da09deaf995da3a1d8713ee80a1/
        i686 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/b8021fbf8128abc6a0babb12090c2b403b072e02/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/07dc750f77b75f261b16bed36483090a1ef6b070/
       sparc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/8c30bb8a459016db30ebb75c4dae817a78f0f7a4/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/e7a2341cbbcf514f4cd6754a5a36cebd6556a757/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/439dacf8fac84fc8ab2cb7252667c15b9bbb5bc2/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/7202c3f47f3ef8b6c2e62473bbb64fe765bf6a41/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/62a5d6a749f48ec48f25577b19f0132081d5f06a/
         arc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/696a93fb421f6ec53e5dffec7bb86fd8ab8fb45f/
         arc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/d6e3ae78a3d3e4ebe25fc1fd8d492984539eeea7/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/74d62b518180f55a6b35bbd3f4b7b476d344225b/
microblazeel |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/2e72a285d63a97ea12d20dbe42b6e52febb889fe/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/62ee62fbc8866a7150249a35f3ed3befa3381f33/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/6ad432608090c1c8ab9ca2e001a09dd11181a3df/
         arc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/f615149c40763fbf3168fd871c3073894b5f4e7d/
        sh4a |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/96d3d2070de95cf1d440d9520b75109455354173/
        sh4a |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/7f99bf2de6674666a4bee985d700f8cd37e0414d/
         sh4 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/dd9aa57ea24b3c8b894d30205cd4f796202382c0/
       sparc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/9571f6697bd6fd134534466fdd5349e16c5a7406/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/b8bfaffa92a6a392c7d3b584d1ffdac079bc1907/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/66972a4ae0aef21d29c3b0f1b7a1d286dd67518d/
        sh4a |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/865b59935fb05ff77bd116703646b678c130c862/
microblazeel |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/befe0262424e7eef1406f1b55a3eeac2b31e5b32/
     sparc64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/644b97921ad61ddece2be038cff3119b10a5682b/
       nios2 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/62c2644c5b5db7dc6c31c08137fa4a80ec95a840/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/01bbb4192d546b0939d5b98b334934da6b24adfe/
         sh4 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/f337e891a5a606223370401cec8ff14fca457447/
     aarch64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/924b8e8622caf153040c3dab41f7a7830ad5c157/
        i686 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/5b6222653e86c75c7cb9fa3186e3bc0afa19e0e1/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/1d057d7f5304011f773d66282ee8fe2b1bf01c2f/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/301487b4e7aea85265261645e9dd6566659b16a5/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/3a23787919f72694287db4e062543eddabbb6f66/
       sparc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/8fbc2d7e4a9961e3db1f377d1c01d1f54885e30e/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/5de8deb2ee50756cc95c2e58fd606512da55c31c/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/e0d0304805208a968ff359d53ad48bc14134c14f/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/855fcb1ed9c290a19baeebd09e8dce9baf3e98e1/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/e6c48a60f923ea523fa461a44c85f5836a4dbb0e/
     aarch64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/fb9337c8b0e7e120e2a58b4df4922669651aedef/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/f2cd64f147c15f7b9267c2208145b7041c6fb6c3/
        mips |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/916de7078dd0661f9c761b0433c084f607f9fdb9/
       sparc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/eedb958d3ca7b4ad6a52c83bbd2edff7fdcb4957/
        i686 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/96be8ad4293c15b3cfdbae5a1ead7f428ce7c790/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/7ef60c5827b103d45cae17b3ef006a8a7757d1dd/
    mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3a2b141d90b28a2954fa0ad3104cba81d648d2a3/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/70aa227c8a289631c2973474cfaef5973756dd5c/
    mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2b8c777c76b7e5d5a426045f5a3872d6b71faa56/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3f19dd459400ac7fca39e69dd280def6a547f8b6/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/b48bc7ad4bede4d16c079da0ae1121e6796a0e8d/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/25dcb19c3dd32e50990f9b45053d71ea18746a80/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3f93498811491d37ba13d024e33e68a8bc7ba18/
      x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/2561190b274d71666c4bdf3c569b02063cefdb30/
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/bf11d5702a59b9271ae29ef76ff6e6218758f095/
      x86_64 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3ebffe635ce59552b3f682e433baf0e7f1fa68b2/
      x86_64 | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/64d3b6734da72d1d9f0f379db64ac31863f1f3de/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/0d71cd6edccd390106636cc0c4acfe5a8dca112a/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/6567477b87c081db97a9c2bf84af182a9a281193/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/3f9443a76d2f8811720748b487e045eec23ec338/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/104b8fae4ff5918353e0e6a7ac050e2f04d701c1/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/bff7436a800eeea92c0c92bd2846b0f2b31947fd/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/aadce770cf86ded813a78f936f0a6d4441845907/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/fe3be93988e585a84ae3116a0c327e1e2c95ad08/
         arm |                     php-5.6.17 | NOK | http://autobuild.buildroot.net/results/0bbae90d05f14ac1fdbac7d8d69d4e6fd922e301/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/bd886cd10a8f52647296de2ff50270f25532756e/
         arm |               pptp-linux-1.8.0 | NOK | http://autobuild.buildroot.net/results/56dd530d53489220d0080480310b8dc150cf1b2e/
         arc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/d6565367f83cc845495e5e5f60935b71d04ef2da/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa1492777c5f60ab45921618f64910ca4d048e5f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a74810f0fce398c41fef11b8e2b8e1a52ffdb46a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cb70d195cf9b9b5ae09b83a40ef767cc8f699a9c/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/53e7e122e96b4b96c0f5feb4f26055b3f5ad8096/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/a6f6502e55fd68803f3ff8b4b76cce6601e101db/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/268d29bd910c17b1fccad5d13ce281238080efd2/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1eb3d1ca20ce81fa2b10593d9393fb130558a706/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/178bdfb062949fb10b9d6b9830975aa57702b3ae/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/328192a8c561f3517bb0f9ebafb59d09e4f4b3ae/
    mips64el |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/3c1fef2163b8a194ede70040da87af95bf5dc331/
         arm |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/601d8dc1654d8733db49b195139e12437663034c/
      mipsel |                   stunnel-5.28 | NOK | http://autobuild.buildroot.net/results/3448dc253a4a86450f15fb225374bd1e643dacd1/
         arc |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/e9c5df490264a2d9ff5160187bda75431493d666/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7009e334e51adce37353c5d4f618fb28678f6114/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/c660d29b0184daf7d16045b595e48d3c73ab521a/
      x86_64 | zxing-cpp-fa34227d26e0b388e... | TIM | http://autobuild.buildroot.net/results/41ca3109600cb3e327f1b9a56556e49d3b405056/


-- 
http://autobuild.buildroot.net
