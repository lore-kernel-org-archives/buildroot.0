From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Sep 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-03
Message-ID: <20160904063032.EA196101D11@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-03
================================

      successes : 143
       failures : 63 
       timeouts : 3  
          TOTAL : 209

Classification of failures by reason
====================================

            micropython-v1.8.3 | 10
                     lxc-2.0.3 | 6 
                    mpv-0.19.0 | 5 
               binutils-2.25.1 | 4 
               libepoxy-v1.3.1 | 4 
                libxslt-1.1.29 | 4 
                  ffmpeg-3.1.3 | 3 
       amd-catalyst-legal-info | 2 
                   glog-v0.3.4 | 2 
                 lvm2-2.02.163 | 2 
                     xen-4.7.0 | 2 
               audiofile-0.3.6 | 1 
               domoticz-3.4834 | 1 
                dosfstools-4.0 | 1 
                   erlang-18.3 | 1 
                   fwup-v0.8.2 | 1 
                     gpsd-3.16 | 1 
                    lftp-4.7.3 | 1 
               libcap-ng-0.7.7 | 1 
                libmpeg2-0.5.1 | 1 
make[1]: *** [libavfilter/s... | 1 
                   ntp-4.2.8p8 | 1 
                  openjpeg-2.1 | 1 
                 openssh-7.3p1 | 1 
               polarssl-1.2.19 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
                      qt-4.8.7 | 1 
           qt5location-5.6.1-1 | 1 
             rabbitmq-c-v0.8.0 | 1 
          sane-backends-1.0.25 | 1 
    xserver_xorg-server-1.18.4 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

      x86_64 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/60af0a2ff6916bb1f8aed57f1f768a89cf95c270
      x86_64 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/7b3cc93cef4737027e9df06cf70ae927dd80241b
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3fc20aa51b7aaf37e5e731b5ff2ee2f14fb614c6
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e727e6e9cf361acc786acec192a88f5f5444a2f6
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/5ca1fa29f20cf05cb81e6599c31b1ba718479f19
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e4f89c802a19a640b7c0725e4fb2f2347d0d1bfc
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f9b90f69a5ebb7a41821ebee2fc0f95a445b06d2
         arc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/b5406ca587592a3bac446d1f1df93d3eb45b96a9
      x86_64 |                 dosfstools-4.0 | NOK | http://autobuild.buildroot.net/results/346feda6a4a83850dbb62919eb33482302053490
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/097dc702696c9ba35a2c5175d8432ecd1c4b49da
microblazeel |                   ffmpeg-3.1.3 | TIM | http://autobuild.buildroot.net/results/7d08c8ca78cba6e7b970c03af6b485ecef1b6a39
microblazeel |                   ffmpeg-3.1.3 | TIM | http://autobuild.buildroot.net/results/5d143b41b8c1d68eca3222573a8044670f296319
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/c32a21240a9933796ee850349a62ff3c2314f25c
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/809853e8abb9e9e5c8f2e205744137df81466999
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/8ec0028e568e711f1ff0c1898892925e97e9ed92
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d426676c505fadf4b0a197ff32fdb75016cbf52e
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/34cda24bd10000765662efd2f1ce0ce514914e43
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/3cf32c45d0fe25bbbbe2e96790a7699e41411422
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/797b38bedd34928aab2d1d193d476160a1b361b3
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/b8eba57634476c2262fe51f0b175fd399407bb8f
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/21545d4b0c1a6384a827ff54618b554f26d043b1
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/aa0f09ed2329603276cb6513daecd6816740f499
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3926f55f0ddd3b04004e55814389e4b01207ec7c
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1a3065fd224fda8e4d8bc286efc26d05e7e6d839
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/b0bba35f20bfcca7d6907eb13382761bd42871a9
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/e2168f756c11ecb045e41c3af2e34f7a9bb2f95e
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/c08bf34c02f7fabcc2022bd7ba7a68760b5aeca0
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/dba2e87554374b1b285a04c286d2669e553eb019
         arm |                  lvm2-2.02.163 | NOK | http://autobuild.buildroot.net/results/8d14183cecdd90e4dbd0379090ae335ffa3dd198
      x86_64 |                  lvm2-2.02.163 | NOK | http://autobuild.buildroot.net/results/9c52b9b0cb6747ccd180ab492a2c997bff9d0d1d
        i686 |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/e26f6eaadcc436451630e93443b9c37033af46c5
    mips64el |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/58e3a5c5a074d47986920fdd7e7c516fd8eec94a
         arm |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/52167b4b1ca82f6b5fc3830bd3ff45cddb287e13
    mips64el |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/a9bc0c0be438119c6cdc82388628e99cd3586274
         arm |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/af69674f5cd236eea0c1cbfd92e731e0cfe600a1
     powerpc |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/336cc57ba73cf38cce2402b8ef338ad43d4bc358
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/a2c8ee09a8b37bc016431aeff3f4c0c9774d04c0
        sh4a |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/d883fe3ccb13c1fc56a9715009899a8673f7c461
      mipsel |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/a3f0895fcea0c2c109c51fa579087c1379a212a8
       sparc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/47f776e68f0e505e88d7ebdae268b242a354c122
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/f046fbdb572fe6bd16fccfc9c962643506f3160a
        mips |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/6b61f4e6b64ee0aafe824060b4c78823aeb5de96
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/b97e754f8370945e4701f3c6ad3b97804a03e68b
microblazeel |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/c65a983268c9599f20453e1911d9144311a9e848
       sparc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/33506befdf96642f3d11005bd5a7597b1f89b685
         arc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/e59ff299d3f1cfd89e51cccb3f276b5345e2a546
         arc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/002bb7a30627e5d4f8ac62503b5b65db9628978a
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/877539b26ccb7e19e02ebeca42735216045c971a
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/30d9441d809fb264e827c204daa21ccb0a5dc2b6
        m68k |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/70ef7aef64fab84f08aced95ba7a669d8048b2d0
        i586 |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/ee4496f6230e03950388cfb5e8e419e3b0cb8eb3
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/f599cd94775c54e6f247539f64599b94e5076b1c
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/942c76ef42a7020c447c4dd7077c65151fddf77e
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/2938f1143742848514bd0a0ef015547d3ee6d482
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/b0c43596b383de922a99da188b20e6f2e8d80bdb
        i586 |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/cbc459d4d37b9360d7dfc6b05c583538ec8b4f17
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a74a82524fe44694f12dcea0492d0b58dd9d7111
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3828ab223e5cedf96607657f005f7de2f51a3a60
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8b1c008f56e1fcbc59d7b67843c1a1ac08447e3f
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/3841ab95d5e520b69b166ca562b05453cffed1b1
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/73b94c6331010598669e3114e2d4f01764f4325c
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/24c2cd2b7cd335ae4177d773e49bb4f21be7650f
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/7a470bfbd9c28fd2cb36ad7a72dccb71e61b47e5
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ac21e6c002c0b13a7d48da29f6b3b713684df4f2
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/1f6131c25738577afd8e097d126e8166cbcfcdd8
microblazeel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/87b460432a2be87842293d9d8eccc825097d7f7d

-- 
http://autobuild.buildroot.net
