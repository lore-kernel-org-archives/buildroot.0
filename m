From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-10
Message-ID: <20160111073022.2CC1D1029FB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-10
===============================

        success : 223
       failures : 143
       timeouts : 1  
          TOTAL : 367

Classification of failures by reason
====================================

                   assimp-v3.2 | 21
                  libffi-3.2.1 | 19
                  boost-1.60.0 | 13
                      qt-4.8.7 | 8 
host-vboot-utils-bbdd62f9b0... | 6 
zbar-854a5d97059e395807091a... | 4 
                bind-9.10.3-P2 | 3 
               linknx-0.0.1.32 | 2 
                 mesa3d-11.1.0 | 2 
 host-python-setuptools-18.7.1 | 2 
                rt-tests-v0.89 | 2 
                moarvm-2015.10 | 2 
                 mbedtls-2.2.1 | 2 
               trousers-0.3.13 | 2 
canfestival-7740ac6fdedc23e... | 2 
                oprofile-1.0.0 | 2 
                iptables-1.6.0 | 2 
                    ruby-2.3.0 | 2 
            shairport-sync-2.6 | 2 
             bluez5_utils-5.37 | 2 
             lttng-tools-2.7.0 | 2 
          libhttpparser-v2.6.0 | 1 
               libcap-ng-0.7.4 | 1 
                   slang-2.3.0 | 1 
                sysklogd-1.5.1 | 1 
          obsidian-cursors-1.0 | 1 
                python-nfc-212 | 1 
          chocolate-doom-2.2.1 | 1 
                   libndp-v1.4 | 1 
                libcgroup-0.41 | 1 
             host-nodejs-5.3.0 | 1 
                       unknown | 1 
           python-daemon-1.5.5 | 1 
              rabbitmq-c-0.7.1 | 1 
               libassuan-2.2.1 | 1 
 make[1]: *** [all] Terminated | 1 
                  ffmpeg-2.8.4 | 1 
                     rpm-5.2.0 | 1 
                pinentry-0.9.4 | 1 
               dvbsnoop-1.4.50 | 1 
libsigrok-fe473123ba836445d... | 1 
               qt5webkit-5.5.0 | 1 
                 ipkg-0.99.163 | 1 
       openpgm-release-5-2-122 | 1 
              alsa-utils-1.1.0 | 1 
       directfb-examples-1.7.0 | 1 
            netsniff-ng-v0.6.0 | 1 
          sane-backends-1.0.25 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
              cryptsetup-1.7.0 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                latencytop-0.5 | 1 
                   erlang-17.5 | 1 
                    ofono-1.17 | 1 
ti-uim-c73894456df5def97111... | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                     vlc-2.2.1 | 1 
             util-linux-2.27.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                nodejs-0.10.41 | 1 
                  samba4-4.3.3 | 1 
                 synergy-1.3.1 | 1 
                   gvfs-1.26.2 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/5dd2a774a6c7eb99477bb561c871456aefe7b7db/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/55a659cfabfd3686b7d4d119ffd74f559c30b745/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/27b1764fe8d022b36236ef8eb76a30ccfed2c883/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/77545306dba369c913a312f84832efb759737687/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/fb89da8d29ab866380a9d27e29b9a9caa76437ef/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8af1148bdc4c85949584bd08c4b046c9ac1fa8c0/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8da5ae5b67f258ddf6838ab7a786a2577b52294c/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bdee6a4eca0d96f420cbb80cc1f35ec166fc377f/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f8832b54e183cda3b28934732453f2e3bb14f751/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/52febf1a33c4408d57f1fd69c07dcf5ff36cdb06/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/de4be678a0b8ce15393e3e6d5274ec095beb896a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bab08e7519a13eaaab2908ff5bd288e2940fb165/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6b87530c7cc4c03359db7815a22ea992a4740ec9/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6001f05cf8df14f1bbc2bbe498a2062864307b95/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/98182d585b6797c761ccbf66000986c50223becf/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/72c01ffa39b48be6213f6645e920baec4c3df369/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/886fbb536711359e99776e8b91d20a427419e251/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e3421cbb30c040ce4baed21822595f8b96d78fe5/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/50071cf8cbbff1190ed193ce5dc9ebdeec57d3ab/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a4018ea6827595cd7c15238bdf3a801d029e95a1/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f441cd0a575ec81fb940c1e884b9f0517893676c/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c0c79b21bc49be9c01193d9838a7e1fd3134a4c1/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/816b294924379e36a3703325c8cbd7ee197a8434/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/3a04f35b5569fd8d34259006a01d991bf6ca9258/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/654475b9e8b98d01abd457002639abb11676be6a/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/7e5d0ee1107a053b05d47aa7d57fa688512ff62c/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/12dc0288bee2665593b38740e21ebc1cd08a313d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fe4bec4bf5ab4580d7f675e35b1eea97f55cd735/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a9d15e52167de65530465dd55d360c3df41aec2d/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/984afdeca1bd8cc080b257a468aa7a4ad3111622/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/540ed26d33d10e6348a50653b3d6af81d988e5a0/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bfffb783a514dbd0bb68bb0d05513f0a9a5260de/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/86656ff563077a6c50cdcd68100334bd0fc17a1d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/38a8e576d6f0680166cfc095545d8402fa78380b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e74042e7f45be0834a94357a172485cbb0e3ee06/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b5a667f49d9ad9652f3ec0b04cb6ff4abb3261da/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d02a71d7b805fe35002760ea4aaa51c3d65da41f/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9cff07c6eb7f7410ddd2acb6e9bf4c8936dccf38/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a8234b06de6817f9a9417bc6f8e2464524806344/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7f50885ad87449b872f1e4f94c054d8758e874c8/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d5916094647f9bef889163f335cbfcd41238eb1a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fe4245b0432f42537ad2daf923de5e270e861664/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/de848afe6a93ae820f0e74f24242bec76f30835e/
         arm |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/8f01e1641d7ba74d893d311578e8d376c42cd38f/
    mips64el |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/1cb647307e9455c2ca4f1a0faf0675c091905193/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/da7b376968d4357b11bd8fe1ae481dfc972636f1/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e5417728739af16f57b7a1c6fe0806a7325aba65/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/630b465c85a6efbcd07d88c3eca0c0378f59fefe/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/2fb352da6824d05a48cff85c400a06e10eae1d7e/
      x86_64 |                    gvfs-1.26.2 | NOK | http://autobuild.buildroot.net/results/7308a7ea4c9deca572429886ba37d61fb988105d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ca58f346c90827a3822cc335cd5d4cedef216412/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/5d2d37af922016a5e13943b2e493c40b813db145/
         sh4 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/6d5c87f49ae8174e446a5f3708316bf0f0bd4d04/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/8a6516689cec86aba1ffe65313a1b2d0b961071d/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/01e94158ca3d3007cc01ce61249dc7971523fe9b/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c2409ff92e5384156865b266e91f9f5e524b45f0/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c4528158e516783f163f72edb389011839fbf65a/
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3b2591702330649febc2044a2701e0f4e4dd04ee/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3a0727ea1acad7e8178809f5ec50eafced773b52/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/348ce8603d384bd3ad206b9d080648384ebb90be/
        i686 |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/ce2fae7894152a484d3e4e18ace61ba5f5487bce/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/4f904a2913984201ad0bffb63664019c73e0eb77/
    mips64el |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/88a857ab4a156a5649f54807d61283e1b1e54ce0/
         arm |                 latencytop-0.5 | NOK | http://autobuild.buildroot.net/results/1d43870670ba087fcf3ba84cd988828c33f2664d/
       nios2 |                libassuan-2.2.1 | NOK | http://autobuild.buildroot.net/results/5e1086d908658dfdce2f43f75339d896cc34f92c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/39cac175b4a680402b9ae0da67ef630d77d63000/
      mipsel |                 libcgroup-0.41 | NOK | http://autobuild.buildroot.net/results/ad307b1a1d7cbc88c5702f2c88052d99774cef79/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0bcd159f89865a74d3c3b4f7d2f803ee60a787a4/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/91c0ae055a50d0c7660e572cbd39860ffda74dd2/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9daf0814433e6dfd41dac5c7fe2934aecb0ff451/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/80138c894ae323e854e32d004a201024e9ee91f6/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e880c64305f956b161af5aaf0e53777b09c5a5e0/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ea3537f22a7a348b1dc5139758133c0c45170011/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/948dda5e49d573d990da1dc27db90b3de1a3a9e7/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8eb14e14407c207ca8cc7e475f1a22cce8272817/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7375849ab32b86a3c931c44ffa57c81811757f15/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e97a3f3b77697805a6dddf466832f32c45d98fff/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3780ebf2b7357f478b2a3f0465721f24b27f3064/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/484d292e175ef382948e1098a771358222e3a480/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/78dcc6a87906130203b7a2cfc1f2030ea08c19a3/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f92d68fcc4b7174e07586d73b0f6e046a99aa390/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/744f637b1fa196e7ce7d73a5fddf2df2c0c33aff/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cde8f282c692d8e3707b378d5bfb3a86555109c5/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/51dad60c60275b6234882dc67f3f493e3dc4c5b5/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/59868906119d181d1b78578db4baea1fe8e0fb72/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/733d4cd3125027e90234b90a5614d9dbf3dd78e9/
     powerpc |           libhttpparser-v2.6.0 | NOK | http://autobuild.buildroot.net/results/701cfdc69989f4c80ceed196af079e2e56564947/
      x86_64 |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/3a22f8bd0400dabbcd7b73e8259a27e4ab9ce687/
         arm | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/afcea2068d5b0ba707aa90339401550602103ca7/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2f0a98a36b02f2da392e4a3d02a6faa3db9783d1/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2017df23e4a7805ee3fc4ca0ed7e44d4404221fe/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/dbac262c8b0c85001db4411bfb87facc80d1f49f/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/1c3e8206c27793d7aceee535be06661e113a4678/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/5b72d8966a4124487160ea5d72a447d78d969e11/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/42742e1a5cde80160d331948c79c44bff6e76f6c/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/f261f056540e73abf96171add25f5ff483e558ac/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/064abcca885d9f96561752fe32b4d16b2931602b/
microblazeel |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/8d8892e7cb4b79461ec05687c951904a894c8cc2/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/9a358c0d2c15c37bdb394dc0102657438188f6e4/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/e71e6cec75ed6815ee8902d66d95a3ba658bc506/
      x86_64 | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/aee411047265bf205f8990a3d0d2310decb5fd19/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/af018efa530c76800c25bf47d7d9c9231d7266b9/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/b61029e17b94062010ead93cda70153e08f87844/
         arm |           obsidian-cursors-1.0 | NOK | http://autobuild.buildroot.net/results/a4d0c28f70c4d2af5448cd14c21bd3557fbf8119/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/d6ad4965d89a52754cafde4ec94a3d0b3613457c/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e1a015f420d8d22fe036c919c1af886385ebd712/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/6d5f964470ffd491cf52f5dae6f66d878414d394/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/df8c830ccc2f97598010fe9490196057beb0b9ac/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/2363a005e5c3c360e871b3f162b33306a3b0b3d3/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/be0391717fed0888213d9b2b1e841ed462780afc/
         arm |            python-daemon-1.5.5 | NOK | http://autobuild.buildroot.net/results/d59d2e39f88affa081e17a858be259d20a33ffee/
         arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/fec30644e064ecf0f06bfdf1459ea6de8b33c995/
      mipsel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/914b424dd1a91b100abd9791ae4dcee76981773d/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/984ab51cee2a7f2c0a21f956a1541642b370a8ba/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f3718a426d96cc59941ef4be1a4ab978d1e384bb/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/96e2eb9f736184484e6e048a445265d470f7318a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d5e2d06b00a09a00bdcc17ce554bc173b1c3aee2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5bc79ca9eae4db31e3e680d603d396f41b5bbf6a/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d46f6fc0935f0e2fb53b637996a6223264d7151e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3cf447a450140fa5c3adb57fa0f0f1f44f6b9ce7/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/78d05cbbf3f9248e34a28b29e30da5d028e1d13c/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7bf36892d8004e56a83543556e94ac96a1c40b02/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/6a2e18297404c04cae9d9387b89fd8845d271493/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/b562694bbd206fb20337ff987b5e03ede57961cf/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/5afc9900819d2cd7dcda90a0e86713b0b0d3e3a8/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/5c583279b05de71767b9a9663dbeed8073f3e343/
       sparc |                   samba4-4.3.3 | NOK | http://autobuild.buildroot.net/results/b80cb10f5c541cad510d1685fad7781ed972e0a9/
    mips64el |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/33871debb797c2e9964eb18e66a8bc5bd0817764/
     powerpc |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/87adf1081a855b7801bfa3c8a8c68ffe1e009959/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/71003d05bf8bfceca9727466b9264e9cf2a1b59a/
         arc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c47f5d5214931d2c0ebd7f7a4092bc68f6f80ce5/
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/f06772e7fabe64d02995b1297bd568997447db81/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/9aca5bda483a3dace37e7a4acce1559e66a9fa1f/
      x86_64 | ti-uim-c73894456df5def97111... | NOK | http://autobuild.buildroot.net/results/13d48eb52de615d99691e4eafba7279b49a9ed24/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0f0824b4e3ccc474fb7689c71e955912868b599b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ad88fcde881969d9eaebf5bfa172743cb1e8cd94/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ac1e671dcd66c3823cf2e289604ed56f14f7161e/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/c04d8493f0a7cb5bf1dfe6bbbdd9c2cbb8218560/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/00de03124f33fc964911112175bc8cfe8052e0c3/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/2c1cdde1572121760b3a8c7c2acce1fc66f017b0/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/7432f2a0e14ef0c5d3955c5c28746f86f7404937/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/f990a4cf987c0b49e4b44ef3c33b897b40b706bc/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/3dbf350d8539bcde33f36abdad6476d50ef8641e/


-- 
http://autobuild.buildroot.net
