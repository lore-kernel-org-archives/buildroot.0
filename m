From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-20
Message-ID: <20160121073020.84613101F23@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-20
===============================

        success : 207
       failures : 104
       timeouts : 3  
          TOTAL : 314

Classification of failures by reason
====================================

                  libv4l-1.8.1 | 17
host-vboot-utils-bbdd62f9b0... | 15
                  boost-1.60.0 | 13
                  connman-1.31 | 4 
               valgrind-3.11.0 | 4 
                   erlang-17.5 | 3 
                      qt-4.8.7 | 3 
                       unknown | 3 
                pinentry-0.9.4 | 3 
            gst-ffmpeg-0.10.13 | 2 
                   mplayer-1.2 | 2 
              gst1-libav-1.6.2 | 2 
             bluez5_utils-5.37 | 2 
                   libnss-3.21 | 2 
             util-linux-2.27.1 | 2 
                    zlib-1.2.8 | 2 
               trousers-0.3.13 | 2 
             stress-ng-0.04.16 | 1 
                   tinc-1.0.24 | 1 
zbar-854a5d97059e395807091a... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    ustr-1.0.4 | 1 
                 mesa3d-11.1.1 | 1 
                 qt5base-5.5.0 | 1 
                    faifa-v0.1 | 1 
                bind-9.10.3-P2 | 1 
                 libdrm-2.4.66 | 1 
               dvbsnoop-1.4.50 | 1 
                libsoup-2.52.2 | 1 
             irda-utils-0.9.18 | 1 
                     gdb-7.9.1 | 1 
                 opencv-2.4.10 | 1 
             lttng-tools-2.7.1 | 1 
make[3]: *** [code/CMakeFil... | 1 
                   mpd-0.19.12 | 1 
make[1]: *** [subdir-sparc6... | 1 
                           all | 1 
             netbsd-queue-1.70 | 1 
                   systemd-228 | 1 
                 dropwatch-1.4 | 1 
             host-nodejs-5.3.0 | 1 
                  stunnel-5.28 | 1 
                 rtptools-1.20 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/d39fc7784cda86d0b8a94a9bf14a2dd1c03b9102/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/ec87ec62bddbc21cb3d6749ff295a6857b30f7cb/
     sparc64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/1fd0bcecedc57ed836c536e45ab8a75bd5e8711d/
     sparc64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/f7411d2ea1da86e53f9e6344c0fb9cb44ba17a51/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8b793fc4ad88f06420ca9c308998449b6b068006/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/433c4e7b86bc0d120793e82cb4a5d29b1f6fcda7/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/14ba5efcf782c8ef85908dd1687d9f41185a773a/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/de4f2675d3e35d672a0d33488313d33b7797e28f/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c11fbf5cda2b1bd3e35cf317615777e20d5a79cc/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cec037c0195f7702717c10c2d9b81368eaa33442/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/539c709f0443452898b8847fdddf869dfdf6739f/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/41555cfb8da4f3842004e6b175f68bdf738c4047/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d14f2b5edfa5a85d8e44a47fb04731d1e432283f/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c4a144ec7ca0505c1faec55d35b675d4dd460f20/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8a151df4fdac33a782ae12e3d605681223c6c296/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c2228c640fbf4ae5b659295e59875f6acc74335d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/07eddcf20e6b9426b24f42204d6b9dba3bc5ed9e/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f0a4e7f7d49f55e4f12457f3502307a3fad5110b/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/128d9fddf06bdc90b218dc21466b000b83ea4d9a/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/afc6e55e0908682ed9a41de914fdc345f846f74e/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/16e5ae436b90cb896cd055ea391eabe0ac09599c/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/af53ffb2450556fecba7e35fb5dc3e253107f180/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/6881dd3c15156e2e9dad5d878fca9b25a1dbc5b2/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d99bbe5353f13c62ea3deb9bc233fa7be04c212f/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/1dc50d3ae8e20c57bc78089cbdc7ff837b940bbb/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/8efd9f09a490336ff0696fd0f0a5e78520e67e0d/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/0c17f4056dd08927ca878c4a0d716f0e3389cc51/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e8156d0b89e7157b8f10e428fc0958b0eb29e50a/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/782dcf0b9cd6d3e44723db480066640cd919e736/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/1008654b022cfa7417e197038a387204f1ee815e/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/842c064a781fc8b3b3e800f9ae85861d0af2a9b7/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/fa3af3d47b84ebedd9bc08bed3e3c712f52a4972/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/dbfffad91db1ca2a99f78a2fc63efef5247f7fc5/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/3801c8e8cae6a3cd4adc82f14fefac4f5a10c7f9/
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0b5c1f468fdd4f2e1420d0304b935bd98ad446f7/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/eefdd37012482984ab22315b790c8d280a2cf6a4/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/90f66f45c86eb1085fca3b75321e3ecc0f452ad6/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c61b390fa87d5676563f94f0074cd107e4dcbba6/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/45fa3fe5c3a1f346c8fec64b572971ff4e55937e/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0c76a90662841df9a503966a63d61360fb88cddf/
     aarch64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/22ce861165435a1b5c881b44dabe2c5d14140cf4/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8b20d140510fb797288383814c99e08e5928f13d/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/777a154e28de95df1798e600862246ce0d8a74b6/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a4dbecb61d6d0f0af3416e5d1d6331d386b9b027/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c7b62327ecba12c34c7a95c38cd65bdf7a9ffcb6/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/524ac45adcf200bc4c74681b483e69d7836c5144/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/691d408088c32c0f8ac6b2b1ad2ae531bfede458/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a5a126ff333c512c74feda44300cc5a1f767e018/
       sparc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0e43989ef90d635a58f7d9e3b23c2e8419c6afcc/
      x86_64 |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/feed5bc6393fb35be755790d53218fc0d228d850/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/f9bc69020ead2d7a49f511456b2d756dfd960fcc/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/f83d8231a1d07591e6bb803c08ae848858e853e8/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/17bbcdb19337e54cec9c6cb486de775b1a34202f/
         arm |                 libsoup-2.52.2 | NOK | http://autobuild.buildroot.net/results/0ff8d33449a231c5adaa181054a8e9e41a13d9f6/
     sparc64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/bd7abab94f0391c654e5f5724d17335134c1b9aa/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/31774b59b8215fe544b1d483d69bfcfe7a479620/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/3efa6bc1626f66c4b2d85c66f5111df080811c6c/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/8e230bad971f852c9577600563a659cb2110d23c/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/858ad9a8613c650e5df37a46d10d0aef32bf76bb/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/0655cfa59ffc6184bf0107af3d77f192e8616f63/
     aarch64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/980f9dfb8140cbace675d8479cc7737e675e0f9f/
       nios2 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/d6dcc06f4a3f1ee0b9f766da58e418f5faaeb935/
        sh4a |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/bbc18086da9d31c092904a8a60b46f85dc3e3c7d/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/6d52d4101b7e4b66c084b9cf56a09d4dba500706/
      mipsel |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/c26605c2d4ce049803e7a5577c1e175d2971672d/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/224fc7d79a347c96cbfddcd035adce94565f4273/
     sparc64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/8c20231789a69c9cd8db347113c472d0f72e9035/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/144885e5839193d52c436291da811a8792646a85/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/88f3e58ca2d2a52ae5b6796eeba161285a3a0f2e/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/dbe06dcb9a48d3f0d03711b65f70befcd393f6de/
      xtensa |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/779798a7c1f313193f02e9d104ef16db72c26427/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/e1ad54707bddcd46d7e0e447971a1e06a87b101e/
        i686 | make[1]: *** [subdir-sparc6... | TIM | http://autobuild.buildroot.net/results/ba726f9823347d5593fbf2e1a848acae20b24622/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/a4805b104148298deceb03bd73e7a50799514d1d/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/a86ec6d0971fce3a27a5d84cfec15967dfb3e94c/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/e73b72d38e181579cfd2a9a4b2adada0cc63c6d2/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/906383706e663e2c985547acd306450e2fb97f39/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/68fc2e327cd33d4faab6e361b746afd492e58b62/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/67f8cd3f77c250bf30d3cbb036b67aceb076d3e3/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/c66d0cda7de1d8fe07a567cdce50a62d72e01304/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/2caa00cf6691e5570120e4db78a909b920858793/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/cc201dea2bff0bcdbb10984edab960e418f977be/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/b569691a32e4d239b526c58fa8e0dd70a8c93059/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/709d547699596d09b4601a7940677d2010adeedf/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a76e5a4fcbd5af65c8abba881db864c38e0bd6e5/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/972a63c18d9c92249eac8a5154a505ae0557e626/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/823067a1550db3217d62fcdd3146f9312285515d/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/922b6ced1b2bf1f1b3d0ba2c0a23838bb5e00fcf/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/264b338c706cc15796760c9ebdb2ff0549010c5a/
    mips64el |                   stunnel-5.28 | NOK | http://autobuild.buildroot.net/results/48853db7fd2a17c1d51fa14d9076cc378ee77008/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/d59fd55a58e3d1b35c3e4814281a15771ee07c87/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/8250c7cac16a0d030a4daf11dd73609184581be6/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/43190aa12151167a93c63e38d6fa3b81f994aff5/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/058282dbf760f7798caee7ca2dc1666d435d576c/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/ccf8ceca54b7f678c0ababb4bd72a695e39b075d/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/a7cf1d1736e2e4f47b1b36f39fb8b618e730c844/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/544539498ed4362f3ab0e3d986bca9a84a0a8d5a/
      mipsel |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/73cc9516ff0054f447fbb296ef3a8e032d968460/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/d9371c2bdf397a1c745db81799440f3f566f62ba/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/65bba88d0a6c0d1d6460c75d0793185e3fe175dc/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3e828209589cdba236b4674706faaa97614be68d/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/30082cb38fb342750b3ecf2fcb22cd7fb10e5116/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/998b5b92984b1e009dc7795983b8e8f1de658426/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b03420f1755d426fddee72a3dd9b9bed7109c05f/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cd2545eb9d92524e8b28759a26ae887fcee7f796/
         arc |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/45a8d900eb55c10658cccb2f786bbc841cd353e6/
         arc |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/c0063333269bb9f4a950857a164a14b24c27aaa2/


-- 
http://autobuild.buildroot.net
