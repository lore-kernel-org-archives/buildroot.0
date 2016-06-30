From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jun 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-29
Message-ID: <20160630063025.2980F101AE4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-29
===============================

        success : 167
       failures : 81 
       timeouts : 0  
          TOTAL : 248

Classification of failures by reason
====================================

                   efivar-0.23 | 9 
                flannel-v0.5.5 | 7 
   webrtc-audio-processing-0.3 | 4 
                  boost-1.61.0 | 3 
              libdvdread-5.0.3 | 3 
               target-finalize | 3 
              lirc-tools-0.9.4 | 3 
                 log4cpp-1.1.1 | 2 
                    pppd-2.4.7 | 2 
                wayland-1.11.0 | 2 
           libfastjson-v0.99.2 | 2 
                    owfs-3.1p1 | 2 
                 lvm2-2.02.158 | 2 
                directfb-1.7.7 | 2 
                cifs-utils-6.5 | 2 
              e2fsprogs-1.43.1 | 2 
               libsigsegv-2.10 | 2 
              gnuradio-3.7.9.1 | 1 
                pulseaudio-9.0 | 1 
               syslog-ng-3.7.2 | 1 
       gadgetfs-test-undefined | 1 
                    lftp-4.7.2 | 1 
                    gdb-7.10.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
               linux-pam-1.2.1 | 1 
               polarssl-1.2.19 | 1 
               qt5base-5.6.1-1 | 1 
                   dvblast-3.0 | 1 
           linux-zigbee-v0.3.1 | 1 
       qt5imageformats-5.6.1-1 | 1 
                xfsprogs-4.5.0 | 1 
                   fwup-v0.8.0 | 1 
python-libconfig-b271c3d9da... | 1 
                    cups-2.1.2 | 1 
             bluez_utils-4.101 | 1 
                   ntp-4.2.8p8 | 1 
                grantlee-0.5.1 | 1 
                 mplayer-1.3.0 | 1 
                  qemu-2.5.1.1 | 1 
              libarchive-3.2.1 | 1 
                    hans-0.4.4 | 1 
                  connman-1.32 | 1 
                   assimp-v3.2 | 1 
               libdvdnav-5.0.3 | 1 
                libaio-0.3.110 | 1 
                nodejs-0.10.45 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/309139cad7cb412a3facd3d7e19a9afb44c71c21/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b82ff1d724e2a5f707fe191aa04c4762d3ac7d34/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4aac073c5cc0e17cfbd08617af0b1cd4ddb404e1/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fd0b725d6ed3ca77ba9df68e124c7abec9acbeb2/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/979c8587f14cb9211c6210277c07256dadbe4b76/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/f438b7e4b46de8a30eaec93269edac0f991120da/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/4b74003a71e0f044b12dabbca1462a1c4ffd926e/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a3a53e043398ce30b25cb695afb87e94fb1a69db/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/efb6d8b7e2c21c2e5dd39bbe1d1794d422bf6957/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/0978bbe8c5fbe346a64656a3fd033e5e7e383c82/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7c509230bcbc70f61302098f8daa7633832310ac/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/cd119a7a346b6cd749295c2660bada9871c58440/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/eb0d5023a9c283660578307dc4134ca0460def2a/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/c4d068e90d92ea70a4dd5a1331072b6da08a17f3/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/3d91c733d248858f95ddb4c915af985f648b0b27/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9d1f8fe65cc4e1e5b3ee099bada19523388568f0/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c987bbdd535eefd3a5e19cec441ada9102c13676/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/efb9836009077dcba68f4e1fbf6820d43f86f39f/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e897b78a93fe857338b939113e0421d24c90624a/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/06c4f4a51865a62cb9d4dbec29a9c5f09d959044/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6ce6fa7e47902d8f756eb689aec1d040fcc8c9de/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/dcd50bbddee9c086ff220e6063500ce5f0d7add8/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4643e8ac2a0c02e023d024d5e67bf458fa413ea9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6bfc9511113f71ea5574218a21f465d3efcdf7cf/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c11ccf59ed4c627f6bb7c9d2de351c45b1e885df/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f16e49faceee14b6265290309ce428b5a322e14f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c4ae0a4fe1f02bf4e6891c456661949b3a63574a/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e229faeb91fdddb3dc4899b9b4ca45113269f50f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5d86e51d8c4cab6ba578d878d731fd34087c4eae/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2580ef8ca0752e640ba26079ff06a446320654c7/
     powerpc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/33ddd9608825b6db2e0cbdeccc14793e14c268e0/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/b54d9137b83f2c5b039fff2230c0cf06d51d714a/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/582b50e942adba173a0508a9738eee022fdebbfd/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/01a71a833f06457d1f8db58865dbb3c577d78049/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/a374c77f534681dae4f6b6a5c4a53b06434748de/
       nios2 |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/9008c3be3bcf46f0fc21a34f48e3cf9da1397d9a/
        i686 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/c6024d9ab28dade8019cd5eb152fbd17d93c2f9e/
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/b9a732f24b4e79e1ffc3943bce55cd3183c17eed/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f60677805e09e73cbdb102405e7e9f048d11b962/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/4e0875e8acde0cd095b494bd08130135b7d22362/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/1c4062587d3b78b94e2f755d1126b320de4bb070/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/eecf2631603cb284284779b04ac379727a11d945/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/fbc883ef49a4ba45e3a9e8d0a60a55d403673e36/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/84b9f70392dab01b04806d4f7f6fdeb46a04f3d5/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/38113a31fa560e3b7fd3dc7e20754d4d889e5d4d/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e460ada736114f4e7f288f41afd59d30a5d2e515/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/75cf1036596f6d194cc73427f53e364fb54de9ec/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1bdba0133f1db510531d0e36e0b391f58666bdbb/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/745e3f03d7d8f64a6deac04e9e0fb922d159d698/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/7274368f0035a1df4e0bad8c06a03b769b701866/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/7d8dd402a26e1cc7b8931f719bdd5843ded61227/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c57667c414c392cd91e5864a9291017cc66c0533/
      x86_64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/11eac5f3d6beb9b08ddcbf4c8ccc9e7772ba9e2c/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/53f1e61260d1f6f5f3906e90f5fa6efa2d02a486/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/ae7b458c584516f8fac29863d7a9de280c4f18ca/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/9b822332734e016f9b4bef913844c50e25ff7961/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/68ca8e3b3ebb962ae8678bc74320d95ab5eff048/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/1d5005999b5bab27ab68b5f0d823bf97e9ce4e92/
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/240ece481caab72a416fa41f47c5cd87c66a0298/
        mips |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cfb0f223ba72bd72eb4e387d0fdd7c875a55637b/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cf71137b4401a90d0e7e08ec171f498121538fcd/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/2b100765c0fc7d7f8049be29d940f25c4d464ce0/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/34ee4f95740420d3f66344ad954feab8bb32dbe4/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/e4a7c198579c7288afe1645edd70edd873b9bb32/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/8d23db2b6277a79ea0d97fac368bcdc902b7e4e3/
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4762a8dc93311537f582ccf014b299b01d1dfba5/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/5520fe322da40369f85b39dd4743dc9519568fdf/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/1913e491d8e9571960027514810d46321386f5f1/
     aarch64 |        qt5imageformats-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/c85f0445151171548cf7c39999ef00d1638871e0/
         arc |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/009608ca77a16041659257cc80f3839ba8c3b87d/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fb19e93dff091071ec0a35604fe836e1b27b831d/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fd68dc5a8448edd36c8772a00be55e2b3e7cc1b2/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0a0d8cdaaf1f11387333879ee6466ad1d2a747cc/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/648ebcebb5eb725f7ca6743b5214d9cfc687a6b8/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/403078d4b2540c89fe59ea41622b3dcb126720fb/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/8e390a1bb26b77b2b21e26da481535618af5e9f3/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/9526683161d15d160010516e2bb1a62f04e3068a/
        i686 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/be2bcbf2e015f107ce9f8259fc6af3221d53cabc/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/83cdf4a7618ac82c0175d5508f333f3a44080f21/
        i686 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/729cd0039ac172cfe31a4325bad902e9a14e146f/
         arm |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/dc4d40eec1c80e9380e1cb2937db03c08a32e3c4/


-- 
http://autobuild.buildroot.net
