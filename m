From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 07:11:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-23
Message-ID: <20201024071106.E15ED8716C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 31  | 11  |  0  | 42  |
  2020.08.x  | 20  |  4  |  1  | 25  |
    master   | 153 | 70  |  0  | 223 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 9 
                  host-frr-7.4 | 6 
                   libcap-2.43 | 5 
        host-sentry-cli-1.57.0 | 4 
                  luajit-2.1.2 | 3 
        python-m2crypto-0.36.0 | 3 
               apcupsd-3.14.14 | 2 
               capnproto-0.8.0 | 2 
              cryptsetup-2.3.3 | 2 
          fuse-overlayfs-1.1.2 | 2 
      gst1-plugins-good-1.18.0 | 2 
          gstreamer1-mm-1.10.0 | 2 
                   mimic-1.1.0 | 2 
                  monkey-1.6.9 | 2 
                  ndisc6-1.0.4 | 2 
                  zeromq-4.3.3 | 2 
                  autofs-5.1.6 | 1 
  binutils-arc-2020.03-release | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.74.0 | 1 
                clamav-0.103.0 | 1 
docker-proxy-55685ba49593e6... | 1 
               domoticz-2020.1 | 1 
                hiawatha-10.11 | 1 
             host-cairo-1.16.0 | 1 
              host-guile-3.0.4 | 1 
                   libiio-0.19 | 1 
               libuhttpd-3.4.0 | 1 
               libupnpp-0.19.4 | 1 
                    mpv-0.32.0 | 1 
                    quazip-1.1 | 1 
              sigrok-cli-0.7.0 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
               util-linux-2.36 | 1 
               wireshark-3.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dddf46d3014800d29a196888b63d7a7aced98986 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/833748798f3c8e0f2820a2b2cc762840cd20c783 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7ad2a1c06a419456cfb75c909eb96004fe2cf609 |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fcf6d327d74f76f5aae9168173b824430dcb2fd9 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3e9edc01d97ae67d37af4804672843af9d1c410b |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f4dc5c270092954559dea21187fa278ab5d27bf7 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1138b64ef6fad8576ed70c397d960d159d85b2af |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/e49a99782426949b26d60b33fe2d4f3164ae7c56 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6856a221b67ae8ef57525a57ebe9d168eb5b45f4 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/e57fdc0d73c9d9cbbe7efe6f31a4465acd79e7d1 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d6a5e52470917f9c42e689c778d651a4a58256a8 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/f026c3f80d798271f43d489d2ad79eb6ea4fcd3e |     
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/86b391c4bab055ac1ee657ee549d0aba9facd967 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a0db1992f2ca6330b24e8f6cb8f9c0aa5734b377 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5c4369dd4654564926762f13682a3528f1d88a38 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fcb19facd14e6ea0774af3ab6a79ba2e16ef0053 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b96bdb4af6cbf26b662efbfd5cb4cbded44224e6 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/92cfd95d3ce94eadbac22f30198a683878d76acd |     
    arc      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/7f8718d3518a1b2054d4db436dd217a266f9fb59 |     
    arm      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/77027f5e28ff6b3ff30b66fe04f4cdfe038e38a4 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/ba2bf05fb50d06bbdccfc7e11f3cdf7cb4fd0ae7 |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f87632491aabafa6fd156e549498184dfebe6881 |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3fb0307ddc1922080a53e1e537a7b0adc2e66932 |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/64f987c629d23a561525bb1d351fac005e9828f3 |     
   x86_64    |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/e611bb2a65a488cb4c3b177db7d7d268f9156687 | ORPH
   mipsel    |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/d3f6c497603be2780eb571b69071be9735dde2f9 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/96bf7931558342cf0c0d9316cbfee5fad8e99a1c | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/80c274d4ba1c79c33b3e6ae3a46a709b37733cf1 | ORPH
   xtensa    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/defd813d61c5b8b7fe1fef9b1a301d1bf561491a |     
microblazeel |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/fafb9af425266f58e3b950a3027d6463acd1ab47 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c76f3a6f42e76d9820f684df6449b38fa25b9def |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/ff30204c834c38b8c322016380409756ed37ab4a |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8e98796b4541660b9c46d4f36c7b438db4500d64 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b6f3139057ade43392dbbe44604cb9f5f54841c0 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/778f7f671b9722be8618719fc5ae9b102d6db163 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/da0351b91106abbc4e6579d8c96101308afb63a2 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/0ca7432a368ab041846945b773c7c28b50f054d3 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4919f68e1add970b3a216a9dd57516c6a3e23cc8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/09dba35c0c37fd238daadc8225538aa765a4fe54 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1b17f27daae63d299406f25544173152fdce4667 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8d89b71451e0f5d2a0a9fb41c75311ead414ace9 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/a4330152149a6de2beb4e4e3d08d422e038f1722 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/ffd6221b632cd1fa0bf31eae18ddeb1ea492b420 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/4747da896231d4a741443896e7dde5e55da50e1c |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/cf5f1a6d1b92a469cf7129bd386fafd15d31218a |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3fbd3114f37335d1b776a07b96ae297e1f966774 |     
  aarch64    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/dd703c2fb992f7d6a36018ac2c93bc895afbefbb |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/e14a8717d6927cd31b92f883ffd29d927f684c5b |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/21d011161ebaa49d515b8688051858a60ef91b89 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/be3ff950d683e2b5b6b083af0464ead8d639975e |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/7a7a8b03311e5ceb01e2f2fe54e0af150f5d00d4 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/2b426f9bcdfdda8846bdb68c9344c69bc5d1e93c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6c634a020e799a67626b7173581d228c229a736c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/dbae32801271f36770f7226ab1260b86efce6a02 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/248081ee0d6d737ee4493dc39a340c9f1fbcfec7 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0bfec4386700b40a4167cb94804f52c120caf87e | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/e8e6b5ad68bfc73a4f610d4ac9c2666642662952 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/43212d9d8b8fc8e3a8781f910836670aa9adcd69 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c856eb24a340cfe055e755043a48a341349d9350 | ORPH
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/7e15d14fe0d61783cf0b5dbd932f41f5b8c40dff |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e4a254b2a2d03b14f2461710680a04de25d117d3 |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/d4e3a44e3d184ea639a908d3efe34e100f0a6f20 |     
  aarch64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/aab522a78e136f5cd735fe5efea2240633fe3e62 |     
    mips     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/504922505edf2391ffc0fb5af4de1ef7259c8d92 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1a704c435dd66feb545d00a57e66102e2d0bee41 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3da719c0577f9f2a463143264398fd303404ba5f |     
 powerpc64   |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/321a80648d563fd660d1225d75bcb10aac1eece3 | ORPH
  powerpc    |        wireshark-3.2.7         | NOK | http://autobuild.buildroot.net/results/96b4fdeb103172ebd1105436a1231ee358625030 | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/90984c3d8885dac30c35fbe046f76f9345647ff8 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/1215ffb2e729d823b6c3b7c2e6ceae662c43ba92 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
                 jack1-0.125.0 | 1 
               libupnpp-0.17.2 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                 raptor-2.0.15 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 
                    xen-4.13.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/68b58b95e8e4e1dd990abac507ecbb42b1a5b212 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/3b3e20e4e0cf59420a80806ad6339ad78d49f29e |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/5608eb2299d4b2f465af815986192bb341687ef5 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/367e85a8f7503114d43f43b4e80454c80d484e4a |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/9019428982da43c12e82a16a27f34140a6e2f04f |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/e44d8af0ccd0638f8d626dfa7bd48c1a4b071d80 |     
    m68k     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/398557d366ec6bf81d2e6ab61c9759ba4ab205ef |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/cb3fa8c4ef0c83732c465157857bb16593dc3826 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/49708fe6f404fea6761f102af854e98d6a1d43c1 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c0528a4043ba8090330299547cc249c1fd37075c | ORPH
  aarch64    |           xen-4.13.1           | NOK | http://autobuild.buildroot.net/results/f0cfd3b9f75497af17556fedf35354870b61a8eb |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                       unknown | 2 
                        bullet | 1 
              host-grpc-1.30.2 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/c2532a7ea37decc44fd4b9a854c29634e51352e1 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/0ce512817655886f281098310664ca9d483f6701 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f35f667f43ed9e916b5552d2d4c2305186c384e9 | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/8c53df4c1a98b972e5a82b90d1c77a764c57b8ba |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9aced439692b7870e222abb4034dadf83f61f844 |     



-- 
http://autobuild.buildroot.net
