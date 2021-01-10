From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jan 2021 08:20:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-09
Message-ID: <20210110082016.09D5E86819@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  4  |  0  | 26  |
  2020.11.x  | 12  |  1  |  0  | 13  |
    master   | 120 | 61  |  1  | 182 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 8 
        host-sentry-cli-1.57.0 | 7 
             timescaledb-1.7.4 | 3 
                       unknown | 3 
  binutils-arc-2020.09-release | 2 
                coreutils-8.32 | 2 
  gobject-introspection-1.64.1 | 2 
                 libusb-1.0.24 | 2 
                    mpv-0.32.0 | 2 
                poppler-0.84.0 | 2 
                    qemu-5.2.0 | 2 
               wireshark-3.4.2 | 2 
              asterisk-16.14.1 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
         coremark-pro-1.1.2743 | 1 
       docker-containerd-1.4.3 | 1 
                ejabberd-20.07 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cairo-1.16.0 | 1 
                     host-mono | 1 
              libostree-2020.8 | 1 
                mono-6.12.0.90 | 1 
         multipath-tools-0.8.5 | 1 
                      nano-5.4 | 1 
                    olsr-0.9.8 | 1 
                 open62541-1.0 | 1 
             openjdk-14.0.2+12 | 1 
            qt5location-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
            quickjs-2020-11-08 | 1 
                   rhash-1.4.0 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                upmpdcli-1.5.5 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/57627d96f61fee7a49eb19bffb5bf2fd197a46d2 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ffe182031f6746d39d08bc9b95ea76372bc381dc |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/67cdf2c4cad268eda1d03a8c8ad87ce787390bc5 |     
  riscv64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/ed3de7e24734c866762d54677fcd347ebfa7d74c | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9605a0ff6d1b42ee436ac9a81ac73854e7352678 |     
    arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/ab574485a7856fcf5cd643c154c44b4bfcb34a97 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/80e134579273d65e4f6a8460678526c8adc863d1 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/1089e6cfbfe2d6cc66a71cdf4b401f60562abfb7 | ORPH
   x86_64    |    docker-containerd-1.4.3     | NOK | http://autobuild.buildroot.net/results/71cec8d77b0f7e6b3fc5e2aec9fc593e25159d7d |     
  aarch64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/5d839f817d3701535f356a00c84ca3dbf2d3651e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/97ae712cf09584a462f37337391be1f585fe9783 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/7c34acd84e62b33009077223a78e43ca90b752ea |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/18e332fbf7ae321a0e3b145957d1d594bb8292dc | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1e5b112b3e27cf8a00ec3fc33b35149b5a19dc34 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7c3d828e41346baeb6cf4330a7c13ccd90cdf36a | ORPH
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/a0a132c7cffcb3c0787475bbd053c3810e8a1ee3 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/2b35f8bf92832953eaee3260aebd65d25c0b407d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7d9bfffdc11b0b4cd4251eaf6cf04d405ea70fc3 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dd3f114f6ff2d52b0f43343561ebbbae248e523c |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d3c51fb64131438f9534931781c7c34e92d7d3ec |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/12b3567129070ecd0759005626604648aaf88361 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a551c172400c77e1828da1ecf87ad6e5c3650b2f |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ded00177a7a6df8621b0941af58e441df8594f3b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/37ab6945def431887f11ae6ee48ddd749f730b96 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/229ef38c537f2f2ad9663133f22c70929d1aec5d |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/f48d7bd9d6e9e58ab26592e060fd1b248b35272f |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/f348fe8e5530970a14589ca878810a3bdaf98f67 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1998b7d6e566a07df91a8d0da50667d4e845b814 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/15e6c890e71b04345fe253a9d8fd10f8cb98bff6 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/3fbe3e16bc930240d6d883fa5a29c6701c89d9d7 |     
  riscv64    |     multipath-tools-0.8.5      | NOK | http://autobuild.buildroot.net/results/2a9a61b59d010062c9840aaed0bbe204263ee727 |     
  riscv64    |            nano-5.4            | NOK | http://autobuild.buildroot.net/results/3b3e67ec67972d105fd861ffc60a5509ffc04732 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c863aedd01857c9d9f2e6726c26b55dfa3fe4661 | ORPH
    arm      |         open62541-1.0          | NOK | http://autobuild.buildroot.net/results/7ce4e266357c463b2331f515ec28bb944784c828 |     
 powerpc64   |       openjdk-14.0.2+12        | NOK | http://autobuild.buildroot.net/results/ad2a1bac28bb03342ac6ecc97efd4c06164f6df1 |     
    mips     |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/6b80d911167132a6fa9d9990a1aa28e67515476e |     
    arm      |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/481f698e988d4d17eb3f4d74227c3ac90ff67f3f |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/29c0df5bd92bf415941f8ecb038316592de08cdc |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/f598f696da14d8e01f7fbbdeefcf153ce9f1fca3 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/3cb6f1fd836a85e784c22bcba67016934931f54e |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/1c34e3a0ce2196a2be0c856ccb7f2c448c72ffbf |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c8ab183e913d974d5cdc99ce5d44c240587f0dd1 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/78ee2ecfb406eeb02db87b505c005b615f7aab93 | ORPH
 powerpc64   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/a02cd43b2380689dc5bf76d2e61bb568f2c372d9 |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/91bc6461e0255cbd1cb03a1df2c417903d4bdfd3 |     
   s390x     |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/f6c562b3241dd4b9a5aa1020d915cd9ff4d885e4 |     
   x86_64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/2aa077eae51f48699c246e02896ea41ed3cf74fd |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a22da678fc961215d9ddf9b6ed195a6eae1e718c |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/57ccb69e3078c209f577fdbe46921997767630e8 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/71d538a4a5c9235129db84bbe0eb359ab4617b42 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/e0ece61496f6beee9371dd2bb7342f35040437f9 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/cf5fcda3521406d6007c4ae8d60edd188fedd061 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7770a995566c1f611c989fddcc8bcad22f76e206 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/294302777aa17d841c096e58dba91c63b84da03b |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/24167e0749cdcb05fa0c0870bd59c6a3375a2087 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb03ba365e7cdfbe523f1b2bcc0fa91584c64124 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd1cc7005a90435d0fa7f85f02afeba681775a93 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5626c4f25e5a8181b5559c0cbea9322e20508dab |     
    arm      |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/cd110daa573f09a13831b9c1063d78cd19987c7a |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/4e53a4a1b3b63a92c7bd00295ba59169b665bfab | ORPH
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/392ddf102839822f4c3cbda36c03f8840877325a | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/22f58a6da5fe471589211ebcf4b7bf996acf8732 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               protobuf-3.11.0 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 
                 uclibc-1.0.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/6a74113751c7dbad05d1b082fa804ba1bd24b9fb |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b506fba6ebb5df19b0040134d92d051104c35079 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/badcdb3e225f3bb2e6b0d436b1edc6abf0277895 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/044b8e211c5d3f4315d125a76d8fb06bbe053a02 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/bdfc6ea0213e7f47a8845fc897097424bf141e67 |     



-- 
http://autobuild.buildroot.net
