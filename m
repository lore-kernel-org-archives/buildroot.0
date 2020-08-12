From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 07:47:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-11
Message-ID: <20200812074757.8AB79862E4@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  9  |  5  |  0  | 14  |
  2020.05.x  | 19  | 11  |  0  | 30  |
    master   | 107 | 109 |  0  | 216 |

Classification of failures by reason for master
-----------------------------------------------

librtlsdr-d794155ba65796a76... | 28
dump1090-bff92c4ad772a0a8d4... | 10
              keepalived-2.1.4 | 9 
    host-mender-artifact-3.4.0 | 7 
               libglib2-2.64.4 | 6 
                 opencv3-3.4.9 | 6 
                qt5base-5.15.0 | 5 
dvb-apps-3d43b280298c39a67d... | 4 
               domoticz-2020.1 | 3 
                  zeromq-4.3.2 | 3 
              bitcoin-0.19.0.1 | 2 
              ibm-sw-tpm2-1563 | 2 
             kismet-2016-07-R1 | 2 
              netopeer2-1.1.34 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
        18xx-ti-utils-R8.7_SP3 | 1 
               aircrack-ng-1.6 | 1 
                  assimp-5.0.1 | 1 
                coreutils-8.32 | 1 
                  dnsmasq-2.81 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-systemd-246 | 1 
                 iftop-1.0pre4 | 1 
               libupnpp-0.19.2 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
               opencv-2.4.13.7 | 1 
                samba4-4.11.10 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     18xx-ti-utils-R8.7_SP3     | NOK | http://autobuild.buildroot.net/results/12cc759f8a74d1b7aa86667791657d2a8d8804db |     
    arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/98ab591a88e06a985b0a7aac5abbf665289134b4 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/414defdc759396d9a10fc02ef3e59545737e157d |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/aca2449efffb6e575ec630cc882636a7ad1c19be |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/631587d25802ff167b5b93412561aa02d99c6a10 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d3548e936b57c5cda311819f58919781880aeac2 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/b1cfd724586d8713b25e5e906f2f942a1f23b5f5 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/bdc73926f1c997c5fae97f84933f202c27bcc2b5 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/56759c86dab1bf78a103c9c6e63300a44733a974 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/4ba862273d21c0b7ecfe4ea65f6da281db88cc2d |     
   x86_64    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/ba55c31def50029be9e154f93cef858b828ec34b |     
  riscv32    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/62c77f4935761d0dc60a367ff857ff3ec43a0928 |     
  mips64el   | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/342abd7a1acfd2a10f093693e35a44ed43d86305 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/20afb1af755c497b8244e816f50952e580a513ff |     
powerpc64le  | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/6bd61ce773855db86f787791248a853e8830047d |     
microblazeel | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/bffecd74743ca42efb5b912b75cc76404910aa90 |     
   xtensa    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/c2e985c9b391803ba7b9eb8b4e2189dfdda81399 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/dd9c7b4bb723b99199db322cbd950b894bd171e2 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/8ed28ad750af9fad5ea3f021b0abc12312afa4e6 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/68bc5043a1b98ac6e617e322933bf7e2e8465bf0 |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/63b04b040e8e036845bb8472b7ff985a7c3ee435 |     
    sh4      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/a2bb3d600d72169013bb36e42582bb0a4a8f793d |     
   xtensa    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/78925765d51763f89281f5f6bf7aa1d7a1990050 |     
  riscv64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/377b63c993cf2d775091d661a259afb0648716b4 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/406390be3c48e08989e1b92d481185db3640fa68 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/29b7adb9388cb6f4f276b60df7f197452c35be83 |     
  powerpc    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/ea3d534c700730c4f255d010e769223d11978985 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/3b546add59029556dd28aaf0743c4c00cd843cf3 |     
  aarch64    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/4ede966dc3ac8a8af8fd94fc7ae32543726eeec2 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/f60b20dbaf41c4fc66639a3ec235423d0b380c4c |     
  riscv32    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/4711257e57cffec7f94e8c69aaadc734b7da4beb |     
    i686     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/fa23374fedf4f8040c8bde142acce8e01195075e |     
   nios2     |        host-systemd-246        | NOK | http://autobuild.buildroot.net/results/a249a3aecea1d7614ccb3083da3ad07378ceef5f |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/aae7575a5d2f9c9d95d53782509d8bbc933d0634 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e16487dd4e12b88306e5a101cb06ceee937e501e |     
    arm      |         iftop-1.0pre4          | NOK | http://autobuild.buildroot.net/results/55a8581f11e776439782c228441ef1c8c1243386 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d7e16278a87dec65947943a9903233d757cf6b29 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d7033d341d9700f6dea4497deb2eff1b87bafd68 |     
   sparc     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d74adbf430b9e20b11b9c333dd0b27ae84e5b9c2 |     
    m68k     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/947c3d2e8f5d7ff69377477091a60732a450e022 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6a8947eac67bc7f78894ec0d87e2f5a59550a6c8 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/7c586f98c3456a6ccab7455bcd07c0dd2bfe75c2 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6b03c67518ccee26ea59ff033460517b661b9caa |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d9e8025049b81343323c2ebd75df48187da2e70a |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/118186bed25fc68bc6f6faf7a3713f0baf7f7ce0 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/af70df87f33b4e477fe05c347f82d7afc74da839 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/0e1f2caed36ab3588cf015f84c70b32fbc535607 | ORPH
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/e7be26767c3976c1c9a9acbcea20a917ae49b472 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/96fc19adc1bbe94611a564f0a8871352a0296d8b |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/027826e27cee5ad817c43991f7a4cab5d04a0043 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/4462322fe1958a9e1e1c3447786d3e2dc6722d70 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/7f7f3ef91f0cf5d88c582ad11923521ad208b6e3 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/251c4d985282703f316f3bb2698a487aa09f75a1 |     
   sparc     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/dd8e67a69ab4c8d87e116fd3df84ed066bb1a5ca |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/475930197d16ef09582951c4c7a828d42053c9a5 |     
   xtensa    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5beb144ea2405b3eb3fab5d041206b52506336ae |     
    sh4      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/1e635616b3376f8fda1e0d951cc333707d23ae61 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/18c4c5b36073d9d6ec8e99ea0c313fce8b202d68 |     
    i686     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/f0d0c7654a15b1b4326d6a396a54ca94e9620740 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/3ad11d78ca51bddfa9dfeb71a589501d50df73ef |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/50826e6f5ea97cad2c4d71ae51b596b6d89132f0 |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/2275c428bd96926f362ace1e01b4e29bdcaf0a21 |     
    i686     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/6cd92204c9fd1face47943b2c883d861d3e900be |     
  sparc64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/4c044f8f008f046359b49e5c3c637eb94d7da523 |     
  mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/3cb94b0d1f2ec51b3571339d763389c51ac3c7cf |     
    i586     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/dbed1a30e1f117720f0bcc60b193a0f7e6ee00be |     
  riscv32    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/166ed5f63b922af524ee7a3db8a913bd8840e68b |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/2b7dc429c827e66ddd7b1e0242369d26cdd6dc09 |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/22118d9e763a8572993a6efbbdfeabc7d9f27b52 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/0a027136afe1111c876dbfc1d02e866160f92d9d |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/934c04fe3401e761b0112f2cac09cbc338876f85 |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/b333916cbc3c84712214cf812b86ab02d95f3b55 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/e9687090e771b794d36fabbaa4e6ff7dca8a68cf |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/109b64fd6f102e633884658a0e6389ff2cb96ec2 |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/972d5410ade8bf8f4a0438c2c0bebb12b1198e9b |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ea52be1da8ed03272db06679d5a0a441ffe6ea0c |     
  riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/90e9ff344a6bd26e6305745f8d9c2014f4fd5dbb |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/9a6be595411461f3d33721fc80f6833c9f6c6b66 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7e7c4e0038e39a9b2b3e27dbd3430df6c06cb72a |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/8a49360c1a98c9155f820ed94dbd03bf85214d2c |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/0d52b8e98bb5d056f1d98644ccfe02e92493f2cf |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/eb025aa4e7ebcbe4e92d9cb7a61f8646ca5bd0e1 |     
  riscv64    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/85b3082ada33f80c754793992fffbecfd089da12 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/5055cb9b4180cb286087165a1f81dae886216b86 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/730617c6fe09e1e4b4adbb52a3bca43c0c55aacc |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1348875ce6eeeefd2121ed4b7d3ef9893aed8385 | ORPH
  sparc64    |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/360014ae72f41e9b939f37142fc50fc3d4302254 |     
   x86_64    |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/d05a07bb9abe8a20a3801ba1082bdfc1b2e52444 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/15aa1398c83b796a630dd6cb35326471b8dc348d |     
  powerpc    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/2ba7bc582706b5f4051c0488566c2e9648b46839 |     
microblazeel |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/0db0ce36c981aa0ccb8d825a65dc3ab7cee1ae92 |     
  powerpc    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3b8df7789dcb28cf01661a0bd26a3569d0686598 |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/508181e718b7c6fcb7e81758af7bc15eee871b4e |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b192383bab108e7732f58c2698d4c501a5018fe5 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/82bf00ff99edf485021cdc9dfc27761dd5cd0334 |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/0b7e8767a0b84a7265b96518f30ce4417ec2c89b |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/a663d38b92b191332941cfa209d10464f4f87287 | ORPH
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/393c919dbf78f74b570221497689cdffcca9baed | ORPH
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/44a96c2a89fb069ed34e61698077c2e6dafefdd8 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/9e6ba54e6e88e83b0ba4744093e140f03df9c192 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0d21b2e7d960fc5a371cea1c06a883d57d7e4bf1 |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0e241ccdfc7b9fc4307235041ae9093dd2164684 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/97a2ca34cf473bb08a1f2adbd10eaeff3b2e5d1c |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/bedfbae8598ec5fc3c27fcbde24aff461f535ef1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e4c724407645d1a6a05186e25a12de71957e540d |     
    arm      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/3941e25f3ce856c4183d0960989fefec7f198e42 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/52b80fe0876165d068cd05d8fd0e6b30c8bd8e07 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3137b6fd8512836167731b76328eb94943840cd2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ba2a9b7e8416a03483c55b89ea27da3553538a10 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
           host-nodejs-12.18.0 | 1 
                qt5base-5.12.8 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/fecdd07e213c13b3c4b78a654a32ce1af5c4e739 |     
   x86_64    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/61ff2bf24aec49a2e5894fdc893e5bfb475d6e5b |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/2c9d157a7c4eee2b506a4fc0a89a1516087629b3 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e1ac26b1b47d360e009878dfeae7a4eedffa4818 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ad61f275e3d65cd5566c96811eecff9ca6ec21ed |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 3 
                  zeromq-4.3.2 | 2 
              bitcoin-0.19.0.1 | 1 
                  luajit-2.1.2 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/918dedf12b2dc09bd87654870b8f29ae5ff61943 |     
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/3a33b8a83bc30a911432ee151cd732b16299ccf3 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/00f38ff106098e8244eb3b9d9af1aa351be013b5 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/dd79676f4f5b5a1ba26c0ff6762f5c5ffc872e4a |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/20bf1365a886768124ff152ab1a3aceecaa13ccf |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3e5cd78a2ecd0869dff14541aedc2062933ddaae |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/58dec757b7a03d8c555692851710c5643e116192 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/8a331dc38dd202f0e32093d012482f16bf9706a0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f63776fb9d633ed1c9ee601e82c9e6411517df55 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e2267d77675b7119f4868fec55254ae611232d17 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7b76fa97f4bbc5f4780cabfb1e137c7081d85da0 |     


Gitlab CI results for 2020-08-11
================================


-- 
http://autobuild.buildroot.net
