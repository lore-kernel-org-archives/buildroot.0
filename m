From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Sep 2020 07:11:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-24
Message-ID: <20200925071202.077EA86CCD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  6  |  0  | 30  |
  2020.05.x  | 38  | 14  |  0  | 52  |
  2020.08.x  | 31  | 11  |  0  | 42  |
    master   | 156 | 100 |  0  | 256 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 19
                       unknown | 5 
              asterisk-16.13.0 | 4 
         libcpprestsdk-2.10.16 | 4 
 Makefile:752: target-finalize | 4 
             babeltrace2-2.0.3 | 3 
                  boost-1.74.0 | 3 
                 fwts-19.09.00 | 3 
          gst1-devtools-1.18.0 | 3 
             kismet-2016-07-R1 | 3 
                   libcap-2.43 | 3 
                samba4-4.11.13 | 3 
               apparmor-2.13.4 | 2 
              bitcoin-0.19.0.1 | 2 
               capnproto-0.8.0 | 2 
dvb-apps-3d43b280298c39a67d... | 2 
glmark2-c493520253fbfe3676c... | 2 
                   guile-3.0.4 | 2 
                   libnl-3.5.0 | 2 
                   ncurses-6.1 | 2 
                  pango-1.46.1 | 2 
        python-m2crypto-0.36.0 | 2 
              alsa-lib-1.2.3.2 | 1 
               apcupsd-3.14.14 | 1 
                coreutils-8.32 | 1 
              ejabberd-19.09.1 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-4.3.1 | 1 
                       frr-7.4 | 1 
              gnuradio-3.8.1.0 | 1 
      gst1-plugins-good-1.18.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                harfbuzz-2.7.2 | 1 
                 libpcap-1.9.1 | 1 
               libupnpp-0.19.4 | 1 
            live555-2020.08.19 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
                 opencv3-3.4.9 | 1 
                rocksdb-6.10.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               target-finalize | 1 
                 uclibc-1.0.35 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/7580fd3589e3551838b83499a9c1f78058f0aaaf |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ffd41fee860d8716d85039fdf4aa75d5b18bfab7 |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/cffc122f602ccd8139ff7f5fd1d846433ed62bb6 |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/7533710a1612c2f8c46042942751264713c2627a |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/e96b376f1cb8273ab4dadc7cb80fa58c30a610c6 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/95381154838e237dcb608f81f58b0369828edad6 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9fb4b39402e3a425d2e4f8f6b83b2887ed603ac1 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/bc9903bd72f91628c2a3fc39914bed496aaf63aa |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/e460b034f95b6fb032c3d1de08b78c49cdc106f1 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/c0dd5304a7a16aecc6044c2600048325e989cb61 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/619f2fd0d6d5064d5cc21b271ff2784ea9c0db1b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f71d4da3e501234980f33c8c06881c2310c9f365 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4603e0e6bf45bcdc9c94bd75e8fa532d38732bf7 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/59af3eed0ed33a8417afc085de3a63a51776e758 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0403f70427c5877509a25644b8306faf06e18895 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/75b6265624c0c96416bb89f7170fd4a7b8d64dbc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2a6ae7aa94723de44c81156548ed7939b393e5f2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a16aa4cc9971335586a08e4cf278cd245930a2e6 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6ffeb6234f359498083bb4fbbc7388c94d5fee26 | ORPH
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c2fa137ce5a076f851853c517fe04f0e0d709483 |     
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/b6a526b4b91ce4052ac17932b53956aa39f6fdf3 |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/c18ef3b89871d21c9ff74c03d6d5e8c6efe0b143 | ORPH
    sh4      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/444d21ecd0e52de653663436fa0654a80fd3708b |     
    arc      |            frr-7.4             | NOK | http://autobuild.buildroot.net/results/5a1f70ea07ef50b493db4d5f9013a53dbe99a254 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/9dd470b1b0acf93745efb4bf92dd563681cbcab0 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/f6609fc833c335eff6e7aed912ed82744ad1f8dd |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/79be13dcc749581c684e29c7a460cd7182541497 |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/b8d43fad291022cbc6e43988fe6bec14f594591a |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/6106f07602c014897331daac3de01ac4a74e2016 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/6d077415bb0a836494d743164ce2a3796e7f93cb |     
    arm      |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/77cba2b6be51ee018fde36e3c532b7e14414e2d5 |     
  riscv64    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/92052de4c8787e00ffe37bce1a536909fbc5b04e |     
   xtensa    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/724b64b063e2ff92a614c3c6c38fe9b129bb16ab |     
   x86_64    |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/ba445b10a330e05f6f4b97a3d9ea6fc7cb4453f1 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f2bf7a26cf848904152270f094a43cab8d2a2f4c |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/e3ca862b6b5652474c0bf627e092968c4bd7fc09 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/faeb1e137a6aeed763fb3a2542b6706ad9a28dc5 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/176af581d7540f28a007db03fd23949c6e73ffc3 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68b995aebe18d92e5c3223951024c954125d9fdb |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b259359c7f679b612deebcd77c6ffa99f85b5d0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1aafd285faf4e5afccbe6d55895c332fbc0475b1 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/713cbad1590718bd4fa64b06795503138b0e6a0a |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5b5f58e30f87180e454b1bdca09678f428948b9b |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6049184b735dc82911ac746826475a4da639d062 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8f24a60cf7283a820ba7113ca5da31c19d2ae33 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2d445e7ff2be9da54fb056ecf49ab5a9eb743d85 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b568c96c25fe27c8235dfab4c8ff69ac8e058315 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/393c4f500596055dd0be96ad6cb2ac8366092d55 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9cd91feeefb5aca797637fbb6e0c1257ac92487a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6bddbf04c1d8e16ba6480690cea25be85e653e4e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/608bdf62b10976632bda6dc0ec0c87fef8a714a4 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b819773347191e5751c067bb805bbda8263b02d6 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ebc59e3813a151db00a514dd1544c006885baff |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/caa829885f7b93423b7a18f4c55ed4f297323065 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0e2b1d5f5b62462cf8f7896f377eba916d4a7727 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fed3f73bf48136f21bba632413e680c8cda5b509 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2cd4cfa974a34032ce366fec4773023fc2e5b3bd |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3e6ad26657a06ce56bea8c7dc6e4289c40f37b0c | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5eefdd6955b7a6197aedf1d7f3775b2ac316760e | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8659ea6fc872bd663ce70ce6427611b351dd4275 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3490da814d0045b844a77d53f9af34b009b8d195 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3d81a13689ad7bbcb7bce8b89279f99504b3a92a |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3dd950fe2e43f6705d42a903972d66528f0f18e5 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/341d54a9bc70b410e883cb023c3b585f053099e6 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/3f4a5dbee9f71b5186284cd553ffbe4a6fffbd91 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/8bbe48e0a5a329ae0a471323bf21c53fe7cab43b |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9422311581c88f8fefd21cc3f54ea215e4977385 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/6e1b9fa4566c5f313c5a1861706b5e32a9f9f58f | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/83a69a110d195e060eb935d322a78dd92c1ec10d | ORPH
    arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/39fdf31e2753e9746a7a68206ed34bc29dee9687 |     
  powerpc    |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/a8139c3ea345d9ee617dc81ff15a6f0440e473a2 | ORPH
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/52fc7b2eb8b41abadd5b56dd10a41ca538058399 |     
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/9b95dcdb503f54c40a45e39493c68cf433748f7a |     
  powerpc    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/7ebcbb5f9f6ca098f6f23fe62e7c617f9e6248c8 |     
   nios2     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/8de965ec91f025f13571d0f6fb2e370fe70bd240 |     
  riscv64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/b675e5dd06c2ac87b47b7f9e9e4266ccb6923cfd |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/5e18588192f42e4f8eafe0c214782a666f8a6018 |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/db7107a85e48381418bfa0d4a036e8eb31362e17 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/7ae53800f7c317ae8b2a9a122d5cf01bb6c87fbd | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/9f27614db53aca54df0458aebd1c9d3ffb68970a |     
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/3357225ee2d8392bfd57af91cde04a1113e03493 | ORPH
    arm      |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/50435faf662eda7e150c3eff68bec29af4a6136b | ORPH
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/5c597947a794d7d56ce8bf0ac04412b88c987901 |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/08462c37d566a3bfe628e2c19c94afeecee6ae4a |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f5cc8681930371a160576bf423d02a0c0dba3823 |     
    arc      |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/d90106acdaaef12b545c2b74176314fabf32b578 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/7efd99c183dfa596adabac33b90dfaae88fe7b8d |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/a1eb600af04c89bd6326cda86105f68e4fa6f35b |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/a4c15a947cc7f7beb9f146cae2400742c3e0fd6c |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/4cc04c3155f4b555f79dde906235658d21cd3771 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/37f4402bb88271a00606e037eb864a4db685c52d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c68e5bef68fe53c82065056c5ffc42e6df3dea81 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/9e0f2e5182f2a4108bd6843846e131c16225e860 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/68044961154c4d3a0153761eecc430eca3d0823d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/52eb520fc08f36fe98c2b7c1d187cb5b33b5b2ee |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d8f0de02b0a188ca758ab9c9fbbc9a96128acb58 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5f11e533eda136351fd84d9be29feb2c99cb2d3b |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/7b5806ccca90cb9e4da2c63bbabf7e5e33f878c6 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
              host-grpc-1.25.0 | 1 
 Makefile:753: target-finalize | 1 
                qt5base-5.12.8 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/1ff1c8c195e2940ee028d0d9c773271ff01b906f |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/08b55b5f6fdc456c1aebd7a16ccdfa1cfdea3602 |     
powerpc64le  | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/df683a8e590cc8c04c9723f07ad611f72f57e8f4 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/f00346a3c858949df83af09f8a20401829caa2eb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4a5f4293720bd6d038d0bef5a98e3e73f2bcb31d |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a962768b22b6b15f73740e44571e1dc66143b974 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
               apparmor-2.13.4 | 1 
               belle-sip-4.3.1 | 1 
            ghostscript-9.53.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
          host-acpica-20191018 | 1 
              luabitop-1.0.2-1 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.14.2 | 1 
                suricata-4.1.8 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/0740687153652e9aa487de5ac902ab96b534a711 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/62a4bf95ab90b87a7a95a48f0062221ea0a4bc15 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/d63194fb43108a69eb938fd13fcb0f0b67c00351 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/0781d428ca34031478ce6cab33fb910bc23f18ce |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/bdc195d90e55d04dc41221bed833388c904369d8 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/70a000f8581f85586100665c20e4667aa60e5a06 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c76c202ec3ddf385b37cabb480af8a403c251d77 |     
    i586     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/9b07a1f9fe38e910647d20e7b08292df6b937c41 |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/dd063027d7d9aa1127d8f1750311286688a8e33e |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/d8d02d1ef63719ff78a9c2cfa276713ed5959a4e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0f6583b1a42c0be8fb3288968e475ca14dd53d7f | ORPH
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b5c9bd1200c28b539168a1e55599d0429d691bbb |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/bedce1b20476aff8769c4aef1c3eb4252bed8831 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/81a7bb14787b809e4b032c26125edcf9421d97c4 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

            ghostscript-9.53.0 | 2 
 Makefile:752: target-finalize | 2 
               belle-sip-4.3.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-go-1.13.15 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
            live555-2020.06.25 | 1 
               target-finalize | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/164e66d7debb64e209d0ceff29b7a9bf3c6b1aee |     
  riscv64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/56dc2c032e5f18e12c0c9b6efe56da1ccd699ae5 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/92d38700a346c70fdc7000c4874a028d8c7998fb |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cf50a441693ed8f8190df213c8898ab636be9991 |     
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/01e4a1941cc3b632efd9a35c06b94a162b47eff2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b4ac2f998337ce2b5e4c24111602ccaef872af05 | ORPH
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/d84d798de66b9b1ccd5c443eeed57134b04a7211 |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/3b58375b2841ea53a8124e0246ab13b26cf6f51d | ORPH
    i586     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/7ad64623211f6652ad82f771fe38d7f0cb4132cf |     
   nios2     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/0939a84473bbe50b428f38819b9df7d7cea9eb4f |     
  sparc64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/330773f640bd13f34d54aa05d401c91370cba5c3 |     



-- 
http://autobuild.buildroot.net
