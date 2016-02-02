From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-01
Message-ID: <20160202073022.71F27104913@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-01
===============================

        success : 198
       failures : 121
       timeouts : 1  
          TOTAL : 320

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 18
              gstreamer1-1.6.3 | 16
                  boost-1.60.0 | 12
iputils-c8ff6feaf0442f8efd9... | 4 
                      icu-56.1 | 4 
                   mplayer-1.2 | 3 
                   erlang-17.5 | 3 
               libgtk2-2.24.29 | 3 
                 libdrm-2.4.66 | 3 
                      qt-4.8.7 | 3 
              libraw1394-2.1.1 | 3 
               libcap-ng-0.7.4 | 2 
                 libraw-0.17.1 | 2 
                    sox-14.4.2 | 2 
        ltp-testsuite-20150903 | 2 
                   fio-fio-2.6 | 2 
                grantlee-0.5.1 | 2 
                   tor-0.2.7.6 | 2 
                pinentry-0.9.4 | 2 
                    ruby-2.3.0 | 2 
     host-google-breakpad-1373 | 2 
canfestival-7740ac6fdedc23e... | 2 
          sane-backends-1.0.25 | 2 
                rtorrent-0.9.6 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                  trinity-v1.6 | 1 
                   ushare-1.1a | 1 
flann-04b4a56533faf8c8228d0... | 1 
               trousers-0.3.13 | 1 
          chocolate-doom-2.2.1 | 1 
qjson-ba273682a9d33a7b3090e... | 1 
            gst-ffmpeg-0.10.13 | 1 
               valgrind-3.11.0 | 1 
                 mesa3d-11.1.1 | 1 
                 igmpproxy-0.1 | 1 
                  c-icap-0.3.5 | 1 
                   hostapd-2.5 | 1 
                  lshw-B.02.17 | 1 
libwebsockets-v1.4-chrome43... | 1 
                  stunnel-5.29 | 1 
               pax-utils-1.1.4 | 1 
               nfs-utils-1.3.3 | 1 
                pulseaudio-8.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
                harfbuzz-1.1.3 | 1 
             bluez5_utils-5.37 | 1 
                    cups-2.1.2 | 1 
                       unknown | 1 
                    mosh-1.2.5 | 1 

Detail of failures
===================

      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/991363279ba7036e3ce05ba0c5f23f12409e7283/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2a768d6feeaae11958e1ab84bd7326c087a61b9a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3bc4508ca1f2a1f261ac2f7748f3bcf05a6ea2ac/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/668579fc17bfc2c06504a15b9c602d75223c26e0/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cd06f9b0c544fdeb12be4ee6263c6ee4790691dc/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c9b17bd418db4821953c15244e5d884aa747f358/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/90d8388a87d5cf157085f48c7ae447a294151180/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5be04cca161610933695dea8e5a56843be62f6b2/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/df4fe75cb4b0ffcaffbd9a787ac88a41b87b0d8e/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/62a310c0e1024aec2cd56b12463d98e315a3c840/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f26486c6d4130bb72baaf2f934977c50f8145763/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/261f55021002c934c322ec1cf0f893cd51650f20/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/302e71ba7ff499575916fe71cccf9b9b071c91ac/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/1050de8b8f632e891b2cd36b1c145ac1b4708306/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a3364044a09946edbec6d9c1afd5bdfa3308705c/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b5fc822f9e13cae20397b29c21c7e54360abacad/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/52116a01dfbe66b026a396aece891d37a173aa08/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/250399c60a9e9f8d6a3acf6dbc46cfd4e572308d/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cf7b198741ff5bc4a8bf20a7026179969f5cfc9b/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/508d382dd4c852878841d772c65013d48db86c66/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/560ab983dbe529af618e24c34bba01fa547e1376/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/14f8863b7714b4ae7b41b62824be9fe01009338b/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/765fbf59975ffa1d2f9e1d8e50a2350731d82c0c/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/2ad48d99958dede9007c2d5b079b097ed70a1f85/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/abe434c0f28496ec9d9382e217a876b57eafa88c/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e192e3ed53c3014557b66a11f681e63492281a55/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/30b68a27d33c41802972d052da0fd681060d9788/
      xtensa |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/c99035724d7c390d89c611e41a312ed99e76a834/
      x86_64 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/c0768218b658b32f1bfe0de5e79adc5d7b83fd99/
     sparc64 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/27eb3cab0f1aeb64c16a8fa735f3d907e82a6349/
        mips |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/d8b4c3ace5c55ac6f02f8262cab3db79da876804/
     powerpc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/b85a890ef8edd17eae877cd575adf53c737d5d66/
      x86_64 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/788e75c41f33eebf8590a8b8ac687c4b11666410/
     aarch64 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/deb013060a82c6ad59b2e5bb5796a52b7f50c4c1/
     powerpc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/17e6eaa347dbfe97f583cfe6857dc81446840966/
        i686 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/9a7e4f43b5007cc4c00bc124b7a324b1f5858a34/
      x86_64 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/add538c6e7f6b1f093aeea35168927a4deebc0d7/
         arm |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/f0331ffee7828544a9c647619c3a43fd692c248c/
      mipsel |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/108febd524148d3abadb18405e5f280f9a10cb4d/
         arc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/e617e80c3d9d829e1ba68d1977b46bdc82196043/
        i686 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/ac3237a2fefaaf694e6c8e6a6f33122b1c7b9156/
     powerpc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/83a31c6cb30b1cb8849d0786e043aece3be3fef6/
      mipsel |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/c1253de55baa89e572c3ff86ecdaaa3a251c0c3f/
       sparc |                 harfbuzz-1.1.3 | NOK | http://autobuild.buildroot.net/results/838da841269dd66e568bc204604be9b65ae626de/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/638c76d4c25bb2fb360dfff59b8785c02715b463/
        mips |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/6008dfef066b1f362d4f20dbaee9dc53a32734a6/
      x86_64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/aff42fdbb6e427d28b16e5900609d4ae21a029fb/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/95f69bf5076d1a818817dd71ba5c7d3ddb0b0989/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/4c5e1b0caf2153cbec3b23fe2cc6b3ff6911ad13/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/f6cbf04197c9f714d2c51b1382a4c0bfdbc10bfa/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/05bc43c8d2afae1a50ae1599ccbd1094b63253eb/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/51b8ae49a45b2d0272e156f94721fb74dd62425c/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/b58d2e8abdadf3a37a5742c1ff7c0dd383a22a2b/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/ee96bc5f112f4b437203336c8400cbac7efb525a/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/5b535fd86232f7d414e139b36866cf70a8bd2710/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/05759cf24dc0be8f93ce794276a5dc8863102559/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/9f2c68e403f3d1d9e6240a61249bf0c5087e0ce6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/eec59a7b44c333b0e3ed8624029edd944a73acc0/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/947208712b2cd2c6bf95694176d0a5e0e3db4921/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/725eaed6685eb2b26020ecc83fcb91d303712da7/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/076f48bf7c353110f11cf59e1f4bc4929ab2da5f/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/7e56a0cee23f68999a795aa6af13195b0869c551/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/0d376254c70fe2882692b424ade679723286224c/
      x86_64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/91f6aaee0e647ccde38e7aeb2c6052be1a39b64d/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/1b0f496fddb5889e915469d16b80a02f0277b0c6/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b2cada3d495293970ff38e588013d73649723042/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/cfaf39ae10293097d3e407ec3a98d624c601891e/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/e05aa630988ff7a790697d9f551d0a344ad165e3/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/aac0c1ecd7e1657d9afc46ab158926f8205b68c5/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/c3c2393fb0c60f9dca426d84fdaf6839f0c27970/
      x86_64 | libwebsockets-v1.4-chrome43... | NOK | http://autobuild.buildroot.net/results/eb74fcf66b6633ce93935b0a350c809676fb48ec/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/77502997cfc360894459061cd7c96b1f8926b004/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/c50c77d4857a33d7ad0389ea71a33f5034371655/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4904960887cc2ece632464c9b42cf41da4566198/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/62140044cdf6aa35cbb24da8e1c9c6cc796d2bdb/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c597e748f741e632be1dddb09295d61323358fbd/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/4b67a83bdf61163880d37971330523dd41fbd306/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4ab973cd79c2a0d289ae45d6cbd5b32d7dc96377/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/bfc52c248eeae8a2dc1719f3ef2d0f3b4750019a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/eb02f30ad5f47432054c651238b1b998f6b98560/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/3d9e75fe79af404ce0ed3f60e66681030a0b486e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/9bb80fc2ff51855a4f4e42ffbb97776e9d54b6a6/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f6eba6cae54ece2625cadbe0b91ce33652bbbbd0/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1ed96636564bd2364368ccd3de475161bbe4c391/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1980334fd9004969cee5193cfc7ebb9c6c9581e6/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b97a39964134dab8edce64da179bc2e4ef7ed86b/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1a6acd21a92c9b97ceec4bfaae1dd79a3c2cabdd/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/93d7c9739dac386d4bfa10397ecac4ddb239594d/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ac301e0a6d687d1442484260839fd4b9c82d6e13/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fd2f81ceb72f92f6346c6b99b8524bdd6072c3b9/
      mipsel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d15c58ad9d943852ea5febd09b3a433ae380236e/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/492b88114b1bfc8bc5b4b58fa2cb329d23d27eb5/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/07a86743caf931cf3e0bc8588760659c35292f37/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f4859aed2d54566fce52f97b99304860891f6efc/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b05b81740ea7ba0e1d8e8ba9c6945505bcc8fc2e/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/731d895b9d008c280a54a651c4581b6ffb6f2b88/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/0df1a7e4b95a6f4fb168f97c9eaed0798d08baae/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d5ac346a14c87d8ec57498c6eb561ef3f5099cfa/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/978f7c672d39136ca14cc4b5d1fe17cea927bef6/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ca92319537ee693b1f25bdfff7d27c198757c896/
     aarch64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fcaeb5d3b0130f07c02652beafc4fd7df73a0190/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/6830e49d531a2f6140fb2544966129666e341231/
         arm |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/e218de8cd364a4b1dd20476833101f4df74e08c6/
      mipsel | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/e13fd3a69b069252d5dfce95a29722e54cd2ed01/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/08f6e487eed44871843c2ccbeae1f1f9cf790259/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7a64d590f878cf154427ff1e4d14dc85314af402/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/10e0247dfbe34898620faf11d0b8368f0887abbf/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/7c64455d8f67bc71755ae7fa3405e311acbc7b45/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/2711d093a1546cb2efe1137ac2001230b438eae0/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3addfe34f55213e4184f039bb196e581d1d14e17/
    mips64el |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/866bf7770abda8540849e9e353b9c1ba683cb612/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/69d23ce24a53e1a7cad2242b44b6eaca7ee61751/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/ed527a5a2aaf037fd00fc00d3d6695ba57b5f5ee/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/a6e65c47e42d9cd6a630635f9dc2bcf140489d2b/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/692cad9529438ddb343640f15e845ceb495fc4e2/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/018fc46499219c9a269a34f4258e864778a404cd/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/14a3e3c60d5b129b3bcfb54bb0bdefc4d0246ce7/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0e10ef137f15c9ed0f020f8f9d8dfed31cccceef/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1317b366bb3f1f4609ee897de7326bae4a929a3e/
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/5b9e85324d5b4d8bd2390763e7819087cb6b3f65/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/10fd9f52976d8281134074da1df487b408c8c242/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a26b42e369fb30126e7d9542132266e6a4c4c3db/


-- 
http://autobuild.buildroot.net
