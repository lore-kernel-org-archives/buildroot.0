From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-13
Message-ID: <20160114073021.43DA1101E40@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-13
===============================

        success : 225
       failures : 156
       timeouts : 2  
          TOTAL : 383

Classification of failures by reason
====================================

                openssl-1.0.2e | 26
                  boost-1.60.0 | 18
                  libffi-3.2.1 | 16
                   assimp-v3.2 | 16
zbar-854a5d97059e395807091a... | 6 
host-vboot-utils-bbdd62f9b0... | 5 
                  ffmpeg-2.8.4 | 5 
                    ruby-2.3.0 | 4 
                      qt-4.8.7 | 4 
                   libnss-3.21 | 4 
libbroadvoice-f65b0f50c8c76... | 3 
              luabitop-1.0.2-1 | 3 
            gst-ffmpeg-0.10.13 | 3 
               lighttpd-1.4.39 | 3 
               dvbsnoop-1.4.50 | 2 
           host-openssl-1.0.2e | 2 
                python-nfc-212 | 2 
             bluez5_utils-5.37 | 2 
                bind-9.10.3-P2 | 2 
flann-04b4a56533faf8c8228d0... | 2 
pifmrds-0bf57f9ce0d954365a3... | 2 
            netsniff-ng-v0.6.0 | 1 
                     tftpd-5.2 | 1 
              gst1-libav-1.6.2 | 1 
               libupnpp-0.13.1 | 1 
                 setools-3.3.8 | 1 
               libsodium-1.0.6 | 1 
tvheadend-66e5d277a59db723a... | 1 
                     vlc-2.2.1 | 1 
               qt5webkit-5.5.0 | 1 
make[1]: *** [libleveldb.so... | 1 
                    pppd-2.4.7 | 1 
                       unknown | 1 
           aircrack-ng-1.2-rc1 | 1 
               trousers-0.3.13 | 1 
               libcap-ng-0.7.4 | 1 
                 opencv-2.4.10 | 1 
             util-linux-2.27.1 | 1 
                 igmpproxy-0.1 | 1 
                  prboom-2.5.0 | 1 
                 lcdproc-0.5.7 | 1 
                iptables-1.6.0 | 1 
                   mplayer-1.2 | 1 
                 openal-1.17.1 | 1 
libubox-e88d816d6e462180f03... | 1 
                   open2300-12 | 1 
                pinentry-0.9.4 | 1 
          powerpc-utils-1.2.24 | 1 
                     rpm-5.2.0 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/efb9c28e69e24d546f83ebdc8aa6ba386d09bead/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ea441edc838beb761cfc5e761951f6a59a2db11e/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4ac37859808d78886d344c1a74464e97e34bea69/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e903fb75b24c3c3436214d23bb8a45ee57c44b70/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d97e916552a140f2c3813ffee77d9a8127f96bce/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d8239811e97541de1655e117c74aee96985e5775/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/213a1b85745928949e4155d485a654f01fac0f2f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d6ee2aeb2fae69946d73574dead4637428c0b459/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5cd5979c30c82fc7d523c7a7c67ad19846890f37/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/987ffcb7c4971b5d775d937690f1bc3d5a9e6ee3/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/fdde8420c811b6cb772a3d08dd02e769a1630a86/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bfb0031fd7c17809cc22de69e207d4152920030f/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/755658945e34b64afb474050d8e48ac4fc10708e/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/25b6799307037c44fdb9027165a2aad003fa7eee/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c4329b7a6263e91b9c0c97e6ae92d732e0dc1d8a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9bf711493831f77247ea4a2e92eb273ec6175fa5/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1a3f7edd0edd64c0cbf9dd010b3354251b23d2a5/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/9ae48c4ad6e0b4c272a53c7f54371780ab543e03/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/72e3bc363bde6f73f9e5de82cda7050b5c79a215/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/1ce8c2fb559152e4aa64a24b4108312342b0705b/
      xtensa |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/349ebfccd9aefc7b7c3dab87447435245569085a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c7fa936757c980a571a75b403f9c8aae8f718f3a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b9873b97a8c8ec7505e0e43a1ce19ef1cb2417ca/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cef55f9c820ffbe4cd96592907e304a02a5193df/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f3412cd302bba6a45e420c0cca5760cc2b6739cf/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/841b61049abcf6f11ec943871c9f612f896da1bf/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09598e107184cea9b0390138eac263867320a7a2/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8d93b7ed1ec285a15f7dab5aca8dd50304ec3259/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fcc9e1aabd44baf0f93085f2ce408b73ec45f394/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cebe3015607672c4014cd1eb2f2259be53e1b93d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cab2d42a862dabf1025d0496cf92998bcf4d89bb/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7788ccd86e54bf28b6c0767e8d8c9efed2f6c0cc/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/68f5b252b86072c1cdc250506cb09f1116c33a4f/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/36445b5bc1055d722f5cefe16b86f1d07be31e9f/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/535eeb1f4301e1feaa78b26f6ce655f2c7bc19fc/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7322299bedbb995c97b1d7fc55890e4a316d3419/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/529ed3ed114974e8cbf03250f5448d6244244494/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/10f9b8649d8b60034cb37087feb9d2b81fa31e14/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/791b1de00e41904888138d583a6f430c42df07e1/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/8642f5ac668055c69ed4db58388b99e047876d52/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/d51c43b36a2d385d178f622ca1e00e6096d554bf/
       sparc |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/1738a8f6a481e0fc1e0e435f43b021fdaaa5d3b7/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/92d790f52538e3ebdd4b83cbbc5f383c6b2af9f3/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/48efa84875dcf41815ef4468dc2cf0b3500f68df/
       sparc |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/cd3ca8b4986a0a2a7a77802ec288b775b7963b1d/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/6a17ffbc360e6936459c9a0d18fe19aa1c94d157/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/7af64a3e61cedb8c170b60132d0488e1634e9554/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/23ada292ad19c17cc7ed463b7a62bdafc20ee55f/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/9cf5487b45726a4f8addb0166334d0aa622458e4/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/7020fef24999886c048286ee5efde06954828d81/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/e14ee08dc3ee12302b5ba267df33b6c587e48ae8/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/6f1fc4f531b442f390e0a45d6e2f52250a1a6bf3/
         arm |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/5a0936877e4d167673fadb001f582773c4f79f15/
        i686 |            host-openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/296c8fceb4b1c419908c61226fd5c1e588890fca/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/55ea52a293f20904c98e93e36fa73e811dc04cc8/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/633e5bc45604e3abf2af37574afa94e959182cf7/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/718eb920422affb9f59347da18c6b4fe7591c554/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/187ad2ed985f2178a5ffc735a85080f5c1d9ca86/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/861b019326c48398fe528148380789278862a229/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/083c61f43c2f1f0dec69d44583b447a0520933b7/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/8f78c3fec6458557ceb0f3151ce29b970825d8f4/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/b3d09286d018e53a6d57f8dd5616010a3b212731/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/9048cca58cef63b800ba0033ec28259f1fdbfbc0/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/260bfce2621d7dae507fb55aa4cec25873ce3633/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/47bd396c7ff1e577769cd6f6fcf12ab5afa3de0f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/71ee524d500f447640afe6dfb1dab1e5992b0b34/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cc6948296c05e21d5cdafab628f4e405b9ef5dbc/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c4a8d06c991ecf03ea35681b6a47ea08c2ac94dd/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fb224dd4ca27048557eb02269bdfd54eb59c5028/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/476fabd8da0992e601db88ad7dc28b4f110549d1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d91d7d7217d3af69f98ef13067fc0186450b5d89/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/261bef59b98f44125cc4c4ad9de8f6b5d70778e8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/482de60d6202ab202ccf72413cd4dd9948e5b853/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/84d09a3cca5dcbb82722ec1ddbc816a696511c93/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/92365cfd28f93bf288afcf4ab9a07223d8c04290/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3b2b30c1f69b05ef3baead5ac6758ec83546bfc5/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/122ff714351461c4c0f6a425eb9106068e331aa8/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ff0076fac8658e51b66365f491545723e1feafda/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7e8ee85b97cb2b06e9439b8a9a91ae1d76b5191c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c84715f912608bfeec5b84c66ebc2a9e3a0b6126/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1dd38e24d373e97b54e88d4795492ae6a2c4b451/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3471e54a31641cd491b23ac8c6a51fc449934a95/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/b896413ebce23f53f533ada70a40444d4c2c86e0/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/5f878d76c20cdb3ebc6266bc5b8e5e192c54b295/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6bf248a02781c7be6ec666db66dab429e953d16c/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/47af48adae4b582f603e3578e6285da3bf9fc860/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/2bf44b90db7e0ebdf66368e367590b87fe090f57/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/2bab0233d209ea0d2e4d35391401a428bfa6c32e/
         arc |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/e2cf361e251e48d8f413e94deaaba37d08669f7e/
        sh4a |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/f384f98dd792b9f58643704301fbc2420a7dc954/
       nios2 |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/f233e2a0c66aa2b3179ffbab9c598ce8b7a9ff07/
      xtensa |                lighttpd-1.4.39 | NOK | http://autobuild.buildroot.net/results/564fdc5b30293ef5c96700442943393edbe78bd7/
         arm |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/8caaef27f88485102d20fa6f64a824c74a1ab459/
         sh4 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/154214fbcc530ba6a66266240eb63339c779aa19/
        bfin |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/95a8d56749bd1a09c125fc06a1d16087e4a65a14/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/f6c79f9bca783f4f74791593d57d32d77fb47ddd/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ef5da41837900e25115d64d28169ed5ce4dbbc24/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/c87a440e29ae387f600cb6ecce3caaa08557f4f0/
     powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7bcdc39b74d9dc489336fc3a8b3708dd309c497d/
      xtensa |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/3e3b6711d896081b31195e35f38abd764e32c451/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/6055f92ef5620d63044befc37c6341581df30807/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/4b27b852f9219cb22d1118faf3d0fd77c4c587d2/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/271875422a71f17ad4a98e842c6f205a157d70a4/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/dc5d11e270187b72621c167b27dde36bb7c151aa/
        sh4a |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f2d0416b698830011f80e3538b3290c287e1d3de/
        bfin |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/b950655261421ecf4dcd3aec7ac3020b1f31cf5d/
     aarch64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/1d3fea5451be4d452abc6991981e76031def6821/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/03a9ea0fba502ed01cced948596687c61f4a654e/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/e27e5af55a1dada3c13411da00abb2e732d1df41/
        sh4a |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/49d9f404f56f9d833134a9926000ba970120f124/
        mips |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/63b4385579989721ed722e47a04fa26dd2ddf40a/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/0302f3f6db4841b7c98efccb1c93c3aee259ed55/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/53631f098b5f4fd97da5d38479b1b44576c4f25a/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/35744f5403fac344ba571b5329f3eb2e4f3ad1d2/
    mips64el |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/074ecb8f6c20351953a22d723c2bf7c34ce01610/
microblazeel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/736b8a42ab07cb30aa63cdb0ed8e1199e2927df6/
      xtensa |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/c3d83e29528d75214511dab6ac96b96c964d6300/
        i686 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8fd06d66cba2bf65e5ea42034168add660c24007/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/4faa3dddf4cca24fd97deace84fbe51c9108e95e/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/15c6690377b5b581f0d21fc2ff26646ab2ec8643/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/38b7e161dea7a6991b9406507b47f0e390cba5cb/
      mipsel |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/5d1393101173cdb3e0f6c6755d77c471364bf721/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/a249058b5abc8fb0edb2b689383c0a3fd90f55cc/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/2155c7c8de66cd42e3689caa1568e4414a4c4c8e/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/195d8f653441a159b0e296ce9c6aff5d78d7995f/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/1a6e17a921a6c595402933a03763255230fc9363/
     powerpc |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/f81b6518dc62243883561043f1532e1b112689de/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/7512665bfd95ed6c1acafbea5469ac230c68251e/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e6311124d46b03936a1f2cd7a2c7ff663fdf2055/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/71a386307ef447ee18f4a8bd07774591294602ac/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/80e47fa18cd12c41eda22c07f8f3a7f5a86a80f1/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/fc1ce7bcc70b10b34fbd8bf1447a702e1e5ade7b/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/4bd32d7cd4b862bd2f1ada8fe3b1b5d7fb03cf11/
      x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/2c4fdef1da1802932e81dfbc784fad75b7977aec/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/091cf2fdadb85dc685cda822371db0caf8995235/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4c0f3a7f4666d6c9ed4e1575d26dade60006c8de/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/63fdf3efce8b0071ccfb447948b7d6652d7a90a2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9e14b6838aeb4918f2db4122d6272f72889d9243/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4f92d1316e786d8bb3c16b748f1ab731562540e3/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/cd27de7e9f6e237fabd5d6bd5d1c611202497c16/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5d8e447f794f4f18edd743ad47630330093c9214/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/0ecc771b705484575de055da25786e50b8a8b068/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f0b4410701258aeb793b16407a580d525cb3a274/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/26234b5fb834b409414cd1d5c97e2be2f4fe40b6/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/76f5e2646c81771dce3409bbe5c1792f08ac0267/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/113f11644eb3287aad68fe18864d8503a1c55a5c/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/4f25f4a83baa8f0d2223de99451877ec9b5ee98f/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f9381a8a23d0dc4fb291b93a2a965b04d92ca4cb/
       sparc | tvheadend-66e5d277a59db723a... | NOK | http://autobuild.buildroot.net/results/363b77421605d33524305f0b4ab2a92ac56fd5c8/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/8aa943c2cf69984721e3b83109c7d07b7f3943b0/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/3d01151259e74a89748448c2abfe95f03ae4ce6e/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/1cfb06e9c3f94775b0c36f2497f6a8c3957a5310/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/2748675bb7755c7d426cd3542061796d5a99d3b7/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/e9943f3a57ffcb8eb448ee0deef666e211c95852/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/0cfb4eef271feafbfd9baf73f562974dc58701fc/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/caf51e004c311a586056e285b77003cbff95bbda/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/f5dd5c1b9abd7e1b274b79ee0732fd171cadf95c/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/408ecc46287a8b54e30a4bdd77bf180f67704b66/


-- 
http://autobuild.buildroot.net
