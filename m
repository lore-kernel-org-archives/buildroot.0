From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-16
Message-ID: <20160517063022.7001A10142D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-16
===============================

        success : 172
       failures : 60 
       timeouts : 0  
          TOTAL : 232

Classification of failures by reason
====================================

android-tools-4.2.2+git2013... | 5 
                 jack2-v1.9.10 | 4 
                    mpv-0.17.0 | 4 
             stress-ng-0.04.16 | 3 
                    cups-2.1.2 | 3 
                wayland-1.10.0 | 2 
                  ffmpeg-2.8.7 | 2 
             lirc-tools-0.9.3a | 2 
               valgrind-3.11.0 | 2 
flann-04b4a56533faf8c8228d0... | 2 
                  boost-1.60.0 | 2 
                 rsyslog-8.9.0 | 2 
                collectd-5.5.1 | 2 
          libpam-tacplus-1.3.9 | 2 
              gnuradio-3.7.9.1 | 1 
            qt5serialbus-5.6.0 | 1 
                  connman-1.32 | 1 
                     vlc-2.2.3 | 1 
                oprofile-1.1.0 | 1 
      host-gdb-arc-2015.12-gdb | 1 
                  psmisc-22.21 | 1 
                   taskd-1.1.0 | 1 
                    ustr-1.0.4 | 1 
                    php-5.6.21 | 1 
       gadgetfs-test-undefined | 1 
        lttng-babeltrace-1.2.4 | 1 
                 host-go-1.6.2 | 1 
              strongswan-5.4.0 | 1 
                flannel-v0.5.5 | 1 
                    pppd-2.4.7 | 1 
 toolchain-external-legal-info | 1 
liquid-dsp-df5a459fa05dba41... | 1 
          chocolate-doom-2.2.1 | 1 
                 opencv3-3.1.0 | 1 
             ipsec-tools-0.8.2 | 1 
mtr-66de3ecbab28b054b868a73... | 1 
    erlang-p1-stringprep-1.0.0 | 1 

Detail of failures
===================

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d0b84c6b512f530c30a917b2f5abd2bc9dadd112/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d3099b8fd163772d5601a081c8125a59d186e8cd/
      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3c2aaab721a29399e9a945c3a7645c54b3e90410/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce9c0d25448cddc29c398f408a7c5a238451b179/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b17b75bb211d0a0ff2dbc75756809775b17d5637/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0b9db4c5cfd80d75eb620dbf7a6201faed7230a1/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9b8c5d2cd31d63ae70b41d1434868c83e65b8423/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/31ec8fed2390b8fece70ec7168019c736fe66b01/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/80a75aaebd55fca1220048d1d4dfb434ce4d9804/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ae1e3a33a1c2b7433ca7a04659467e2017756b00/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/12c91b8ae633112504c5aead84301b3107c23ac6/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a72771300d817ba8d411abd4fa1d232911422f5e/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a8e7bb8f7616aedbf71e7c653004c6ffe00c0790/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/fe5e5e4a46007150692cbbc6652a6f2c3a1ee6b7/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/a8b7208ef9068866365843b11b99d24183d4c7ea/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/0f30c6dbf2186af5bfda7fe051db385a389b2251/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ee836d09aadf7fb43f25d59bdcd0658f55844083/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/3f44a1f30a88dbe4a3a83055267b472b58769e15/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/fc2446484d4167c4f99c4aeccf3532d021d02046/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6664189a6f3a815978e8d0a1d7ef408ca47e2874/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/163fbc2ccd88282be2f5d5354b125429bfb4ff4b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/714019031fb8c8f70c1838aa18e4ec1e4abf165e/
         arc |       host-gdb-arc-2015.12-gdb | NOK | http://autobuild.buildroot.net/results/c6d9ee66842fbb2457277d02d241c439b43bd568/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/42a8d07101d8d954511d1c884ecb66e8d861899e/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9e68e8bf8b51c7d8fc0a2aff1ac617dfaa36b648/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/43ca1b103434ae582fdf93cb5912b311960f303b/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/415e2100dc59d35e58646c07f7cdccabecdda966/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/65edaf15180135b4a30b72ea92c35ae16f001a59/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/391e71a988250ea66ec4dbee6f60fdce9eaf2766/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/ac7c9b3ad2e52abfe6b79a80045e4218eeb87175/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/1a778bbcc72a8f0df3b0d25a49c03a25db1b440d/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/1482e2702553f083a500c055c2ef8e6ae2a85182/
        i686 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/37b5fdc0fa320aad98493f7ae7d4e70a84852266/
        sh4a |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/81e9bfc79d6b4ebba7ead62b7abac68bd9968e88/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/0d247c58f788282f92112ac1afb616fa2631c32c/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/78e898689c3de1549d92f00b0d39cc0771417027/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7982e81a850f579d51021f620cd3c1e8bd641771/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/bf45e609befd6a1c00dc75578f4c363657958380/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/97491961a9a04de03119c08ac21e127971c1202a/
        bfin | mtr-66de3ecbab28b054b868a73... | NOK | http://autobuild.buildroot.net/results/e05632e0b160ee995ce46aaf3ceddf46d3658adf/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/a5a32e8b18583f0c40da22e735ef5e2ed1e415a6/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/1fd1eff35d7945f352561d0eb9bb5d7360942a42/
         arm |                     php-5.6.21 | NOK | http://autobuild.buildroot.net/results/c67d00b19da8bcb2e6070d3f048931b36d5ad467/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/32bab29b2ed19ebf18d34f7dc3324161c89dbda9/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/382094c3dedfdb3e2489851d8fb1255e440ce39c/
        sh4a |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/6176a24799b5d80312be954089efbbb498fa1571/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/08b5fa07c85e38a771f7d52e2e09fb62901e156c/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/abb2e06d0b19922627d9a76c75858b86eca1cc2d/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/99728d80caf490ad2cba78b9c50ec5385c5e6601/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/9134c246e451061b2ad42d0508d073f18f19961a/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/c22585c193c48cb1d2ad3bb7ecde73620562d7c8/
       sparc |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/5859b8e0a1775ecd6afa13132549966080739837/
         arc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
    mips64el |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/b047bfa84af0e88f4efa5e1ed7ea5639d120b947/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/cebfd7e29a6521ae7ba4c229586a3ef662aa9de1/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a1168399adb9fd549d610e4d18aa024d9c8bcbff/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/61eb30d455cf767f4317b0898c2219b2ab695fc0/
         arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/1a7893c13f6144e0ecd9f37f2f047c596ccedd35/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/0a5d32f0fa28ecdd540e100951b116708feec6b5/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/75286a0319094a82934eebeeda6ac4f0b0f36743/


-- 
http://autobuild.buildroot.net
