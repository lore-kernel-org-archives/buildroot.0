From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 07:58:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-17
Message-ID: <20200818075812.52A4F87590@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  1  |  0  | 27  |
  2020.05.x  | 17  |  5  |  0  | 22  |
    master   | 149 | 63  |  0  | 212 |
     next    | 38  | 22  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 21
                qt5base-5.15.0 | 8 
dvb-apps-3d43b280298c39a67d... | 5 
               libunwind-1.4.0 | 3 
                     avahi-0.8 | 2 
             kismet-2016-07-R1 | 2 
            lttng-tools-2.12.1 | 2 
                 openal-1.20.1 | 2 
                       unknown | 2 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
               collectd-5.11.0 | 1 
                  dnsmasq-2.81 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  ifplugd-0.28 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
                samba4-4.11.10 | 1 
              spandsp-20180108 | 1 
                thermald-1.9.1 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.11 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d2e540bcaff135efb4d1a42808899cf14eeedae7 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/dfdd223a9bdfa416ea0e66e521dbbb2f08960133 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/94e48c44b2033c48a332ebc6c5c4c29f60319de1 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/820ec9d77aeee82fa208783d3bf54a896d272776 | ORPH
  powerpc    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/5b951b9a88b9e1e512cda41fa40bd70ba9d2ec25 |     
    sh4      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/f17fac691773f7d812e4eb26db56d17587587eb3 |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/43520f68362dea7c6eb84c22cf7a0fb20c5a205d |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c7ecd7efe3079cfb5950814df66373f86babce73 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/a9ddc956c34e014c5c58e057d7b774935d52ffcb |     
  mips64el   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2636d8a0024e27e7669ea3f26c7003d6017543f6 |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/51edc80e07d43399504b50d3e1bc018ae1b9526f |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1d4e2e9244976874aada7066e92eb0b77e3989a2 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2848836c266777f519fa2eabef633285b67f86ac |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/12bb9aaea83f8f6abf4f2fc2465275e66278ee9a |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b50957c8948fc9074177c371f364f0fda278838f |     
  aarch64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/58eb80e58e9ad41e7f747719886110322375e905 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0d4c1f77583e95e48a1ae9418cee5a08844bbb7d |     
 aarch64_be  |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1dcf483cc7758652a1b4051c3042f53ea071b6bb |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ec3214e74c3ce098a41f2c1c039c43d6833d89a0 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5519756b54c1acbe5e45c6f68b88e27e4e301dae |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/83fb0f0201c3bd1758f4239f7f14adfae5541216 |     
  aarch64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4e86627a9b1c8be7d282197b20b0464755b6e1cf |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/48f7bcb498dd56027e4683352977bb1c366aa904 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/74eb7604307f1572f01d21690eb6b077e48a1aea |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3457f7d6474fb812dcc1c9ffbbc9983e8120abd7 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/73383d63a97892b5e6762feabc054999788bb5e0 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/892832bf1f2e33467407b55403be97d5054b283a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0ab98e30b0c0e2bcd08ae7097ee59796c2b654e3 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1bbaa27c6f9e7c2dc32c3a2fcc35630b631d1527 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/55522742438af75161f66b8fc0e81d16a34d4296 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/60a26893846a3826e042b77762c82e993965e832 |     
 powerpc64   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/980191a52b6cb85768451e8b73c19b5659a1e538 |     
  riscv32    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3eabbc5419a9895a47fd3fa37c056eccccc0e143 |     
    arm      |          ifplugd-0.28          | NOK | http://autobuild.buildroot.net/results/63f7c6fc4a2a30c8eb0298856a2615f816d50299 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/feb2d8401405ab26ef19cb6704c54a7f782074b6 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5a964a0c94990371127670b5b713037eb6be29e4 | ORPH
    arm      |        libunwind-1.4.0         | NOK | http://autobuild.buildroot.net/results/dad61a90a27a97f275efd238ee22be704eab0063 | ORPH
    arm      |        libunwind-1.4.0         | NOK | http://autobuild.buildroot.net/results/48b25726a37dc5d3e2f8c0b62a129f5b0516d03e | ORPH
    arm      |        libunwind-1.4.0         | NOK | http://autobuild.buildroot.net/results/ba7bdd3afbd54457a7ece14a4521e4923dbe4ea5 | ORPH
    i586     |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/238a694fe3cae671db15f65033ba7f4f00ab9cbd |     
    arm      |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/0c49b3e90361ced63cad4807dbe1b13c595f5f97 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/eca5096a7207ebc60adba78cb1aa435f3a5dd909 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9ec87847190fe23f03e0081f52a42580ed60334d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ffb6b6f0ae418470ed1e12fb1eea3d703f1607bb | ORPH
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/4a7a3285f6a17d603c01358f586dab47b4cb5b82 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/054a11caf1961af68fd89671d023697de67e7d18 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c9c26f33f03bdb13d9c3d82ebb4c9d3a9c40f34c |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/6ff4d261237a324308dfacd7d08cfc43c6aad61a |     
  riscv32    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c90f23780a1baecaaf3ccdc7c2ef87422cd9ed50 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/923577c52c685ce7ffb39f062d9de748a3219a4c |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/47f686cc90e965721874286cdf12d7d25867df9d |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b24e4d18d2422cf9f9ee34d2d6044980ea187191 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c0222d45b4f82defd2bdc0c1d5a43f496e24a041 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/28103b31572f7611cfd42142b4b7811e539f7ee9 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/545732455200fad27e69d9928605652b2b6fe138 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/937dd7a2f85390de05dcca14780b8f28257f662a |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/62f75b1ef94c920b272f6c0de3ddca1e65eca9b3 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/80a126c225a9e9cbfdc30882c4ce00517d853d8b |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/8216430ea476ad379e4c51ed0f474564fcf6d67b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/58d052569e782e8154abc445c21f4dc0f760fb1f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7af4803ba2d9789f149cb92505998592e94ce3d1 |     
    i586     |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/a0bc5fe6913baef758923404701b0fad4e9d442f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/46bd754a37ac4e34c4f52ce1235b29ecfafbb667 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             host-pango-1.44.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/82edfde47963afe7aaf9b32f548601282e8c3a96 | ORPH


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                  assimp-5.0.1 | 1 
              asterisk-16.10.0 | 1 
               log4cplus-2.0.5 | 1 
                suricata-4.1.8 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/71e6da42be7a24e0cb68ce964eacc5f25d112b90 |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/242a0d024938d60213fe3bf475c8d1ece7174977 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/aa03c786a2e3db5e852abeb80f89f23b28b4ad05 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/8aaa86c17109963c200925a75305202a70a0f183 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7b644d0858265ee565d67c7beb8b8507752b8e57 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 4 
              host-grpc-1.31.0 | 3 
                  boost-1.73.0 | 2 
                 gnuplot-5.4.0 | 2 
               libglib2-2.64.4 | 2 
                  assimp-5.0.1 | 1 
              asterisk-16.10.0 | 1 
                    bird-2.0.7 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
      gst1-plugins-base-1.16.2 | 1 
              keepalived-2.1.4 | 1 
libcamera-565f95d64ff92e871... | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
              python-pyqt5-5.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/2e6f998716453cab16ba1c9d30ac740a5153c74f |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e4853f8d542e10d2faac42fbfbc0ad0c76c1e6c1 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/572cee22987bccbc08c87d5c8111c1d05f3e90d6 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/95642e75a9a790970907f3ee29c8099b14023187 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/3be3e747054883cd0ec816829c59e4e14b6ecfee |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ef9ec7a3026a1ae45df9b6debaa81853e508837b |     
   x86_64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/51175270383a5b78e45d7f0a8c865efacedf1302 |     
    m68k     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/e7d6e8b938a38df5fcbbe63b6e6c71a53864976a |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/ed3df76b6e50761f91de93677438048bff34b9bc |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/fb21f0912ebb1f50fa1d22684682261d5dae67d2 |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/67f2ed1120167a8bda321a1f9aad4123dab2f12e |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/1a90edf78d7a3b466c0aa5937b347475ff99b26d |     
    sh4      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/30fda3f70f7271e06771b68d1fbd7d4d6f331c9b |     
    m68k     | libcamera-565f95d64ff92e871... | NOK | http://autobuild.buildroot.net/results/554a9e4c09e3508833c7e502268cd1cf30e286c7 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/f4012e881a1d26389fdd2cccec2ee041955d2d65 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/f989955466c22055844100b12dd6c3a59cd3df4e |     
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/a74c02b49a851f9f086365c6913ae9d7c58fac33 | ORPH
   sparc     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/4becd968698212b54e1f7f2e747bbe5330928747 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f9401203b293f6de2268368f266bf7cb79c7ce59 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d6eb6b069008ce91ab1e51ae53bf16ac314e59ea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a13c992cf773f01ae859bcc1c43865cfd30316b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ad3e034cd1476acdf1066f695929b0ce8e404d77 |     


Gitlab CI results for 2020-08-17
================================


-- 
http://autobuild.buildroot.net
