From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-11
Message-ID: <20160112073021.A88A4102AD7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-11
===============================

        success : 251
       failures : 122
       timeouts : 2  
          TOTAL : 375

Classification of failures by reason
====================================

                  boost-1.60.0 | 18
                  libffi-3.2.1 | 13
                   assimp-v3.2 | 10
host-vboot-utils-bbdd62f9b0... | 7 
                  ffmpeg-2.8.4 | 5 
                      qt-4.8.7 | 4 
zbar-854a5d97059e395807091a... | 4 
                bind-9.10.3-P2 | 3 
libbroadvoice-f65b0f50c8c76... | 3 
                iptables-1.6.0 | 3 
               trousers-0.3.13 | 3 
               dvbsnoop-1.4.50 | 2 
                python-nfc-212 | 2 
              gst1-libav-1.6.2 | 2 
             host-nodejs-5.3.0 | 2 
                       unknown | 2 
                openssl-1.0.2e | 2 
             bluez5_utils-5.37 | 2 
               libcap-ng-0.7.4 | 2 
                moarvm-2015.10 | 2 
canfestival-7740ac6fdedc23e... | 2 
libcli-c63c9d35144939c8b4fa... | 1 
                    ruby-2.3.0 | 1 
                 dropwatch-1.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   libnss-3.21 | 1 
make[2]: *** [Source/WebCor... | 1 
                 rsyslog-8.9.0 | 1 
            netsniff-ng-v0.6.0 | 1 
libubox-e88d816d6e462180f03... | 1 
make[1]: *** Waiting for un... | 1 
                 gnuplot-4.6.6 | 1 
              cryptsetup-1.7.0 | 1 
       openpgm-release-5-2-122 | 1 
                   erlang-17.5 | 1 
                    ustr-1.0.4 | 1 
                 lvm2-2.02.138 | 1 
              pure-ftpd-1.0.42 | 1 
           linux-zigbee-v0.3.1 | 1 
            kodi-15.2-Isengard | 1 
                 setools-3.3.8 | 1 
                  lshw-B.02.16 | 1 
        ltp-testsuite-20150903 | 1 
              alsa-utils-1.1.0 | 1 
             util-linux-2.27.1 | 1 
                grantlee-0.5.1 | 1 
                   hostapd-2.5 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                   mplayer-1.2 | 1 
         qt5imageformats-5.5.0 | 1 
tvheadend-66e5d277a59db723a... | 1 
                     vlc-2.2.1 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/04271cf9d6f7d801cfea1baa40b24f26450ad250/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2dffcc97df1c55fffcfe081e5ab848b97ca1cdaf/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/169d028e7c9401497c9bf2e9be927eaa45d4dd6b/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7e9ce68ac29b2678451835d1e80172ca895259e1/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/cf87e18f3606f061ee19eb428aba18b221a7356d/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bb9504ea4def34f5070212a908f02e17742f9bdd/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/45ee44ddf22a84c0f857c54f62fdab5092a09544/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d0e947cccf0e4b5f3fae1b903e462ed7d4fb4fc4/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/35030e233c3709f38e2849622677b9a10626c9bb/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1498c38a6ccc7e3ec622996b1248ce3ab08bf28a/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f8c871eed2e3cb33f8ed5b914a2754bb41d762da/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/c9021ed32325593648b36a97697fb5a2c137768c/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/d69d329a7d2a2d04895ed0260f6db3fb23795871/
      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/2890fa292b101862d0a17dbaa4e56e80a5b3e1cb/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/c5b495b4e4fe065836fc4fdd9a65444e9fa0dfec/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/904801fab7c6e03aac229da63eedc3638c23f489/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/106e82c5ffb5841ff663e46eb7c55aeb03a954b7/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5d70eeeafbad8b440fde6d092e5a97a5760e977d/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8b59c95c6448a20326b0b5e6b769bf625be51707/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/68d46ef845821b3d419755d2fb6493247d35cd42/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6d79746ea9e3fdc029ea9c5410c1c081fc90e3c7/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc5cd691097fa1e1a92142c65005d78fcc14c7d4/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5ad0f0387520c30e1abcddfa514d10fb5ccab9aa/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c8bf19d067516ba5264a173fcd6cc175ef76710c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f59996b1436550749b64b8c70b7cca43b7ced615/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/73c3e47b1a3d6c2b7938ab9b6c054e0e0765868f/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc8504fe18a4865df936be39d6b0fba030cfabf3/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3980762fc86281fbd7bc865dc8ade6f07ba70286/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/82103d70d6594b63acd319fbf3e4d0552da93b4b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/00f252e2995970464c0a263ef2bc09446d7af5ac/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7a1f41bfee1e363597ec842abf2850e981c02578/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8c55b9e700c01d2798f02bd9b8d7cb0da374e583/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9456d6303f325ce95c6f38c02aea74a99b2f0f19/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1f95460df4d9aea19ecb931562d84418d4dbf824/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/208befecef339ffffc08774d8b1166e61cc0204a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a2244ae466dd948e15d13f14add0db8ce5f33551/
         arm |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/6816fa21f19149515dc74869b8f435eee24668de/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3d6e24504b59dda7bee5e374a055156e5882714e/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/7aa90508f84d47b917a4f250500c790fda8d0dbc/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/3ca7e8d96d62dfaef32aeef8408878f193cb2471/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e8f6d8014ca2ea335fff207832021f6b36bf797c/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/b5b9a14afd5c9d0406ad1f6ce33cc90f472f43e0/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/410484fbcf31f4cfb4d1c55a3c5b19dd2dfaa502/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c00788e35dbf336205f49d24deda3b07a2d3e720/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/10c80eebb0acc3f5efd17a16256f9a43d1d6f471/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/2283d8872fcd34b783b5a7b10fa1b21a35c01fa7/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/698663f7d0e189038511ad73f2e80f74c7630564/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/60dc8f54e0f16751e5205606a20e2d6c24cdcd89/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/966b1e05a8b8acc4953cb459e8e291457cda9e8e/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/b3015675234255cbc7804c42f06bcacee2cd2063/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/276db0da2a49ec21f15bcf3f9d3af2b43e936804/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c138713d1fc56acd94db781f5f7a01eb5a007d99/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/c0b822e36875d3e50a1227a51acb2aeeae164157/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/32e161889abfa5eb1a8177b76c6ee20ccb0e01a1/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4a9c15509bb514e4a2ca85a925d7dc013551ad36/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/972a8b54d9f71cd9fdbfc64cfcf419778b59eda0/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/83cf9fd390bf4089fdd1330158f1ea6dce099969/
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/39db31c4cdf27a4d9e4c83628862d29ad220744b/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e6eec94ff989df1d803123554d5398975c801e89/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/efe20198fb2c43bd0cce1ee7a2e500f6e092e289/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fd8bdd764e090501966969ceb7cda619fa4a127d/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/7d24115e4b041131bb3115d7da262786173d43c0/
     powerpc |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/0bea27b96d16b51059593c93946d14b172281844/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/fa6eb777f799e9e6b285cdbef55dc17cd0ede0d1/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/65c7d47fdc0f55fb8deb77e34063320e2af337ee/
        i686 |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/20fc74d13c745a34864e1addf93d89ee708babd9/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/22f3b88646c7284e22634b0c4ab28eb77a792030/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/92103f965e584b3411b783e7cfb0441fb5508e38/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/50333b36cd870deb481db2b8e0c3da13a36661cf/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c05ae39755014715a8678a5833c49abc31abea18/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6069894f0d8db76ea54e9831765271ab6c051f6f/
         arm | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/d317f4722a839e97ee41a96df6ad32de45cd3d01/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/71468320b0efe4f3621c899fd4cbba61050524cc/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f7bcde9d7e171a1833ac64116b518b5908f89fad/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5421948297e3750c1ead8643453b8da856d1e882/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/05a264076ff7a68cc129f9e120592e07049ea1ea/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/80f5a40cd646bb830726ade7841746df439bb6f2/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/36e089596c52e82e732841c489e50ee49bbf67d8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f3468895c439d5d52727c3cb335d59f9c3d0fdff/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c22b2035cc43a38fcf8515e5609978eaeb0f2c14/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3cbc3886182a0887b89b65860b08934abec90a21/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b3170ff04f143957b15879418e39fd6fcecd2fec/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dd59e6dce45210e605a5b30e137d342b03dba6a7/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9a1cc937267318dcae66e65018224332f1e84c48/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cdb5d5291e4550e2550b1151c174bcbecdac4cda/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/4be61e3bd93331fc62e7a07488c876ff4056c39e/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/b7012aa3ff4b1f50b609879a975bd7c27e666a09/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/24b87cbd9ff5617b538b7125943313502a3cd2e3/
         arm |                   lshw-B.02.16 | NOK | http://autobuild.buildroot.net/results/aa3abc215b7a4e95b60be9a635758d8448e4959f/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/6134dd96976823c4e3c448b2dae52afdb2e7144b/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/a4aeb25afce0afd862440c6717b2616c505d80d9/
      x86_64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/6d227aa80f6b8f29b406a41af7464e8aa622c7db/
    mips64el | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/5c573f0f1b7a5ed87c3e51dae4d0b6b8002cc4a7/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/baae22ab357328d04d8c5f5424c6e3663d01c20a/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/e69e0236c8ac983c8858bc9c163e43ddd13c4c96/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0cd5e8f465507176db0c530abf3b1ef3073bef2f/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/2e5bb6be6262c20c5241d9b46487c31af168f837/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/40a295739558a78370889e8a743b6fe9a9ca9a3e/
         arm |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/72d81c551ff58de59877b56915decd2741daae48/
      x86_64 |                 openssl-1.0.2e | NOK | http://autobuild.buildroot.net/results/8160c6ca1ccbe88e5b47713a087580c363080e87/
        i686 |               pure-ftpd-1.0.42 | NOK | http://autobuild.buildroot.net/results/6af0ed5f434f3507f3c5f8acb2d6584c3f3aaed1/
      x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/bfc4635e68cc90ff0ac37aeabc27011148b22b17/
         arc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/63c6f369979b2e809be98e9900233abf26daed49/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6abf14dc7b21bc4b604fdf4ccfaeec810aff37ae/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/38c456dac7e67c39c163b593a066812adf95794e/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5df2615114c06d45eb4b4f979f021137f3001a0a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/702956b05618c7eb85e15f06dee82e80824bcdef/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/202b9eeb56fc737fc06b1fd3c9e9d63c7cb4c428/
       sparc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/670d18f4fb4b9d95e71b519ad1c71e84d4ccd762/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/b42394c6cbfd8a82a9c33ff05de16cf755f61839/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/0876df7f93d6e6a368e28a2b18e36933bbf10e0d/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/28ce767f2a0ec81c2b8d2b1f3941f198e6317346/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9b3f87bc854beb64aec67eb27ebeb1534be7e251/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1adb956fa807fb7e539557cf91f9cc6da7adf783/
       sparc | tvheadend-66e5d277a59db723a... | NOK | http://autobuild.buildroot.net/results/7a045cc4b0eb9a693df15a23b12c4a8f58b0d1cc/
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/1f1e4c5b51e7468e97b86a82f777ce78d81d62aa/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/2fe4bbb8dc2b974cfb66af41700aa9775496f26f/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/26ea63d69a5a4017a0f9712bd8eb9ee0111a53dd/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/a64f2cd2e231636c5d1fa94ea7281844604f9889/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/3acb98b1016f99ccccb9897df44b8cac908ced3e/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/0fe18778dcc73f496698c2fbc8074c3e690d5158/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/6bd39821d9485f8511959decd4b335bc05cfd8c3/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/0844cef7b912cdaee5f448a7aa0656dc59586ab4/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/7bc12871520ac9a91d27384ac14962b598ffed80/


-- 
http://autobuild.buildroot.net
