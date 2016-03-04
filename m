From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-03
Message-ID: <20160304073022.647E6102375@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-03
===============================

        success : 175
       failures : 115
       timeouts : 0  
          TOTAL : 290

Classification of failures by reason
====================================

              host-libcap-2.24 | 22
     python-cryptography-1.2.2 | 22
           libimxvpuapi-0.10.1 | 5 
              host-attr-2.4.47 | 4 
                      qt-4.8.7 | 3 
                blktrace-1.1.0 | 3 
                     dt-v18.32 | 3 
              gst1-libav-1.6.3 | 3 
                       zsh-5.2 | 3 
                 mesa3d-11.1.2 | 2 
    erlang-p1-stringprep-1.0.0 | 2 
                  boost-1.60.0 | 2 
                 opencv-2.4.10 | 2 
                  gamin-0.1.10 | 2 
                   tor-0.2.7.6 | 2 
                    yajl-2.1.0 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
             ipsec-tools-0.8.2 | 1 
                    mosh-1.2.5 | 1 
                 libdrm-2.4.67 | 1 
                 setools-3.3.8 | 1 
               trousers-0.3.13 | 1 
               nvme-legal-info | 1 
                  squid-3.5.15 | 1 
                 erlang-18.2.1 | 1 
             stress-ng-0.04.16 | 1 
                     mtr-v0.86 | 1 
           linux-zigbee-v0.3.1 | 1 
               libcap-ng-0.7.4 | 1 
                   nginx-1.8.1 | 1 
                  connman-1.31 | 1 
                   fio-fio-2.6 | 1 
       gadgetfs-test-undefined | 1 
               libgtk2-2.24.29 | 1 
                    ruby-2.3.0 | 1 
                  multicat-2.1 | 1 
                  stunnel-5.29 | 1 
                 rtptools-1.20 | 1 
                sg3_utils-1.42 | 1 
                pinentry-0.9.4 | 1 
               linknx-0.0.1.32 | 1 
               valgrind-3.11.0 | 1 
                    cups-2.1.2 | 1 
               iptraf-ng-1.1.4 | 1 
        ltp-testsuite-20150903 | 1 
          chocolate-doom-2.2.1 | 1 
                   systemd-229 | 1 
                 libraw-0.17.1 | 1 
     host-google-breakpad-1373 | 1 
        lttng-babeltrace-1.2.4 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc4652caec17eb6c9251b6564273bffb0754d2d7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9bff218d9383dd61ee2ba5516f86767d32463019/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/17e790b44199bda2380045cdb16202392ead521a/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7287fe4ed2def05c64528638e0118ce776438f20/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/021554a064cfa9e90011c4708d297a009320b918/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/955aaa61e6f505eb58708c6ff0ad442e1bed1bdd/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/3c6e6db40a43c59e56de32d222bf353756fc5b71/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/4849c9d0fecfc7ef5e04364a3a147fb3e07adf33/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ab50d1d4af47b026da77a81224500a4627c718ac/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/1741c1d307bf9e3cb70c548c35e4096ba15fd7d0/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/deb265adc40ca1907a1b2a3d03ddf2ca815aa238/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/2a55b632438cb3a6c097c2ad835ebac2234acc52/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/a9ec98451118d8f0d5d290d9affdaa094903986b/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/c2cbb9ef700754226a5803d391294c4c85ca2431/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8152c2cd371d200b914035ac8356418fe935581a/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/fd82d6426ae10a7f62ad8cc91e08055f13082cd9/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/8be16d39c9d2e3104d74940561f1909e6027ea47/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/83dd28ce2ec3b35165460338d124c819dfb9212a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/215968d2a43aa167d7f26a6e2f6db7093c5a9134/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/268375a50f71730a6741359d5c6073fbd9adbc1b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/f46602197ba43136fb033e9f737779fa2bd86470/
         arm |               host-attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/f391288244eb536ad492aff55d8dda040945f3b2/
microblazeel |               host-attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2afaf6e9d6696731052650f2ae5c66ba49cdb481/
         arm |               host-attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/508422344f1549cf9aa7787a179282db0babb8fa/
         arm |               host-attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/59e7e1db122523b292d34405df6dca9faa616da2/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/47b46893fd3f201d23eb5a89770c8df3edf2d0e7/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0ad3dff98cce6ed0fb1faf7d43b1331ef1602121/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/832c83e6925ea87db43ec889c6bb411515424ddd/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/49aef62a9341f82a925bb6b097b6c5c125b45201/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b8468f08194b1e15c3a2484073429ea1aa399a1c/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dc995cf8574109c3a193191fd9dbfcb9abba90c5/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0cb2bcb975cbb4308be34b08745968deb6b792b5/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f3c49e0b0c93d5b15bee5d64bff194aa457701d9/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f134e1897051b7f45ab7185799302e66234491f4/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/074ff5da66ad58c0909b589a0ced20106e33062d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e16964b4fc3438ac6cf8177540a3abc9383e2a14/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/156c19cdbbcced5f3e79ee79ad7d184ed3c3c31d/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bc0af91a4896d0dda60e06c47a6cd3078e25c950/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/86dade7241e5f567b740ecc584b8302a12d34fb2/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a3128b8b9bfd2e9da60bb55c8d4f441e4208d713/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/22d2b49bf72f2c1f95eca82e6b3d2f9a407b0076/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d3fc074c2b1f3e156e5b3c19c406fdf1aa654855/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/aaebdf782dab5e7a9e126b900cebdabd07e80774/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3c69676ed3fa246e774653e8746b00c2d5db0fa4/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d8370ec447b71c7bc4f1c4780d14f5112b79deb1/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fe12813fa0b042be375705f13a32879785a3063e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/65ed11cd980c43d5413a9e727aa2c362a90206ea/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c68c5f826ab4c621115623eb9480160aab5b94f9/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0d512299fefe574883ba40651c49b405b2e028e1/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/77986bc3474116c6e37b88a7e7f9bc5965bedb07/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d5df241fbae67fe8bf5c27e5c5f4ee828018061f/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/62bba06deaaf63b3cdc490462d95aa5946e7d577/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/3a0ac97c7852251426f50d33ed147610a51aa1f7/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8924b17f3aa5eba1a8016d84d4478ecb0a96b236/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/86fef2a30065d5bc0d7755706e9ca3332426834d/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b47eb03e93e2f1af85caebb707f7b4667f7e3d74/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4c9b22b33533132fd9f88917cc341ae2c2e171a8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a8b33bfd099d9b9cd383cc568ea70846eb13c34d/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/25804186b1f2d0dece7f01bc148a2cbf623adfa9/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/93079e4049ca51463929c898a5995f60a33dce3a/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/16365417223b15482d42c578cb16c76a1acd3282/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a6445df26514dfa9cd7e5b9d34b4687d46a8d19b/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/f37695464e6db0b13e5e6a5939916c779afe0c00/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/1e47f1d0062424a0f38b37730727e863d28522c0/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/7e1e5f12a1f5c60462820dd6dbdb0262e0ee4617/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/31280d01a3761ff3a345f1056d42c2b44a8127a0/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/9314177c4b2797b1f93c090eac0eba08c35bfad2/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/999f1949e3b76c1616b6413d472c566777dd8800/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/5012988b47582b30b1f5ff1e31e31f92cc8b2e94/
        bfin |                nvme-legal-info | NOK | http://autobuild.buildroot.net/results/051641cec77d00fc075ed82a1274fe393a82e07f/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/7bcbb8fad2c3ffe32b24a86c5fdd929299dfb013/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/b493f17f7da57e5727ed52fc20ce022c9d95f98f/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a3e417c4fb80c8a566cd5985a46f2d261bfc054a/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/835bd9c130ad5a794d26924d4d76755056a67b97/
    mips64el |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/7a8cae535deda6e70c88904c715baefb1d754d42/
     powerpc |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/ebd0c908eff1794a982ffb99b7c40cd6e530482f/
        i686 |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/2337d8d3775ce9bbdc446377e90b9a381095e996/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/72534dff2af8883c93d3e6e8b5204ee859d9f887/
      mipsel |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/376b2699b44b2438c79430287975a8d54d08d8a5/
    mips64el |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/5f10aca23b829b268533150e9f2db4ff7702eb03/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/d3d162a8e81b26e2f53f6380f982692f233f2d48/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/c73b13e359439f8d83e73262a331f83e2ba49233/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/a437fd46c93572e64f54330f93490bedc18bd535/
    mips64el |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/ac35e3075e7edcec1eb5aa59b100720d73ac5d36/
         arc |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/f7231188646d4667add732657ac57ddf13be107b/
      xtensa |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/5462e6e41359ca5459bcb3c5b59db7b8dc76ec40/
         arc |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/5fc28bafa3cd7171ce6343d21f65af090536f443/
      x86_64 |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/820bfa608ee881f44d9005efef1f2892b70a549e/
     powerpc |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/c753a14e323edd8279a94475087aa328ab32ebbe/
        i686 |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/a78c76fa2e7fc7365ce5ad2a1fec0b46ae19f7fd/
         arm |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/6c68fe8a128332e8af09bc86a39a3be5c4cbd4bf/
    mips64el |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/9799f488e53aff562056b110b4780fa1ce5f0cba/
        i686 |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/79871a088ff593637c4b2b037a7ecb1135615786/
      x86_64 |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/ecbe910beaf160a03c337a0c08aadc4972093bca/
      mipsel |      python-cryptography-1.2.2 | NOK | http://autobuild.buildroot.net/results/af80c3084e6f24bfc6e80a4e4097d2ec13561460/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c6b93e885c806ad1532a66385b60e0b5e845537a/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5650eb255d7acd1ddcfbfb92033e9e89afdc611d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/164a7f92478b0eb0c8103df40f9d80fe2dd3fa9e/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/04315265a21ecfbc2973435c3aefb5d2e4b742e3/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3712e3b93e057705d76b184303d77793ffb70070/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/0460f4e6fbf6589ed52670e49ce6dd0ef19fe8f3/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/514c129e71d3f6f705d7f8d73b07bb86a7bcfb22/
      mipsel |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/7df60f2f1c2acb68f41d3aaa1648ce4b75116032/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/cbd72b2914ac077abed21e01280fef687355dbc3/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/ca49dd7a66bf474069a15558d97f92de5549db5b/
      mipsel |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/2211fcbcd8d9a13dfd342afdabab4c68bf032bc5/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/13ef47c962afefbaa9ea7a95de083f885f1a8825/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/1a49b985eca59b65af6366ca8f790b1d280e3a86/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ad8040c82b03d5f54be909f0ba290b445016cbbb/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7a4d16c7b3b7c2deaebcdd1569cb3e24650c0ae6/
    mips64el |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/81fe7a3806f51eb2a875ee04485cc4285a42adec/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/9ed21c7d764cd7dcc854327d9a796899f83864b3/
         sh4 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/4cf70c04cb1a479583c8a2b1baef1856eb8429a3/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/574df268196f27481d24144952dbb581c9479bcd/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/d69796d13a41819b33834dd4b834319962b4ae60/


-- 
http://autobuild.buildroot.net
