From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Sep 2020 07:10:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-31
Message-ID: <20200901071025.BD27486267@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  4  |  0  | 29  |
  2020.05.x  | 19  |  4  |  0  | 23  |
    master   | 150 | 36  |  0  | 186 |
     next    | 23  | 24  |  0  | 47  |

Classification of failures by reason for master
-----------------------------------------------

                rocksdb-6.10.1 | 4 
                     avahi-0.8 | 3 
  gobject-introspection-1.64.1 | 3 
              host-grpc-1.30.2 | 3 
                       unknown | 3 
                  ndisc6-1.0.4 | 2 
                      tio-1.32 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.6.4 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
             kismet-2016-07-R1 | 1 
               libtheora-1.1.1 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
                    pixz-1.0.6 | 1 
              python-pyqt5-5.7 | 1 
               trousers-0.3.14 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/68bd37ea76ac9cd9608233b78eef0a1d7d793bde |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ef1fcd57e0c09a2806bf2272bb21df6d3300b45b |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d27cff5088a9057b9eb9ae1897adccd262d72f13 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fead4ea2fde6e79449d420cceead0c85de9c35bd | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1084678ef9a8e049141ccd20a2505d527c1cbfb0 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f6f34ec296aa19a9895a6f50f79680a0c75c6bdb |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/48589c30b5c5700475818fb9cd19515b909e1708 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6c52b32e920a2b4e128d8cd858bb28c881afec7a |     
    i586     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/6fc5b6c2cb9dce098634aac23d25da9244858986 | ORPH
    arm      |         harfbuzz-2.6.4         | NOK | http://autobuild.buildroot.net/results/9ebe1d11e80755d59190ef2aae82bbba5cc45e44 | ORPH
   mipsel    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/104c5761c5d9cfc1126e444955273c98cde83491 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/02cbd5259494ac787ccf67476022851d20dd938c |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/f1afeb7df211980ff7e4a0af0dd1dc8cee866b49 |     
    i686     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/141dc5df423be1c048614f6069b180d6dc8e903a | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8533d202fb29bf2a1677de37fc71f1a0fbd54722 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2502c10a2b1949e14dff94e7405adb5987dadf87 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6e7c7282f5b5251084f50e83c07472f0dea1c50d | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/2f6a80019898fc9d514879d25496dd8bdb1d188a | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/a90d04e52d2472fd12b73136398ab7f1764d40ec |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0862509b3e1bc46c152f48c22a7de40ec9f3b789 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/25fc13c2818dcee2210e9a3e4072b27149541978 | ORPH
    arm      |           pixz-1.0.6           | NOK | http://autobuild.buildroot.net/results/0c61743d4a022215317e57e35a00f0fa3d16ad62 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/7089ba39b94129e49f93e3afed60e9dfc4b81470 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8bbd50fff550fbb8dc8dcb267b0c6b06a7651789 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/fc112052260d1811cabbcb9363747669930e4d44 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c8f65001f162609977a283ea6e122554959e94e7 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/dca5322c6d3e5266d3c671cbbb7b30eb45dab7bf |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/06b741fba0ebb88e630f5aa253616ec43306829d |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0650a64f159ca8c273740e196e44199df57b5dd4 |     
    arm      |        trousers-0.3.14         | NOK | http://autobuild.buildroot.net/results/701e82a8f63e8b78c2db12bdeff9086d6e121b36 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3287a602d183d9049cd2a3a7b156eec19fd92a53 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/22163ff64cab0c6e0fd203c0d443fd593614abd9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f26e34372e710386f4de34d3d957719f3558b1a2 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/10ace1dc747fc538e179175b0390cffcd64338e6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/33a9b7f833fd76c36ba11088c6d83e5b68de2c5c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/044002ec63eed3c65a923dab18dbffe6a829c6fc |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                coreutils-8.31 | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
              rsyslog-8.1911.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/38b273bd9432e793e612517e380d4a4b0ffea71b | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fa10200a327761136697c2afc0c2a91ce9bdebca |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/0fea8d2bb9e2d7dd3626dc2e0b26e7f7deb9b3d1 |     
    arm      |        rsyslog-8.1911.0        | NOK | http://autobuild.buildroot.net/results/4b3688d9b3801c06cfc3bfe2567ae25601d69600 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                     avahi-0.8 | 1 
             kismet-2016-07-R1 | 1 
        qt5imageformats-5.14.2 | 1 
                    xen-4.13.1 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d319288b09a51fd8cc2c305d2dbb58f4effef8bb | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d414f18ceb14f7434bc5e9afbb6681e64628cc54 | ORPH
 powerpc64   |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/655cdab2108adf5cb9b8b400189d07325b5f51cf |     
    arm      |           xen-4.13.1           | NOK | http://autobuild.buildroot.net/results/28cba71a74a538694b0d700f74001108138069fc |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 4 
                  assimp-5.0.1 | 2 
              keepalived-2.1.4 | 2 
               libglib2-2.64.4 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
     dovecot-pigeonhole-0.5.11 | 1 
                easyframes-0.3 | 1 
                 gnuplot-5.4.0 | 1 
              gr-osmosdr-0.2.0 | 1 
                   libcap-2.42 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
   sofia-sip-1.13.1-d10a3d268c | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
           wayland-utils-1.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d29cf8eb49d077ebf54db592b57eb74d4f7a856b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/35b33eb15d61b55ebc77ee1be9ab67b913c1b2fd |     
 aarch64_be  |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/3f9009760d61f02d435975925d3454ff176f4b42 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/2d178358793ab1ca0918129267f9c368ad688c95 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/1327067c10709f246b87cd2a7081f6e95f5a09c6 |     
  powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/ff3316109fda13337b0ce43da82aae7b71ef29d3 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a83d5507af78a31c76556ad448955ac0845024db |     
    mips     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c57934272b3891c261888aab41f057978bd9126e |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/735ed615a804b6f023280b3c2c2549f3ef180c64 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ec20f99891043e9732b07df48bed2aaf61b1f7fe |     
    mips     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b27c72771885c01549d1ebf3deb816794ce5fabd |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/def2ba80e5510fb235619ea02a132207ce0c579e |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/629a14d642f430945bdea68975eec9988719a681 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/db4fad71dd109adb4d20d6551a35a41c65da6e8c |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/fb998057d170ee089e4ac1f88aba1520906a2da3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6f3563acb0f4e01f677aa7a617349827e153a5f3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d4bd24435f04157b4f32f6506ad71511c9de0732 | ORPH
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/d5cf3e3d7bcfa2bf7cf22910cd03c5d6b7b9cc7e |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/9c583a0f37347f88e6e4efaef56cb86900bf5ecb |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/414e76b433767ec5fcb55797eed28c5f91ee2cea |     
    arc      |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/0f2a05808f26321c7af31fc0391b13fe2e6c75fb |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0cdbf01df174648cf0dfb34d9506eb80570e99c0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/088ac62605792566ceebc1d35cf47ba8abe99f8d |     
    arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/01116cfc31fc2e54c07541e5eb0ad99050d7cf03 |     



-- 
http://autobuild.buildroot.net
