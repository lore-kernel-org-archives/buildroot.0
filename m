From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:30:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-22
Message-ID: <20160923063044.760691027DA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-22
================================

      successes : 117
       failures : 76 
       timeouts : 8  
          TOTAL : 201

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 21
               libglib2-2.50.0 | 11
               wvstreams-4.6.1 | 4 
filemq-e59951489045825d6fc5... | 3 
                 lvm2-2.02.165 | 3 
                alsa-lib-1.1.2 | 2 
               audiofile-0.3.6 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                   glog-v0.3.4 | 2 
                    lftp-4.7.3 | 2 
make[1]: *** Waiting for un... | 2 
 make[2]: *** [all] Terminated | 2 
                 mesa3d-12.0.3 | 2 
                     vlc-2.2.4 | 2 
                   assimp-v3.2 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
         docker-engine-v1.12.0 | 1 
                   efivar-0.23 | 1 
                  ffmpeg-3.1.3 | 1 
                   gperf-3.0.4 | 1 
                gptfdisk-1.0.0 | 1 
       host-erlang-rebar-2.6.4 | 1 
                ipmiutil-2.9.9 | 1 
kvm-unit-tests-682187afcc99... | 1 
make: *** Waiting for unfin... | 1 
make[2]: *** Waiting for un... | 1 
                    mpv-0.20.0 | 1 
                 opencv-2.4.13 | 1 
                 opencv3-3.1.0 | 1 
                    php-7.0.11 | 1 
                  powertop-2.7 | 1 
                privoxy-3.0.26 | 1 
                    qemu-2.7.0 | 1 
               qt5base-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
               wireshark-2.2.0 | 1 
x264-3b70645597bea052d23980... | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e9a141dc0da0e5308a0eb49e4c9ad5ccba96d8c6
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/cd3cb958b57f22f161b0b4b74d28f88be9a0996e
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f4947ec7c9c5261e2f51f4ffb0e8c179a473a7dd
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/053bfc90e0fa031b50439d59926b2984f0a17a05
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/4b920d5c5a6b2844558c1ec442ed9fefff207d8a
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/f9def1dd22774f19a556e3f02ad52cbca699346a
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/73c94052d38813928d48a8e44e98cbeaad487f9b
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/081ba7bc80b90573c53b32793ef1fc057fb56cfc
         arm |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/0004072634640f8aaceb238f361eeaa58f466c68
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7b9e365b14126ab94aae95a6ef70b664c9b45f99
microblazeel |                   ffmpeg-3.1.3 | TIM | http://autobuild.buildroot.net/results/e36b9e4c358b5b7e0d08a5e0e1cd9a65cf3134da
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/ed260b80d149442b10b707f46a718d81afa921a0
        i686 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/8cda40ceb6edb1168693cc0dff129397cd0ff979
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/6ff1cd565a0b9981ca9615dc9d133cb3a96f2f1f
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/8e7b436e8e357e9f5a8ad8a2e3a3219430e7cca1
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/4a45197647ef8f0156c1c17be4e53351634efd60
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/1a08813c47620baa36f2ba71b62ce017c266b13c
        m68k |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/c479f64a67862a92e1865d3b0f9b5fda61a246a4
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6d7f66fb58e7c95921e18243892327471d78a7b6
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/b5f37829d0dfa8d56da6038e932123b0a48a151d
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/b34f4125a6cbc47e1047489c1c929b5b52c9448b
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/dbee054e46785800225dd5975b0b78c004347b59
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/23853ba5b54fc5d9735ecf974f21ad81eee6105a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/26e51dfea821a6011672e947991668a411aa90dc
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e406a523c31701165fc98ac013205bc47db6e451
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4a24b4407e187af17ef171ef4b6f74c6ffe874be
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/300746e52030f64d41b31fb09893918a44617220
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e80b7d22b771bf4679470558b887d3344b7e2e8
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f0a1a9e5865b0cc953056fcfdc4b73fe3d4f9dd4
        m68k |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8322fe5e0411300402bbb078635b3f396d86fa48
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ddd441c57dfe3ec8e3fb6b776e8c7e6c201e2264
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c6d637e000e27f8f3af64ab414309294781e871c
     powerpc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a9a1028852fbf84a2d3b8049027c2c015e2a46fc
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e566bce14f9fe0bb6c81a3c22f5d75fd8a1f3af1
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/0f884b0fddfbc38e69d0e3154e2db40b973c793e
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/9c1fad21c4f19785edc7f48dd85d3a923670ade0
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/c09881497d66db7b2460d019a8782ab54457c3d3
microblazeel | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/de88a4de849d6ccbd53aea3d5f6976b76a8fd1d1
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/9244f67b3f702fa0224a7f279ab2988ce6e900cd
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/e68437e29f2f27feccfd92365ab92d479b7c2b5a
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/86be841db1dc27add1ae6638bf6abe6636ba8f98
        i586 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/4e1724fb03190597089070e687d59298b3917fa0
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3a654f1ec98114906b65bb1a0387aefe90bcaf38
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/58bfc2f507706bbaa69bae4887499e368381df08
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/0bd726b0330acbcac53b49637b9075740e93abb3
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b9bfa7711af512ae7a716bfbdfbb44e957f08377
        i586 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/d7707a55c2110c6649e1c6a1c2b8f1f014e4198c
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/71f3b535f2eec9a167b817328d885e835098c145
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/ad80715343da8290eadaa276f5c1534fbec1f582
        m68k |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5c63959a89d5761fdefe3bfd36c8168dbe882dc9
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/44eef94c0e46b00233e1b80c929d844d08ea846e
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/bfd5830fb6a22b8c9c803ec04ab0ab15adcd83da
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/a394dfea7ab59225bbdb699772d07a8284bc939c
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/9009ebfc244d93347ff2312a559aa277804eae09
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/205463c9ea8651911972c2835e28ded1912c811a
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5e9279ee60c11a3dacacf6d78f87f8d1b92968f5
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/97043f8defd5a59ae39b4c7f095a10d15c7fe632
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e775126d5939093289b1a833dd6323ac293322ed
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/17cb4aec34523e6588e790bd621c5da4d3b7b3ce
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/246d6a5c443cfa522901a53e9df344b4d5a9e653
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e0c22d6441dee4e30329eca40d62b189ecdcaefb
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/70e11faa026cb97fd8f6ac283d6c22b58c9197f9
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6d8e2349cce553095f4ff98c6fb7ae7a8de206dc
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1a1b9009f563bbddc410ca124fbc6a367b12ed30
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b9a0827add284fbcc6de4753429598ac2d3f7ee0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/09cd4c616ed79cb89f20ef40c84351c655b1dfd2
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/146e61a721741b694817f84099f3d544c8da31d5
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9bb8512ce3842c2a43e7b74f06651da8feacab19
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1c0783256aeb73e2a7e55a5b89e285f7db073584
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ae7c9c088d627aad75313995d0297fa9a62d4196
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/28f9b09bd375a5f9c8434140513f8836ea987f93
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d12c54992e09400631747f9ea14200404d92c5e6
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7e3ae63a17ea21b424cf40f254ebc41dce65e6b0
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1d817bbf2e63763b044cf9eded841f3cd6625b33
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0749019cd59b28c7e532c83227236b06c64aab07
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/520f173a38db074a910cd2b8a6a8e24064bff706
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/bf789d5f571679d12f3d3bf8aca0a503c9e82f86
        mips |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/3e1a12f2d4bba65d21258ba6bee7513bea9415bf
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f0166f030875ecaf0d757790de6361339071831e
microblazeel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/32b4eba8c7cbe8a3b1cde2d67f1af3f913fcc292
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/38fefa126596c6e267ffaf0f2dd9c5e3dcf09aff
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ea223c8a4f817541f55aa36c47b159a316031bff
        bfin | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/f806cd7e3943c447aaf7e30a8a9570bcb73490e9
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/b867a8a0640006a7419fea9adf1f379189e05ba5

-- 
http://autobuild.buildroot.net
