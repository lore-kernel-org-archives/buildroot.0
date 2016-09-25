From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 08:30:44 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-24
Message-ID: <20160925063044.8EA501036C4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-24
================================

      successes : 218
       failures : 124
       timeouts : 5  
          TOTAL : 347

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 19
               libglib2-2.50.0 | 16
               wvstreams-4.6.1 | 7 
                acpitool-0.5.1 | 5 
                alsa-lib-1.1.2 | 5 
                     vlc-2.2.4 | 5 
                   glog-v0.3.4 | 3 
                 lvm2-2.02.165 | 3 
                     lzop-1.03 | 3 
                 mesa3d-12.0.3 | 3 
                    mpfr-3.1.4 | 3 
                    mpv-0.20.0 | 3 
                     xen-4.7.0 | 3 
zyre-1d949e4bf79b694ea883c3... | 3 
                  cc-tool-0.26 | 2 
                 mplayer-1.3.0 | 2 
                    php-7.0.11 | 2 
                   assimp-v3.2 | 1 
                  boost-1.61.0 | 1 
             btrfs-progs-4.7.3 | 1 
                   cmake-3.5.2 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                   efivar-0.23 | 1 
filemq-e59951489045825d6fc5... | 1 
             freeswitch-1.6.10 | 1 
             fxload-2008_10_13 | 1 
                     gpsd-3.16 | 1 
                gptfdisk-1.0.0 | 1 
                 jack2-v1.9.10 | 1 
                   jamvm-2.0.0 | 1 
              kodi-16.1-Jarvis | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
               libcap-ng-0.7.8 | 1 
                  libcdio-0.93 | 1 
               libepoxy-v1.3.1 | 1 
libsoundtouch-010a91a59071c... | 1 
libyuv-1ebf86795cb213a37f06... | 1 
                   lite-0.8.10 | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
make[3]: *** [smartd.o] Ter... | 1 
              mosquitto-1.4.10 | 1 
                 opencv-2.4.13 | 1 
                 opencv3-3.1.0 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    putty-0.67 | 1 
           qt5location-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                    quota-4.01 | 1 
                     rpm-5.2.0 | 1 
                  squid-3.5.21 | 1 
                    urg-0.8.18 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/9c33b231ef12d7bde2610f75a6cf011a77a84555
         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/c552f11daaf520c18e33933ec470a6f8cc50e46d
         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/70eb7d7ed93a122b4c7a9890877e721b8d777b00
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/3bf6b73aff6d3dbd721f2f5576fedd45d5d13765
        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/556958548aa945312a5af4f9106294f0639b306c
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/1fc9806a62b813b085c39d36000f4d9d18f779df
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/03eb11b6a783da1985c19858f6c5f69027e0ed9c
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/d620812ae79c4e8252d2b0c410f94e9cdcbcfbc3
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/04b7609f5decc71bf25e981f14756029715fc621
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e85be7ffd62e7ab95c4dd0049b0c67ae98f75543
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c10886686a0d29877004a0afe2106a77aa2f2ba0
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0c6b321e490f7da90cc727734baa0440321d16ba
         arm |              btrfs-progs-4.7.3 | NOK | http://autobuild.buildroot.net/results/4dd8666b1a24892e7aeee203828b13fec78258aa
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/bea2459dad1b0f149fa04063052ac547fd4a8601
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0a7302657aefbee2c7d6066f8000d55b6c3bfd6b
      x86_64 |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/77b90ee2c72390b4a4a8fbc367d4f25aa0df8593
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/03df39d891d41a0634daab9dc36b61eb57c98ba9
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/e500649c86b8dac221d1c3c84f8cc08d84f506e9
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/fdb52f1345fb1aaf0a988ed4fcaf1e8de5d156aa
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/bad376f0029e656ba707ee4574d884414d7dcc34
       nios2 |              freeswitch-1.6.10 | NOK | http://autobuild.buildroot.net/results/96f69b7be1978f85271e2827c2e18d4ed8de8dfc
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/a7717af1e6bab5b3492da55ab757f7051994c4ba
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ee5bc417ba86ec783e281ac7caa4cd0bc7500fb9
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f810b3069ed2b767ba5c326025a529b3e913c0d1
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/e1868563c1a0f210b4a0c633a61ee8bd2e8a2c19
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c9fba54a45eeac20f0d85ef5891194ce36bdfd69
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/9dcaa88b7a0cad48401f597da41ff53d571b2678
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d348065037db34e827e969c4450b45708ec5699b
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ae49b9158a3d620a942640a42fff27c0399dae54
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/a206b6b504f18de6d6c0ffb34807473663b678be
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/0fc9a64a8720d37f1684c0eb23256e734d482b08
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/dffd86afcd6cc6dfde8dde5c257a8b8e52292785
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/652f33c014ed2d6969390af91a57d6ab5496f3a9
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/3a4837204406cc7ebf3b0e064434458046de71f3
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/9d9a0e828d65bfd3c443ad4d87f9a2a979b01b14
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/5425e95373c31d309216d84899ef4aa8a47b9845
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/00b40129aeaff3fb8f22607b7d0a0171d8e9048a
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/feffcc58bb727960e6ee61475b5243a1f3ecebef
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5619ea093742ca64f86bd19a466492a5355ca225
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0a5c7a48a9905d49aab495598d025c87e91ee084
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e0cb6383ca4b11e4978c0377af600d0557b5c274
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1de76bd13c869ab2596bada6100240989f70f05f
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5a988c31f6b6b0f88406d6bc3ae6cd8f4bd6cf7d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/061092e24fd77cf88f9dbad687274ef7676c1b3d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bbda4b6f3164143e333469c6a820d8253ea64fbc
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/96e10153bbbede2230d57b090d7f75ad26572bfd
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a56167f860ed598ce53e59922bede36049f14221
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/94b1bb47570fddec389f244f06e31e36119c4bc8
         sh4 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/dfdac6b6f1ab01bb49a336aebcab6ccd5e7426dc
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ac0dbd96ac27c03219d002f057ba9551ea8d7081
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4418898853d75a30e1afacc44e36cc92781c8f26
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b356cf5560330cc415577fa8104f25563350a07c
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/23f01a5f249fc145bd60feb1ddcb302954b6c117
    mips64el | libyuv-1ebf86795cb213a37f06... | TIM | http://autobuild.buildroot.net/results/d191b2728613ca9779574767263d22f1d59657d9
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/4dd68d6d8f83abb5a10d913456005289bd892add
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/64e93428dbfeffd39fdbe589671a49842c7b884c
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/98843de805429273ef641bbf5ce021bf9b31388e
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/d9979e18c28234df3350102b377ecd4ec1c9c433
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/1521283ed41f10cb80439d39758b44449d4e7f44
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/f75f4aa66c80ee2bfef3bed8f198ac8ba158c326
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/90427a4f544f71463df3f4e6321a3a88206b4248
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/2ee1be14c475688e500efcfdee1e20f242376667
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ed90f4fd66cc2eb4f4c99aa6e9f26bbd7e102cdc
      mipsel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/926ee7dfdf562f799fd740c53be49dc074a3ed9e
microblazeel | make[3]: *** [smartd.o] Ter... | TIM | http://autobuild.buildroot.net/results/91f8d70b15575ceeb7328c46198218a81a378336
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/0c0a1551ca98d12ffb16752ad187fa99958a5e3e
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/a4c96a7ef4df5c5be03def6a1d67d7944e664cc7
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/f187fbabe152f8113ea253b543772f9f3373e97b
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/19dc9fa7187f4ba6e5d959aafae5feccca1fd0c9
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/ee9a9af7f9fe67eba021a29d6a0d19efac632760
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/f43a6813c8364a2b1cde3c05b44f9a9751e164d8
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/da31fc8641f90fd626d588f329b5170d50404798
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2df0658123341285447fd4f526e735b79f5c75bc
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c1fcaa871c9c3ac52dc2060f71c34bd26b193323
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/4e46e60bf0f1d122016320bcf5fd1461aaf9ea97
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9c011c44ea69e75a4c4c91ff196e342c5ba6d260
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e65f6938d7c88f83d143fa1451d5a620c7d3952b
      x86_64 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/d609fd2dcacc9f41eb4efef0181f7249ff7a39ee
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/179f4cd56be14b4beffe247ebcbf654a8fc6b70d
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/36d64952d2982117c3979d8bc6fa5e9195ae39ef
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9dd3b804909cb1e020fdc412f51c718ef72732eb
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/c7964c6a67bf3b03ee54ba0bb564363cbb89ebf6
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/e6052b41ebb939dda945cb6ba9940251d6db320d
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/792e1a9944ef7ee04ddc454016b06164e4ca8751
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/94362947059a9bd3644c82a2b29f4bd84cb67367
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/88444358c9dba77b721663ddf01f0556c0167e34
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/fbf15a9fc0cc4da339fa7b9e0d081dbc1038327e
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d28d446f20dc9e29cd923210f2c1e2a6233ee288
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/790dcc252511eda8e7dd6a3fdd50fd96f8d91037
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/e86f1399cb8efdf0e3a0b639018ebe481a1468c4
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6429b791448d623b3e270578e5473753b5a6b1f4
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4caadc9c0005e48e43ef47a1fe974659ca8298ca
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a634209bb3685e80454a88fd5a4643a7ab0d40fc
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/623a5d75e6f4d502882c179dcee15065b1101a3d
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/99f129e17859fb4b012863250ddd934e90a1e661
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5f42a8a2399cf38137877b23b041343b96f76251
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fb74ad92a20c17fa2a43c8aa4124e164f4abe406
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/481aa3d48252808199ecab51400016019b5736fb
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6708e8faa051ac3769ca05bd7fe2bf8ed3d5b437
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2b66d669055ac6a0a4e4faf3321bf934e8655099
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6b0ed9108a5b40414150f420902811fb45e8080f
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/53c9994aed52c4b6273e86c59736b02e93016660
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ebf10b06e111d3941859ba2b84c2ee992dece1d1
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/45a5bf12d211177c2868e8c2e8a8752acc0e8f9c
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a5ef0a9d8fec3c75cef55dd8f3c14ead353c92db
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/21be31a3163dbdef58f4d9361619710c05a1fd86
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9115edf4faa71209a5b2c2d3c93b3838fce5017a
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7e6830de6970caa65ea75eb2c9ce91865c560f34
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c4a0ce403a9269e2a703fea798669e8e2024cb22
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/1707e875e5cd3c0671dc164adb9e7031bc2989af
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/ca817311bd9da8f78a21ee0ff7481d0ca14aa81f
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d9572bcafc1776eebe88bbcaf031a05cd6ee4b23
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c2d7afd31b3428727a82ccc254bc0cca9c9bf1a1
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3b9d15f226057706c185270788050dace7b7b535
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/926198839987d31aee7ff7e039cef935909a5a7d
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/0180687b32fc3528fafd12f420a61857daaa6403
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/562c680e12adf00c63dee56efe181b6deadafd12
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/69affae28ea5b7fa0f961991e213e4240c56b487
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/fd3cd1a0d2bceabae4e1a9380016d8341b524703
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2bc5366a77631f91d756671f34aa514b402f2821
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ae87c2db29137625a1697e902efcecdf0129dd60
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/be82f8a454126cbdba83d90ff7541bfe47daf24b
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ed9c20f376770d3e593c7474871b7c3cc6d6af20
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/8aec75a1a0be57a5f791b28a9965a69ef3db2422
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/8061b5fcb5fb4fe06ace0c8966b8327df6b1a9cc
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/fdca3c0633b32193745cd7e33303a549a9291026
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/f4c2905de59f16fa65a077b95de154832823e40f
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/962c75ed07a617a5c01872baa3668025b1ccd652
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/9daa978082e1562d4cebc9efe267d9a76da98831

-- 
http://autobuild.buildroot.net
