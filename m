From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-29
Message-ID: <20160930063022.07F9610318D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-29
================================

      successes : 198
       failures : 128
       timeouts : 6  
          TOTAL : 332

Classification of failures by reason
====================================

                 uclibc-1.0.18 | 25
                upmpdcli-1.2.2 | 15
               libglib2-2.50.0 | 13
               wvstreams-4.6.1 | 13
                     vlc-2.2.4 | 7 
                   glog-v0.3.4 | 4 
czmq-5205ec201e97c3a652c17e... | 3 
                   assimp-v3.2 | 2 
                    cups-2.1.4 | 2 
                    hans-0.4.4 | 2 
kvm-unit-tests-0b04ed061003... | 2 
                libsigc-2.10.0 | 2 
                     lzop-1.03 | 2 
make[1]: *** [libavfilter/s... | 2 
                 mplayer-1.3.0 | 2 
                 openssh-7.3p1 | 2 
                  squid-3.5.21 | 2 
                     xen-4.7.0 | 2 
             ctorrent-dnh3.3.2 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
         docker-engine-v1.12.0 | 1 
                   efivar-0.23 | 1 
filemq-e59951489045825d6fc5... | 1 
             fxload-2008_10_13 | 1 
                   gperf-3.0.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  libcdio-0.93 | 1 
           libfreeimage-3.17.0 | 1 
          libmicrohttpd-0.9.50 | 1 
                  libvpx-1.6.0 | 1 
                 lvm2-2.02.166 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** Waiting for un... | 1 
make[2]: *** wait: No child... | 1 
make[2]: *** Waiting for un... | 1 
                 mesa3d-12.0.3 | 1 
                    mpv-0.20.0 | 1 
                p11-kit-0.23.2 | 1 
                 php-zmq-1.1.3 | 1 
                privoxy-3.0.26 | 1 
                    qemu-2.7.0 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                    quota-4.01 | 1 
                    ruby-2.3.1 | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
                 weston-1.12.0 | 1 
               wireshark-2.2.0 | 1 
                xfsprogs-4.7.0 | 1 
                  zeromq-4.1.5 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ae779abc7e1044301f360b710d8f9800756b2f38
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e5b759163af1fc9e0e887b8726692c796514c6a3
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/33b49a5e96a942e15124de42af551393a6975380
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/bdc345c6c4f576f0f3bc75958d21d749ab41f90c
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/dcf78375bf65053443bbaff4d971077a6b5d0fe5
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/211f05c1aae872cb88a95d36cb25736b21cc2875
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/545ddcce240fcb4255eebd290bed44ff39cf27a1
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/e07ef34d253f97058958d1234af7126ccd1acccb
        m68k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/383c2d58ccdd9e3c32c44740b6243a6eb8837078
      x86_64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/50985055790f049fb92405d9386a8ed34d7d673a
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ea6968d5d0fd0d8ee64e045e2aa56c8e8a0b7b14
       nios2 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a0d0d21d6a611f2a348b592ab006c0d9f247767b
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/991eac612caeaf237cc8e741e2eb06a58ef06d44
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/486fc065178c71cf311af32b9978383a8d1cfb96
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/38ec0b89cdae6498c6305dade291dd8eb6b2576a
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d9451837e03a2c49c2d086f54e41f4616ca731ca
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/96157cf8f0179a3e4adc3dff939db3fbb5019487
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/22a2afeeef3fb17397e4bb85e490d97d2d17dc98
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/7f4930fd5d2cf480e8e7118676eafd329aa6804b
        m68k |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/f7023e417371346539116f597f48352efbb9e164
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/3240b80f559dbbdf02b982051c50bab5d4678648
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/c42b5368caf286b0110f12f2d4cb8dcf3319ab07
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/81ac790ff04b42670712faea865f8378b01344e3
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/32ab0e10bc24f50bc2497b80a7b139a086cfc1ae
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fb27bf4074a5778f4467d6e6dd64b9aa4af8d014
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/89a81b4c941cc7914333266fb8576ccd3d43a64f
     powerpc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0578f21f2112045c3909d7acfafc427b86b72889
        i586 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0b6e96feb73bf2e398adcb8aac6dbf122a5b2b1a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/dc2ab13ecbd9adec939c338576e5acc63f1c9774
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a00b3b079bfb74d226b5fb7650c76535fbc3201c
    mips64el |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/669e9b1bfd276bdf97c1087f2c1fcdc27fc72e03
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b9f58f772cb9d7db5224fe67ab04f8d6e05672e6
       sparc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3c13100a9906bdfc7b1a9d929aebb5e6ac046a3f
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/74e623fbc55472dd45454a8a54e2e982be5f11d1
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f3eef8bbfcb2672f8495ebbeb1f3037cb70546d4
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/37857afad1a4a7f55149a95af18f06c1640cff19
         arc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2e1f6e60dd7285bdf2c1902a4b157a4696637066
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d6f2fbed08a589b547adb4e9177dfbe3174a1abd
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c87eb855259aed67f0a732e0601debf90b442df9
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/b4dd114e2f46cd30bed01bcb3a60e9ad655163d2
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/469dcce6d43f1e255417efdbe82d88981ecca704
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/86714127bea9485c33b0bd6d6c41724ed4e34ef0
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/407af72602b7ccfe2906da987932a64bdfec258d
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/06c8261e9a682ac9f497d2f68343328f9e999caa
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/bef0cbf915983c506077230dcd7297c94cec4b4d
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/de03df6575772ff838fbc6b76cc4e40a836001db
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/86e1b91459c4c7418601060504fcd761aeb11f3a
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/3764014c24be0350e599b9db4fb97d5f2e002bad
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/dcf2f8f6902baa25d8dad21852a8cec676715dde
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/f89e685bc215e432f591135e2a0bba80bc4619a6
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/494ff668590a7d95da1cd3489bf9268575ba9639
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/9972184bc1dfb34f4a9122809509b152e39b0a4e
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b5f80d4680f53d8385aac7e334f11e8567c242a5
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/df243f08a93d5db4c946d76f98a2b97e8f8d60c2
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/89b3c0ccd8547562ab17ebdeb60eab0fa7d0fced
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/06c5930c7cee08be4a698c7964fa71fc2d4f680c
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/b1caa4815a5c49d602628bca96f1532024102135
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/be7c9b68ca1031be4ac901be8e16aee7dcc5284c
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/11cfea36e7e30dd56b096e2cf42a07b7362f15b5
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/3de8ce070c223ada54cec13eda20cbb61cb3e16c
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/52140873feeab840e13911e3c6c5e96c041e4501
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/92efec383f5349d6dc8032374396905cd172d24a
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e56c6308e71b2e28eb8c032e3b9ad6b0575a9cb4
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/509b1e0e3ba1083b64a93174dfeef48ec4e864fa
         arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/f0abe301816e39eb4ae26d3e8cd42d90901d5ac5
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/70bf1b53f13a1f6a5758a31fc58ef13d10fa57fb
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/3b77ecba7b89c3d3715c8d5c118a6961453a8c93
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/dab4c552cb9113930f58ad826018348bec35346e
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/becc7551041a2391812f9a52b5a7638dff7919a1
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/9d486bc3f241b8b42ee1249b19b97e404cbc5772
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/45aacbf6073188f54217c49a9e59bf6c5beaf22f
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/eb5da953abdc9559894a3acb0115bb9ad3f46bac
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/22b27060f416bd4de4d700276792207a76680de8
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/0639deef647a34bc1f2c034f8cfb39168f52a710
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/2112ac5381469d46df816a1b7b74ea4f4cddb2ce
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/1fc689fe6f8c438db159136b645e425f23a19133
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/4695e1e91ee3514c2d0260d4f3739d7cbe9b268f
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/f41b53e38227ef41c0af6fdf4c8736a245535252
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/9f3654d1e3a3cbd01b9b94e46c44bcb5fdbe6ea7
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/9ad859036310e632240f8a821df99e27404c3837
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/eadcc952f99fdaba2d92572b2f0cd52667a7c64b
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/aa7188a6f5879451bed61c16185e9483bc0bdf2c
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d7e04c926d7158535a447286edb6623a5ed7bef1
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/83d829bba6b12a9354bda04ddaccf327afd6fbfc
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/81b65842df251bd9cd7316990cd90d2b4e11e23a
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/5f67dc5a449c0a64d4591da908108fedb9b6d1e3
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/6475a4b33bd985725fd7517f0c2f598ab4859b3d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/e608f1e41f66ffb9c624dc7959c16dceadc0dca8
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/991e2cd2f697faf6b853fd5da2d8e7745329b38a
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/c309cf28854bdf3589d24076e0a42330072b2a49
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/cfbc034514183dc878adada9701c5fcc82b4b0c6
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/143576943c98f92203c0630f5743db72edd4c654
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bfb33971755cd01997bef4200389331842b18768
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0f972356b551c42c2dfe020f09d0a71404e9bfa3
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a7086843ef76fe5136e28f330d8ece1ef70959c5
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/96919a2d0bcb4c30c43382fec2a7c6ae5218041b
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/229b0b02de2043fb6c828b3bd939d6df3b376710
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a9a3781f6fe0a4b2dc4f27c963a3d1470eda0a89
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bbcb9c0b34616aa4ba8e120715e3f5796ac8c05e
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b6da31ac577bf264adece27c45a5b1fe2506ff52
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/460ed713dab8fe3b63502508f354a713e08afc1c
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/93cb649a504d174a839060b2cf8c3577e67c191d
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b9754f381a5b9f7176fa869350da45feb2531d8e
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4484410380ec9cf4282dd402a7555c2835f9927a
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bb8e8edc6bf4d2551e601deedfeae09a04abe28b
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6dac48639546701a5efffce41f1a2912e2b87e01
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3d4fdfe3418317e61a5ba7bb0eff67735d106a74
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e4b20562fd9983e48e238d361026d8b3992125d5
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1fe22b13ab5eae9b3da3233748be71946eb613df
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d0922c92db683974ab5e5c43b6f1a37d669261d4
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/bc26389b47046758c395647da8d3842009cff78c
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2e3dad2ca0efa13cad01df2fd40e7c8795a866b0
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d447b587938a193d95a26cdb4d7251319f5e367a
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3df72029827473b6bfacdb5b1064f1bb585be55c
     sparc64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/c2b946d68c1656d0a07bf3c95a33b7f596723408
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/1506142cae643eeaec969e51d119cbaa2c099bab
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ce79bab8f1f91f2d8ff32cefbbd9c268c6340ddd
microblazeel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/29329e9d0aa93749873c14564ffadaa87885843a
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f03f32d0601a2385d38eeb5c6662ab4e225a6339
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/41ded552bba93c0c23d33cec3dd48cb5218d4245
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a199f45e2b25dcc0f33b0529caa0929c059254bc
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c02c74316cd4856c579e5c45868103f7f2f50681
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/aa6e4be00df909d65587a24f374bda39e67cc706
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/362ff94cf340e01afd182521b0c57daa5450aa11
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5e24ed53db962686aab1290085e5bd40a8c14d88
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/43548c6304ee9d4e6eb4e9057fe5973342cf2eea
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/83b9a3e6927ace0913da4ea964e426bc7d9a0470
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6abf17d1fe7efcc146ddffd3915782975662d92a
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/34fc0abfd0a70bc03265fbaf24714363bcc92c13
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2b2fdbacd55f1947ca19c11e5feaccffbd9c6e2c
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5358c64c71e09a215e7de97469ed8ced639dcab6
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/331ca9d3d95b168661e84bee17ffa1f0b020afb3
        bfin |                   zeromq-4.1.5 | NOK | http://autobuild.buildroot.net/results/59bd5f353428581312da1efda71fd4a126bd9ef7
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/6d3cf61159cb1dc65502a3e1ca2bb7d187876836

-- 
http://autobuild.buildroot.net
