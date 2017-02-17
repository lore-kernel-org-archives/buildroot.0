From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2017 08:28:52 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-16
Message-ID: <20170217072852.8329420B82@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-16
================================

      successes : 216
       failures : 53 
       timeouts : 1  
          TOTAL : 270

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 9 
czmq-5205ec201e97c3a652c17e... | 4 
                 glibmm-2.50.0 | 4 
             alljoyn-16.04.00a | 3 
                    mpv-0.23.0 | 3 
                 qt5base-5.8.0 | 3 
               bctoolbox-0.4.0 | 2 
                 wavpack-5.1.0 | 2 
dawgdic-16ac537ba9883ff01b6... | 1 
                  dbus-1.10.16 | 1 
                 enchant-1.6.0 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                     gpsd-3.16 | 1 
             gstreamer1-1.10.3 | 1 
                 jack2-v1.9.10 | 1 
                 jsoncpp-1.7.7 | 1 
                       kmod-23 | 1 
                  libcec-4.0.2 | 1 
               libepoxy-v1.3.1 | 1 
                  libnfc-1.7.1 | 1 
                 libnss-3.27.2 | 1 
make[4]: *** [all-recursive... | 1 
                 mplayer-1.3.0 | 1 
                 opencv-2.4.13 | 1 
       opentyrian-9c9f0ec3532b | 1 
           oracle-mysql-5.1.73 | 1 
                 qt5base-5.6.2 | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.6.2 | 1 
                  samba4-4.5.5 | 1 
               skalibs-2.4.0.2 | 1 
                   slang-2.3.0 | 1 


Detail of failures
===================

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cd963404761070623489ee74df3e69f5052f40a1
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/99e6e01f0d85fe8eb5d9b09fcc3971b577c9ba6b
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e5b471dbb91ef2a15844a9ee6d1a83a38f7cc07d
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/bd4cca6e7706a68dd6c16a7bb409185c9f006a57
        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4118477ac02732b99b8bb3db8bef43290edbc5de
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/9d0cbb045a21d6b97d33f791c90eacd84198dee8
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5179aade1ddfe3975b17f49b534e84ba1a55bdab
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/9330594ec5870f255edd8a2df81052257d228cfd
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/0b87eb16d3bdef25e618f5c54181d18a465ef655
        or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/81047e13f4d7896abae1036e098303e6bf68a0e7
    mips64el |                   dbus-1.10.16 | NOK | http://autobuild.buildroot.net/results/2a4d8539c2a325eec5ade5e06452294e32cb12b7
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/70d72b5e767965726a1e5eca437f3efc4af92c86
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b7f95e39d5b6984594fbf1e7549ddb3cf281600c
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/774a8dd489760bc213ac7cf3e8040cee6a4e2437
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/80aba6b26a21914197388baf73ada4b79952db13
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a2bda0553eff5e415e622aa7a38763d838ae43c2
        or1k |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c24dd55e773167be182f40ae723e82d3f71c6eba
        or1k |              gstreamer1-1.10.3 | NOK | http://autobuild.buildroot.net/results/717d78ce0935749f477bdf3133b6f20057a28c01
        or1k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/470eac9012c5a551ace8079e1bdb3ffbc5a73c1e
        or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/8d5145eaca2939206b88ea5abfef9bd11fefca69
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/aef1b915ffd3e5678af8682727c22c5618edfd89
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/e7505f36d7c2cfaf7527515b2e3014c2e8e2c5ca
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/0a266f54e2938f7479232b7acec1834250f6c064
        or1k |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/d8715a2b3783d877edf91bb14a80d36eac749b36
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/638a65453879777a0d5bdb29231034cd261b41c0
microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/92c165a970b9d8912c5ca50ed3567478cd2a2b3d
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8ace02ec35eaa691c65c95240ecf7caa8137ea70
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4ba59ebb2cd16ed7e70c67e89f5f80c5b803d3c3
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b97341c59b9c6f7dbdfe59cd770e0c285be8fa06
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/741535d8d9c75acebeff96679d4f1ac6ecbc5f61
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f
         arc |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/89864a1cf0d8b27b3efdf3c36ccb3244e88a6746
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e9ff38bea523df79331de3004939ee39b446d723
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/a02c4da118c2d0f90016c5e3c8877782d6882f96
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/116931f17c4eb4977638ca0392bd6024e05d4ff9
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/41a0559f0d3c760ba9aad77dea4ed43e25b63ac4
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/8f55bdbdce189c14baed772bb74eb41a0f8ce83c
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/1fd4195d3e941f4963a1957e4194b4e05e7bb909
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/48a78b16a63448e1ac91efa7ae0ca77b2b9dba49
microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/d4f2f7381e1313758816b91aacad664240a2beac
        or1k |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/8cf276e18d935fe03059941f56786bfd210b700d
microblazeel |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/716eced276823a225c30fd2534d88bfe0d90ac33
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/28c76e4125134b729f99099c3a53c1dcc55d0f12
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/558fd8acb31afd0a57c0c01020f73d9ee17a7bd9
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fd599fd32ceab165a4926044e42f543c03179dec
      xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/3bba96405442dd97bdecfdc7865e4e13927fd327
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7e96654503efcc79d386e13e23c21031738d493c
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/bd4c8eb1687713062e5b1ebbcde7f464c13779f1
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/59f8410ba54e6ebbd7b65fd36f6b192a11f1262a
     powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6ec46927ce16cf2b159805872ebef363c75e7551
         arc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8005ec840ac748970f6c4d49a3b5f1e2f1b69adc
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/2d31a3295e51c5866fedae4adb0aa464e5079987
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/e240455fc0bc6141988b5e1209f1a9b85b016361

-- 
http://autobuild.buildroot.net
