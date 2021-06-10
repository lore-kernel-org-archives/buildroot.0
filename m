From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jun 2021 05:46:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-09
Message-ID: <20210610054650.2204183CB8@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  | 12  |  0  | 48  |
  2021.05.x  | 41  | 17  |  0  | 58  |
    master   | 39  | 221 |  0  | 260 |

Classification of failures by reason for master
-----------------------------------------------

                  daemon-0.7.1 | 16
                bitcoin-0.21.1 | 15
                  gnutls-3.7.1 | 14
                  botan-2.17.3 | 12
                 freerdp-2.3.1 | 10
               host-qemu-6.0.0 | 10
                   rhash-1.4.1 | 10
filemq-8940f34e0f1c8f25c1c6... | 9 
           heirloom-mailx-12.5 | 9 
           host-libselinux-3.2 | 8 
                libselinux-3.2 | 8 
             libtorrent-0.13.8 | 7 
               pipewire-0.3.27 | 7 
casync-4ad9bcb94bc83ff36cfc... | 6 
              libostree-2021.1 | 6 
             libsndfile-1.0.31 | 5 
                      pdbg-3.2 | 5 
               memcached-1.6.9 | 4 
                    vtun-3.0.4 | 4 
             libfreefare-0.4.0 | 3 
          perl-net-ssleay-1.85 | 3 
          sane-backends-1.0.32 | 3 
                       unknown | 3 
                   cegui-0-8-7 | 2 
                 libpsl-0.21.1 | 2 
                libsoup-2.72.0 | 2 
make: *** wait: No child pr... | 2 
                  mender-2.6.0 | 2 
                     mtd-2.1.2 | 2 
                   neon-0.30.2 | 2 
               netatalk-3.1.12 | 2 
                 openal-1.20.1 | 2 
                openswan-3.0.0 | 2 
                    qemu-6.0.0 | 2 
                 rpcbind-1.3.2 | 2 
                   tor-0.4.5.8 | 2 
android-tools-4.2.2+git2013... | 1 
                    flex-2.6.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-21.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                  nginx-1.18.0 | 1 
                 openvpn-2.5.2 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 
                   seatd-0.5.0 | 1 
                  snmppp-3.4.2 | 1 
      softether-4.30-9700-beta | 1 
             transmission-3.00 | 1 
                  weston-9.0.0 | 1 
                xenomai-3.0.10 | 1 
         xlib_libxshmfence-1.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/20ee1f1be6858bce695a792f0a026dae3b6589ac |     
  powerpc    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/f4ff3e0b32c82c5c792dcec099b71903bee07a8b |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/375788ef9eb74d208b609c6447e4db6fee8e05e9 |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/f1b32daac54f62042ba78565414c441aea7a205c |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/61e22fd02f86d76c6a5bfc72358dba796efa94f9 |     
  powerpc    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/781a2b91feddc2bff267e09aaa9cab3f20e66717 |     
  riscv32    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/b21747c23be8cc9adeb43608f39abf0a4d8ec5c2 |     
   mipsel    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/56678938d4bf73801168b8f96d9f3df1084e00bf |     
    m68k     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/a2a0b2953c66d6d16c7fe883b60873cb87f6344a |     
  mips64el   |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/a9655163579be57a948c6169898e3656808f1b01 |     
  mips64el   |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/655033d4772ac6a9046ae25163a9604bcad92d5c |     
  mips64el   |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/c14b2410da870f555ba48dee7b949a0001c50146 |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/12acb9193c1d9f8f397cfa83af6759efb7338b26 |     
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/47ef9f62b049e605b352dfef1e2e8bd510ea9a49 |     
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/318a2c64cf7d473b8602d031795ded5985a0c7cc |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/03b730820c0219bda41306a75b6ca78c350f804a |     
    i586     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/5ee2ff5b08e228eaaba030a241da8b243f688181 | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/2fd93982b77c951a3429b62e3507d66933b7aa01 | ORPH
   sparc     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/cc469056bb32fa71d8f9f24858da00fd6bacdf7b | ORPH
    i686     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/a2b5f845896ea2a3c6d125bfaa63c2d0d16c2840 | ORPH
   x86_64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/8b61d5c5e9549653e59cc5781f2d9f043df0462f | ORPH
  powerpc    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/76796043ebea42ddfc36320be17ef7e516f19817 | ORPH
   mipsel    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/fb86a31f592f5bd8f1ab1435abe39e2eb1f1156b | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/a8ecca1138522f7d2e70f768a6fc6b239e02afc2 | ORPH
    i686     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/8b18e4c27cef85cb865736f416b276a86af14a29 | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/26fc2f915d149a00d1ee80a2011c619dfa3c1fb4 | ORPH
  powerpc    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/b559cca85bad50181ed622fe30721f9ed84240aa | ORPH
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/17b254084f09f90f831033309c3e42a4f89ad56b | ORPH
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4a7b920224f8a093c04856d8ac5fe6f93d911747 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e56c39850d5846d92e717e1c1e93ecbdce3a0ce3 |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/84ce1dc1d758f39fe8604b9286e901bcaf5dba56 |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/8b1be5cd6074a14d8d090bc24846d303290b0a7b |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/8f3888d327df011c2543ecf0d7ac4f3bfe8d5b47 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/953765e54e761ba8ae1881a351d37ba94b5eba25 |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/33397224f8a8067d8ecbd6661b84ca155a0525c0 |     
 aarch64_be  |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/5b9ff0e8f16a2fd732ae25d5383656f7ae205748 |     
  powerpc    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/09d7349e82f07b6ff6c5d0a9abf8b74836928549 |     
    i586     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/2db96b0c7e6097b0196d2aeb873aeb8d2cbb0836 |     
    i686     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/d95c6cdf6a718e4963c87cd6c4575a9bfa42e975 |     
   x86_64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/24c8b3a3a2cfc6087569b0374b0e7c99325da4c4 |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/8b66aeee1d3c82536a3757fbda709b48419608a7 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/25fe617917f80aff03ed19ec51aa1ed7b9dbceeb |     
   x86_64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/b9e09110416f60d17c0e428e9a8e9f629cc4e892 |     
   xtensa    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/3ea012f328c488f89ec3306bee5274a670c87ea2 |     
   nios2     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/bd6838314f24afede1ad7963c99a89d10c579ec1 |     
   nios2     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/d6f7e4029c7c4db1c97e0a89a5a271ce02bab097 |     
   xtensa    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/22b2d96e95e17f32ecd2054de2df319c55baa716 |     
   nios2     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/07d087d2bd220dea0639f8a5cad495e3e41b1c4e |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/e4af6e4f6b3a023506b54025b7082041c36c1575 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/82fdc7222a4ed717bdb7670a32c956edcf49a094 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/da71cbc4cb8ad8f84156f11cb5efb4e1dbcede18 |     
    m68k     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/93d344e484494ff1e4002d0828dea661d7314e87 |     
    mips     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/6e4b4faedcdb60f1532bdad6a5a882194a80884a |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/c197f51049699c8411e4a2acb7e74c55e55321c7 |     
   mipsel    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/1cbb986b3fb1432820d2a2e137026a43418aad28 |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/9fff81b15b64e240ab4fd3000c1f5a4dc91ef42d |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/16c3756e58650a95f05c4a6ecfb42b70b96cc891 |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/897ec51b85adc0bef134ec0cc4bf088fa0379ba2 |     
   mipsel    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/cf4c45ed7ae2c5090ac6ba967497e0d42d5c5224 |     
  riscv32    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/fcd78976012aee7dee9c6d45ce54ab9c547c643c |     
   mipsel    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/b86e616e22b509d5597157a850793a4e71a2c79b |     
 aarch64_be  |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/48bce58f1007118a48f318c034bb50fc39bab404 | ORPH
  riscv64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/c2fa2bb8555eea8a42fa56da35fcaa697ace4cca |     
  sparc64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/4cd4582a4ebe055f8d7ea01f1cfd595fb540c76d |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/a98bfd0c10031c1aa2ea5e6c9ff065ea8544419c |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/3a6c40d3605da85d384799291a2404ff3d066387 |     
  mips64el   |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/e8513497f1cc1f36a0990ffec1e5b51d440a022f |     
    arc      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/6806e8bbed91f37fea8237f0ec33cd06c8db3f98 |     
    m68k     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/b61b202947346086b95c9bdb04efde76aa365fc8 |     
   x86_64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/457bd73f976024a03ccc08738ce60df85afb37e3 |     
   nios2     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/48f292e7587d7053a76d1089859506dcd9d92bb2 |     
   xtensa    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/0b50d257ae346019036f543db3dfb6b1273b4ede |     
   sparc     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/97f41f28353366dd9047c9115f2a530ddcb90f81 |     
  mips64el   |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/5c2202f724286ad9e5095d67d13f8ac0810906d8 |     
   x86_64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/dc8c41b56ef49ad188224d643f0833f8a36ec53d |     
   xtensa    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/4ab7b7634fba0227cdb18afee9e6b119117075c9 |     
   sparc     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/c35dbc54ea09d14b2de11a674b7a57a9317ae78c |     
    i586     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/b0a89223fc5a2636060fc062eb46057115917d65 |     
  riscv64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/804d74d671e2afcb0b1030b9241ea87cd2f9612b |     
    i586     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/5d7ba75244bfb483da0b3926b14c7c05b9bf069a |     
  sparc64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/eeb42df0e7b45656920a861597a97902156f0554 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/4857b6bf9107f4ede951e55c1043f2284e205f26 |     
   x86_64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/74ea5b0dfe6d1e9bceba991cf79cf854ebc7c7ca |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/482989e1de10ae565d51cffd7e1ce567c78c1bcf |     
   mipsel    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/216c365ab1bd59826f8f62fb4727b8769d82d923 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/bc159422913d79d2ec2b252abc2fc76ecc87fc9c |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/41dce6bd4a87885d30dc1e13ebe483de301903d8 |     
   sparc     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/ed0f65b5d081103704faa268b1138f9661f135a2 |     
   xtensa    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c6b53c743c7e0cb4da668d86cc48374fa320de8c |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/f85dbfaa0ebe983a1064597ec3854e5381e73bcc |     
    mips     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/31d8ffb5077346835ba905b4eac4bc5c9bf946f0 |     
microblazeel |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/27f2e61cd94196d2b6bcee5ba76d9aeed38efdbb |     
powerpc64le  |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/b1d017e4af979846a074bab485c1a0e2d78a8ecd |     
  powerpc    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/707a7df1a599f04a6cc3895457e41013609ff3ea |     
    arc      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/36c3ebc4b0833fe660baeed2d5794b6e29773e79 |     
    sh4      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a33c4e16cc4b7f6443e92f72373203f7d2ee19b1 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/adf49bf7d482f2f2c6abc404a2494465988d9ede |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3103de590e40f6e37d5fd902a29255ee81391a4d |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/733540a781678736ba9c21fdd3cbf5a383e5199d |     
    i586     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6f7abd3cfa378e9757bc31c5a15341068fe04596 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d09868c40f1af6462b2a31fe301b5aaa69accf76 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9d8300336e66143ad9caf47fc8a4ed4da0048686 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5eda1d4b0853e8717afe8aa17afc154f87e3860f |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/779688469766028f83a9a7220f7981a4b083ee87 |     
   mipsel    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3d7215a59c700935dca5b6cbe61a6ed6978706b0 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/35af52dd8d5ec30f3c095461455e440dc910b841 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/5ed7b3e117f6759c8009a5d168488d04820b3593 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/86176b1bdeb68c8aea848ec71431f522bee63e87 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/a7eca68387b698655ba5e755e7dbd9e5df36b61d |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/d2d08b58f20db68fa726c1dadb2ca09048d69f14 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/528da9c9dfb6e069d426ba28c886887d65769a40 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/5560b51e2e43be6375d4ce728a3a50f54c838def |     
    m68k     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/681228c59798bb1f8d7ee27e68187f5eb8a1a185 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9979c8ec98cf56165383539efc4ea8cef9f4dda7 |     
  riscv64    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/d5180b3e1b09a55b86ca3fbc3625ebb8bdf8c079 |     
   mipsel    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/b6ed461527693b375763064231ffb24f290ffe77 |     
    m68k     |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/13a58b90314602cb335e62a83d70f1ba7cc67e47 |     
   x86_64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/4a40486191eb00acb73122468c5432f8f90741e2 |     
  sparc64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/c3d290170e5c01ed8671c03ae22717a4cc2aa621 |     
   sparc     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/d6f0f984187dec357781916dba0435cff81f975f |     
   mipsel    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/925bc58ddcaf1c21ee44bef9586ac04daaa82050 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/50b6cbbebe1a65c1687ca4475c6e173480a8f864 |     
  riscv64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/ab95e7a1529299816c415a2b79449926749837c0 |     
  powerpc    |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/b229d3c14e9bcef1a4b2b1461b069e9e8595b04c |     
  powerpc    |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/704d8e6f8b78015180e5b12c132495425637430a |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/f29773ad5f54228457830bc1a74e387cd1e8be6f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/937d42d686b322cbedc3ebda0ff361fc6d87acb2 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/49d3a7867256c73bcc3685f9345173d58f940911 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/e761dfe8c25a4592f11448e8c4fe8cdb7f29d94e |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/cc489b12c375fbad9042a88e817c0a146e92df3a |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/76c8781c5445f5eff2cc4556b58e0d1761a1985e |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/95698770b8078603378dbc5b268bfcc02857870e |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/53a56be4ea516b01a6223544a4d18aadb8c06707 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/0153bf5898f0e838d36b769e08dfb195223ba70a |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/5d7575c9b0e5a9ed847e5f746ae8b01cfe3c1d63 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3752ec5bee1c06fd0af4607d62ace67df7460871 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/757b65b449201fe1a04c3be1ef124000ef5c1b11 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/d7caa9ca6cdc774ddc218a9cd704047f94dfeaf2 |     
  riscv32    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/9e539dc7185cfb81f18438dd36357cb49ef23a5a |     
   x86_64    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/1793753629d81476a3cd6fea40029cbd7de0206c |     
 aarch64_be  |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/ece4342546bd3cd35875d21ff2a08ae176d914a7 | ORPH
   mipsel    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/a8534b17070961e011a5244745d8a694145a1825 | ORPH
  powerpc    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/dc55a25ab454aa8ceb224fd9ca340476f142b2c2 | ORPH
    m68k     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/c909fedb5f59d8a434a3bde469155ff550615e3c | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/366cc83d661657d6f285884087ee31f38f517924 | ORPH
    arc      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/ad9d77396604fe67a650853b36049fc4a13bd7d5 | ORPH
   x86_64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/3a953c13c2f7a122d6aee5375392529dcbe5001c | ORPH
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/f4a96bb1dce9fc4ae09654bbcd78802e16c2e5df |     
  powerpc    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/fbc6a89341f087205746dad33e9fe1e1bdd642c6 |     
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0b7a564b4fdf7e59ef200d52b0ebe8146032e930 | ORPH
   s390x     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/fe3ed1d67e7ab4e67d59cd8db4c47813dd1cdbd7 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/08a418b2f974fb4716e01adb8fea8fa7563bf509 | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0cc8a656c05dc399988dbc93958c70390e5a690d | ORPH
   s390x     |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/c19f6381fb42b22e19c2ce2badf5e79e52a1c0b3 |     
   s390x     |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/32d3fc49271268a158f871c5b5dbc95c25277696 |     
  riscv32    |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/aa49d9feee1444a1a318ff5460594fae67f93322 |     
    i586     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/e145b5bc8b1303205aadb8483337ec7ff9740a72 |     
  powerpc    |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/e6425a76d71d01447223ad4184c99549e5cae7e2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/cdd5b36699009266fef0550f957abae6546bf7ed | ORPH
    arm      |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/cc597a5c933db4e1f5b9c6a1f9852e9175baa9ed | ORPH
microblazeel |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/9044659f102a1d8e6d58ec44cd80f32f5884460d | ORPH
  aarch64    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/453c10ff24ef48f1340ec91412e504fe604033cf | ORPH
  aarch64    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/b7347e3e4b828901dcb954f7cc37b712b80ac49b | ORPH
  riscv32    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/0798e233959efe20a07ce1ff2694295555697130 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/abe502cf3c38ff0c731b919898f36c546a40eb33 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/26f15b570d76552b343538137ca5336f2255a2a8 |     
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/8ec8c255df3c0d76554d8e835781a62bcc6240ec | ORPH
    arm      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/327a0f2b8f0c51bcbb3edb1c3671870d593e93b9 | ORPH
powerpc64le  |         openvpn-2.5.2          | NOK | http://autobuild.buildroot.net/results/8a588937847f19b9edaedc2862d9567820dae960 | ORPH
powerpc64le  |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/7dc0840a81bbf4554d0f71286194b0cf83b3d60b |     
    arc      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/e8d193774e6c384277c55abc83c1e8fef5cf8d7f |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/e07c2e2d74de388f56ef1b66f636bc83fdecf138 |     
  nds32le    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/e977f7e90db60319bfcbd7e283598e0e806dfd61 |     
  mips64el   |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/9d90ede1ff7425cbb25b95aed3bf8d27ced865a4 |     
    arm      |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/eb2c0e5e181cb40b6843f7710cef450656777eee |     
microblazeel |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/ae6199a7ac9a61ef2f3e3d7d929a4657b5e809dd |     
 powerpc64   |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/a090bc4a12534b8377304cca1c0025f3b734265c |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/94ecae8f06fd2e1bfd0c27bc5c072c2120fc6a75 |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/6e541314eb80ee865bd675e43a33b1248be38456 |     
microblazeel |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/05fb5f7a0f509110fbe839ca652b7a853903f44d |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/0ca7cd539783be404574c45091c381bacf339d54 |     
  sparc64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/b3c53da1e9960cdb1faf42774e42ded4585bf2dc |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/27834234b90f60328a2ce538ac467c2a23156a9c |     
    i586     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/4d442c61b137ca1bd2dd32c6802ff0251d39e7a5 |     
    arc      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/5ebc18d3d1389bd5f80cfeb734daca81fdf49732 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/04cfe1c5b0d57044ae0bb46376d42538f0f13a55 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/70716a6c81985aee703ce1f393a9edc6e985f28a |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/aaabd63d0903819fb55d08852cef34c497cb57e6 |     
   nios2     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f772fd6d4f2138abf14120290544fa5fe9b2b864 |     
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/a6b3feec242dfb64e810519b54ab3d70523775ea | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/909c58e114ad7b87ae20fa6a46817f120cf6360e | ORPH
   x86_64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/4c2d12c4e458b8489c80f7168b5621d13f7963a0 | ORPH
    or1k     |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/87d17616a16d7b78ba33247b57b4a8631c4a56e4 | ORPH
    i586     |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/ca95baeec5c8484e38a88e1dd5c63df35f8c4f56 | ORPH
   xtensa    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/1637ab919e6f4af9f5bb27187ade8097177d0571 | ORPH
    arc      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/0249ed668d09c2f9ee3a1910dcff538335f2570e | ORPH
   x86_64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/5e74a4127d96a3aee2fa70203ccc572b8fea8f61 | ORPH
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e3733ad25de55616b2eafff0b489aea2bee65e06 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/5e3a24d94483f69c985110d1f85d21de4e452d3f | ORPH
   sparc     |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/cea68a622b2e74d79b48d87cb5dc5fd534e67504 |     
   xtensa    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/9e14bb63dae1a02794e33add464f3ed882a2cc3a |     
   xtensa    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/1f32b250d9bafd20cf4d839857eef66a737a44bd |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3d1b6be5b88ab541d860036100185e1b7a9f55f9 |     
    i686     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/2f3e5bba7b496f9cecbff68778da5d5b51afc0b3 |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/e9d005c8ceb8782df3e5c679cf366da8078bdf16 |     
  riscv64    |          snmppp-3.4.2          | NOK | http://autobuild.buildroot.net/results/2aece7e503d36ebee2bce526f11b2400b9df761e |     
   nios2     |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/641933d4a74871a5403fd82a71ed88936d7e52bf |     
    arm      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/f117893ef9e3c656b93139364baf75345b1cc9ac |     
    arm      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/f35843815bc12b3ac02537612eaa9052088ee1ec |     
   nios2     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c658beb245cbf06786aa4155c7649c3e1a613e39 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a9aa5bfc944a4e9ebaf71865ed8bf69852dd715 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac599d2e2fb488dadbd1509cfb45aba570db0bde |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/17d90eb0cf6f7adb6c71eb8425f7cd8ff3e82a03 |     
  mips64el   |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/7dddc7f2315bf9f5442de23209738c85528ec3b9 | ORPH
powerpc64le  |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/e4b931004491f1906a63d3d932e7ed892e18e907 | ORPH
microblazeel |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/0651e24b837a726d355678b4fd1c240dd8212070 | ORPH
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/ab03efcdc57fdc39f2d2a15fea1175b3d81ec0a7 | ORPH
    arc      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/f420890de1b52786f8cf5f2922b69c909162eaa1 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/949be583e8708ade314980ec6dfdf60130de0863 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/acc487901462591f3266df99967c81ce7392c226 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/683adf518d28ef7f3c6f3295e1ee78556b73416d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
monkey-f54856ce250c4e257354... | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
                 dc3dd-7.2.641 | 1 
                 mesa3d-20.3.5 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/aa83b3268329ba4d81412076ff56d47af2222c64 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d61a418e16b9518b17b6fc8c1f85843ec5c4e054 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff502e8de01d6626d8b4ba58b551d15aff1ac8e7 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/01614c36bb696aebbdb0ace0db25d24e4a36ede4 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d45998b7ea13a3c6a8c04f4bc2bb9def3d06c5f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/52066274481b52b08f8e9a4609e56fc65afbea8c |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fe61e13598a7cfed83ed1cc002ad7ab6f83c1ca |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/7dab31e54aba34b84f22b4f121883743da56868c |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a9103cc7b5c02f05d16ae225fc0734325b0f7d29 |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/039aa03d6a148d19250ae7147d6382950a9c52a2 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b19de9b993330560774689644c7f26360edd81c3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0b0f4f3ffd3cba0078bf6416e74ab98f03f6c593 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    ffmpeg-4.4 | 3 
  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
                 mesa3d-21.0.3 | 2 
               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-odb-2.4.0 | 1 
                 openal-1.20.1 | 1 
                qt5base-5.15.2 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b91f3870129b658d901bc7a6768de7047d076e2a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e5aec489e8e2898defc01d4394c70ad9a20ba776 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b9563f610b1ab5dc831f05ca494e567451beae3c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9d9ef7b08274de6679a52e377e8ec4dea5848cae |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3c30407a4ced1f476121c97bfe3e3b93a04358b5 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0af8ac52565d0cbf206d352468e4717ae0c0c5e8 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/51728904e6d1f94f66ff602d870c9a8142f80ed7 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b728b1a925f2b47fd6af431355b84ab9072e4b10 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/beabe8bf7b0e2a654c5bca865f8ebddb044e749c | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/035cf6f615f9893ffa6900efe1b819fb9eaac4c0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c9fd8c5593e43e1af13e04a7bedb4304e56f9f6b |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/aea43e8072d75249b4aba903fd4da060e241cea5 |     
  mips64el   |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/e74671d170d50b6c9c60d781e13ecff435efdfd4 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2aa7c3e2150a1561da5c38f8a1eae673f1c70c3c |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a8b2872702fdf63df02e1676358f5e6e167a3a88 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/866b4e1f6e7e82f3ea483696d746d182faf3a292 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/889d553a4dd901a8e28b4e431acfc83954fecc99 |     



-- 
http://autobuild.buildroot.net
