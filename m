From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 May 2020 06:28:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-09
Message-ID: <20200510062900.6650620378@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  | 11  |  0  | 35  |
    master   | 191 | 85  |  0  | 276 |
     next    | 17  |  9  |  0  | 26  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 5 
             host-squashfs-4.4 | 5 
               belle-sip-4.3.1 | 4 
              host-erlang-22.2 | 4 
              ibm-sw-tpm2-1563 | 4 
                qt5base-5.14.2 | 4 
                       unknown | 4 
                    atk-2.33.3 | 3 
                    brltty-6.1 | 3 
           host-openocd-0.10.0 | 3 
                  rygel-0.38.3 | 3 
                  assimp-5.0.1 | 2 
               collectd-5.11.0 | 2 
                      fio-3.19 | 2 
                   gssdp-1.2.2 | 2 
         host-exfatprogs-1.0.2 | 2 
           libusb-compat-0.1.7 | 2 
                    mpv-0.29.1 | 2 
         uvw-2.5.0_libuv-v1.37 | 2 
                  zeromq-4.3.2 | 2 
               apparmor-2.13.4 | 1 
                  c-icap-0.5.6 | 1 
                  dnsmasq-2.81 | 1 
                 gnutls-3.6.13 | 1 
              gr-osmosdr-0.2.0 | 1 
             gstreamer1-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-audit-2.8.5 | 1 
               host-efl-1.22.3 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
               json-glib-1.4.4 | 1 
                   mimic-1.1.0 | 1 
                mongodb-r4.2.4 | 1 
                 openal-1.19.1 | 1 
                 openssh-8.2p1 | 1 
             paho-mqtt-c-1.3.2 | 1 
               protobuf-3.11.4 | 1 
     python-argon2-cffi-19.2.0 | 1 
              python-pyqt5-5.7 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                    strace-5.6 | 1 
                    vlc-3.0.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/2d56a8e212a17f849489e8c05067cda606cdf58f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/cb4ade7fbf424a8f553eacf6d28c8e0981a9889b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/535f470b39c21a55c9ec9af2068734545587d938 |     
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/02b2e97d061d3a8c859d8dd45ab19f43de798697 | ORPH
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/34c5e9731a15a04e4feb07293f34da230888db5a | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/98680c965c0f4385f6fb4158e387794424143d8a | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/12147f7fef79a4d0debc5ffb186408be4bd684bd |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/3b717973ebcfefadaa533726c2541ea0e83ac66d |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/75d030e19028a04ab351a69a851b49c743ffb659 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/c90f68d29145a2dc5c31ec6df9f0b123bfc17d1e |     
  riscv64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/dacf609218da3e5005f8de4fff905341ea2cb653 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8052545ce3a9dc5b980e63d2d68b208a87fbf8f9 |     
   x86_64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/51bd4e7380a62a5209f1e635903d3d6fd3cf0aa4 |     
    i586     |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/f9049d8b439a43a4508948bfaa5909dfe6049201 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/67103ac2cbf41ed48866a39859efca29c5473095 |     
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/f5b21498dba131c786592961a612650b3e7c2317 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/be1daba28e1b77941c516af5ade7979362d43f91 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a52bb1c814125c76f72c77035aad7561a9b7befd |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/23ddec1ef4274b822ee462b849952ac60c0633ea |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b45505d591cfb2d0ca138f5b064d27b624d65fc9 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9a578be0c1fd39f525ceb759efe41b5642fcf7f1 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/15b819b6b76864746488bb2be85cf140e5e897d5 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/79d46ffbeffe42dfd8d1a28576f98312e2e71332 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/4e07ed3d58b5e93531f1f4985344c478b1932e15 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/057b23204281ba0fb2063badb6ba8af3a4ea0e33 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/cd7eccaac37815d1eb8b6c1ff1a88ad5499061fb |     
    arm      |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/15bcfa31c7005c62a4a3aa4ab285d0e7ab5754e2 |     
   nios2     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/5deff351c8600ba56e0308da6f8e27a262fa2ec4 |     
 powerpc64   |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/17cf668096edf9d902ada0bf6f342e90c57ee83e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f4b8ad2a71481905ef484347454396a4e922be4b |     
    arc      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/94cf26eda2b7e799ae5fef1c6a1ff2ebb61002f7 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/9e0889a11544b43af9dfb6a43bd70c7fb8a9af02 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/171db559442fc7351b57688e900830204b1867f7 |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5fa53491212cb857869c82728e72d120111b1ca7 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/857c9bb159966e37220c0470b092742805e1df65 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1b5d257338b9c229b0e2310275c4cf4b032c24b6 |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/183d276270624417bf6e4ebde2a794bbed3c59c5 |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/c8d5c2b6ab76a04b5900da9d14f8c47867f7839c |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/045a38a84f04e82cbef2b79d5664e76ca6d584c7 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5215bc850165d432912b00f74e93d18c9798b454 |     
    i686     |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/fd05a03f9c65446039985b5db0dda31607b9dde8 | ORPH
    arm      |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/ca199555c0de0ac0f6c22c5ad1623f559105b8d8 | ORPH
  aarch64    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/fbcbff0785cf6258e54125683d7c76fe5b55cc72 | ORPH
    m68k     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/443acb7c8dcb7556bc0befb4eae48f2489092e32 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/0fba1104442020c556f47b2f03986a79c3a31469 |     
    m68k     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/11cfeaa21456d5cbb64e8bd237a6270b6b523476 |     
 powerpc64   |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/12cb3ce2cc71ce99a2beb36bfed63b08d2b9a4e1 |     
   x86_64    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/35f6b87150503b9fa120cb3a3c47d74237dffd63 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e663ace374b93610e7f3c0042a7252442183e5d7 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/388c925707ad592fd789be8b4a83eb1a6d24d7e5 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9f0fd81afdba8f73f7f7cbfabfa0619eb169971a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/263b57b6271345186b682db2e2d07f52f4e98710 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/171fb58a53453a757bb235fcb9404fa2359e0669 |     
  aarch64    |        json-glib-1.4.4         | NOK | http://autobuild.buildroot.net/results/0867e6ec278b5cbcda4be2e5c688dce3ca91316a |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/b5cd6600ff7203d26762f3fe73bdbda0517b8f58 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/6527631041a78d85996ce12624a1a7969a26751b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/68c22f6925e1b245364abf0ff9bc00dc89532534 |     
  aarch64    |         mongodb-r4.2.4         | NOK | http://autobuild.buildroot.net/results/7b3707314c2c58e4f5b486a547a7caf118f537bb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ecd04d6a967f7751085f01f4ecbe177ce0a40a99 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/82e10c787bfecf3db76075f802e11360f40f8c97 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/c0a3f72e0091697dd0bc07fe10f3fb665a3188db |     
  nds32le    |         openssh-8.2p1          | NOK | http://autobuild.buildroot.net/results/83735e384ce883d9b540d1c90e1d168afd78306c | ORPH
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0f07835c256fb94f5205e9fe7d47ac92e1e59eba |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/e9852dce195666a5f46cfe5074d80237044d0417 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/87728df6695e253ce54810070dfea6ea33a08f5b |     
    i686     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/99ba7974bf0fccb2924a09e901931e24a8b37ec8 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/cce4e0d340894684d6c4217f69f8f9d1a4cc5d91 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/44f2b42519967a8f5bd8324ad3b77ffc7ca82ad8 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ab623253a6d988f4ee03d292ee85f3455de2ea25 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d21048dc2cd806d66b1c62306b5542b47f42f8c2 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a7685f5c4c238f8944fd1add52e9b316004a5a7e |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/cbb9ed09ba5c2cbee8c7c1eb8c781d8f05437e8c |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/21ec2074e219dbbb953b6fba35cd181bfc4ed1f7 |     
   x86_64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/12d9f34e7a425a3eb328b3ae9e6efcd23f2f6ea0 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/55f31c9f14a528342fddafc686947e78c49c9151 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/143b5e46cb633d084c89932f32c6757e377bd53b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7781456b373535e71de66dfeb16812eae09cc185 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/fb19dd6800ece40443ad9b8fa16fb267f0fff104 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/070483c5384947309e737a0fc16e6fd6bcffcbfb |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd92c97d8189b9a6eea1e8b9f8c0cdf017415f65 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/5abeb4637c5ec8b0ff9985126b23e5b79c87ede2 |     
   x86_64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/094ef8f174388a30d2b46b5a3e277f81b718f5c3 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/d54ccb40042f23002982c93435d6f26b4fa07d60 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/4876964a94f5e698daf323222599cf997ede228f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/00c7f97509c1178a2ef69c967dd46a7ecc512ef5 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 4 
               acpica-20191018 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-libsepol-2.9 | 1 
               log4cplus-2.0.5 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/3b5084d704619f45ff59a0b90f1aed572b7eeeed |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/558e2e04e8cb05d9b9cbf3309452d93f41b2919b |     
   x86_64    |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/ad772fa390cfa84c5daf81accb18705e7dd2244c |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/e52c91dbbf063a8d1f12935c1544e22647df18ba |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5e63c6036306a37935a3e921eae85b14643c30c5 |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b34f0eecd8be3d4d736ef781f939464cbf33682e |     
    or1k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fb0d446398a37b39a1fc13bce6967fc16702f0c5 |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/04be019b27fd28dbd0d2c10ba51db0312f68413d |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f5faf0027b03559d21c1b5c999757a9b7a81a20c |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/0b9a4596abc02fb2ac6b42ba9d6ee58fa010b150 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f01683b3dd52d6cdfa3ca8e0097bfedeb0b23661 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 2 
          host-checkpolicy-3.0 | 1 
           host-openocd-0.10.0 | 1 
                  ndisc6-1.0.4 | 1 
     python-argon2-cffi-19.2.0 | 1 
                qt5base-5.14.2 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/a2c3272e780ed0294cefb59a7dcbe19a07496592 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/9af8f90b96bf5e5e5fdd141bd0ebf557935ef963 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/3e981a8c81ee3cadae1f0d5c4a3fdef04bb259c6 |     
microblazeel |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/f680ec3f8a12b2358763777183e036e285fc7709 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1ebb6740cca9cab8061d0452d1f1793a60bf1251 | ORPH
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3e265e1b961df0cc9e33a53c901804085db55a42 |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a6d2027b0a8c4e1a9c77675b02eb5bb72bf0ba34 |     
   sparc     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/d50f1119f76b971e6fa81239a02952cc925b6086 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a953edc25ac1cf956de6d6ee16e1f46b714369b9 |     



-- 
http://autobuild.buildroot.net
