From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Feb 2021 11:43:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-02
Message-ID: <20210203114311.C72D985C8C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 36  |  4  |  0  | 40  |
  2020.11.x  | 20  |  3  |  2  | 25  |
    master   | 170 | 133 |  1  | 304 |

Classification of failures by reason for master
-----------------------------------------------

                libgpiod-1.6.2 | 32
                    mpd-0.22.3 | 13
              netopeer2-1.1.53 | 11
        host-sentry-cli-1.57.0 | 10
                  perl-gd-2.73 | 10
                 uclibc-1.0.37 | 9 
                  dhcpcd-9.4.0 | 7 
                libselinux-3.1 | 5 
                mono-6.12.0.90 | 3 
                       unknown | 3 
                coreutils-8.32 | 2 
             kismet-2020-12-R3 | 2 
                  zeromq-4.3.4 | 2 
                    brltty-6.3 | 1 
               capnproto-0.8.0 | 1 
            docker-cli-20.10.1 | 1 
docker-proxy-55685ba49593e6... | 1 
                     efivar-37 | 1 
            erlang-jiffy-1.0.6 | 1 
                  ffmpeg-4.3.1 | 1 
          fuse-overlayfs-1.4.0 | 1 
             gdk-pixbuf-2.42.2 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cairo-1.16.0 | 1 
            lttng-tools-2.12.1 | 1 
                 mesa3d-20.3.4 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                parprouted-0.7 | 1 
                   perl-5.32.1 | 1 
                    qemu-5.2.0 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
         s6-linux-init-1.0.3.1 | 1 
                       vmtouch | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/aff194daa825311bc5205ebfb91dfb2d45e0a68f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ae145f62701c06b16c7ff1eba3341115b75ea75c |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/56be999243ab65639193dbc68aa496490cfd1a68 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/943255768aa1675ba679473a60e7213ae75030a1 | ORPH
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/10899402579af5ced63d7214cf9afcf7c44f83b8 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e7e933a7162cfe9d8af0bd35c08216cf17ba9dc0 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/9f19c0357521100660c84fa9ab4ce2b3132f348d |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/9783f15d85f60de58022bc8926b3ad63f5ff754e |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6066968aca18790667be442122370f4baec095ec |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/21991825d81a5b0d975eaff1a694ee2a52cdb61e |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/8f001c4435ed3ce822cbf7042f0a4b3ef51d68f5 |     
    i586     |       docker-cli-20.10.1       | NOK | http://autobuild.buildroot.net/results/9d264761e3b687447268cc8427115d2c19b1e48d |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/5d100df026754535adc5d783f757b66b7bf57682 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/4bb61e6fc15036f57f5670ba09122537b235af9e |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f53fd7a394ce2ccff8811c6bb8aec25e907ccaf0 |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/b98d883bf681e78a4766f0f104a06d48dd7450e1 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/59b8bd7ede7d4df7d35f461ff605684b977ba02f |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/9ced61984ffe441bcd90addf67a0c09f0658d318 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ec42abe2a6d002cfc841c85f9b6486f5c705c421 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/304a9087f2ceb1c2f165e81eb1412f4b0bb281b2 | ORPH
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/0d25caeb84c4e86cb351d1590b05ca9248edd65b |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/378b5377c9ac07df91ecfe99036e8f4c33ae986b |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da2aae49330355205c69a994ad511b76dd869445 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0fdfaa8ed2039a7500f31d87ca674bed923cca26 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1900f108a37a95fe9b649f8723943dbfaac36792 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/336fb46661c4119ac962ef3940d299d7d2d06f20 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8ae559ffee72ef22ae26e5ab258ebb9d8d9dda0b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d6e5f9e3182620096a95a57c086d7848bd4d5e10 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b305f40e37090e3f3c27743603620d1b8aae6e0f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd028ed73c8d1cda8e2c8dfe97b7de6e1abc30f6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f64b058c52d95ae2640d49755b5695756cc90352 |     
  powerpc    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/42ddf28774faa5fbfbce8be4ee2dc50085571873 | ORPH
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/f187be21b943fd06352e887743b2b3a73e10db3f | ORPH
   x86_64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/2eb127c6255cda7642b55a9de45635d0ac75597c |     
  riscv64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/351c86cb59c94b3db97c5b0c9f36fa78302e4b2d |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/44448c35b902946ddcae6d9750ddda1a3ab2290e |     
  powerpc    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/c52951ce0a2e891efc1284f8061c6fcc3e29df1b |     
 powerpc64   |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/30227c83c62d258ffd1df0b107306e479985d5ad |     
  mips64el   |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/10b26549979681b1952ba4b77eace702fce1cb3d |     
  riscv64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/9e5071e9591672ecf6389c09aaa78fa88d52703f |     
   s390x     |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/24654324f91a9b32828c8fbf0ace1b2743b11d91 |     
  powerpc    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/bca163f9e075047377b176cece0219a9b867b796 |     
  powerpc    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/333933381ec17c784a5ffd491706e12498ddc01c |     
   x86_64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/3f4675977a6fb36c5e63f65ff24bc6eab35d9bf7 |     
   s390x     |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/7bf186948fc2b6c59e6ad7a78c4f1f7f0c0c77d3 |     
   nios2     |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/97740cf78dc2c070a873233ea0f78bcd57dd1414 |     
  aarch64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/337f510a7ac965f7f840c0490544164dfd997965 |     
  powerpc    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/5a8e18c29de1055a380fb4347423366d97e21ed5 |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/b6673f69ad6a4b12a62ac2114b72469e4bcce2a4 |     
   x86_64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/1551c61416598eb0f27ac3e2a8e268c970381312 |     
 aarch64_be  |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/94efbc847823c3cdd40c2308d73b08e373451a7c |     
   mipsel    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/1d2c9fc7c162e73dce34db586b92b4c645369b76 |     
    sh4      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/a48a8d8a176387a2a3c89cdc533efdd1f1db9906 |     
    arc      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/4bc639bc338e68ab9bcac4c3451464f726ad5cf6 |     
  riscv64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/07e9bba4e49702fe5898fdb8f1275b20c9e4eabe |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/0b79e60f42654e9e89fcb20634f198188efe2667 |     
   xtensa    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/cb7454afa1e84b5f58c01eeb991e40563b2b02bd |     
   s390x     |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/63363658e8c49ef7c0edffb28c24d45b13723c38 |     
   mipsel    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/9f53e89380cb9f89c6b15a8a574f44a1f2b4fe59 |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/8d5ad47aed63ef6953ed28f5fcc40c56e667a758 |     
  aarch64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/bda41dd34c94472a61bb26c918dbfd2aa0e51e19 |     
   x86_64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/321004b185213099c7c5633b5ec35ceadd0293bc |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/c2fd26d13ad86c6d8627fd2ef8434f2efa589e78 |     
  riscv64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/1620a0ca3ff689fe70688c890e1bb69cf60f55d1 |     
    arc      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/7c817db7a8830b35d690e62a13227163e05f7bd0 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/61d768118ca883c560acee9ca1af855413ff0065 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/01affce4c69698de11f46673b5cb4e1fa6d8ed5d |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/9db956595a1ddfb7ed5d1879d9a98252b07deb52 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/e7e0569f1e29b9e6da382d420afeee097a2dc664 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/5d13068051a758cc79cdd6607d02b920c7061fbf |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/36f478bf7749682936937c1b2eed94537e683485 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/64080cb95387837ad4ac22a9990241fe4ab02877 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a9954d251af12058f49f30759a51de6a1e4fbb85 |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/8074f9e8933b8eee63d63b1b5104a34195d77062 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d29673a5b29d82385c66d48c022935ed35edb0fe |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1b09b8e58244534c59ab49e0365405a813eac839 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/457b76983a18deeca62836cdd3596597722ee262 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e2fda4de2af93d37d1034b7eb727fbaf5d95486b |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/07f3d934e503fdfe8847b1ea32b84de50d638f64 |     
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/72412f016e540f519c277540fec639d68dbf5cd3 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/75d4b25fa74a40e69167cdf3cd18c7ba592e46ab |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e3971bfa84e27bf7c7eb27efa3e39328295075c7 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a84ff8c14d0cf61c04cba9cc9e9aa61ae3cf7a8e |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c062ce58880fb2ae5bff4e38fc379caf421b87b7 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/bc9dfc225dafc9f53a79c23fe12d8da367435fc7 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1b5722ff42aa6b6b7c2357857a205fdc5f4bd803 |     
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d96281b095bf2111474aaf24ddb475af6204e365 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d24936d136caefff3595e23b00be0cbacd39e6de |     
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/926b0e4819919624ccb2f5412c0248df0c52528d |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/ea5077f13762ee91148fffb6c79563b88105c8e2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c28e05e5788eb14c49828486fcc2505ee9157c48 | ORPH
    i686     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3eb5847cf3cff5952d85bc47d1f628b93027d4b9 |     
   s390x     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e76f8b047dc16f551b1ddba4bd8424440d7246ea |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/931c6ece53ae1e56799e9e95e9e819ff41819b6b |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/5582def5a642cb93100fced13a968e279180e71c |     
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3f35dddd675fb5e0d274f0f132a562389b48c9e2 |     
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4189bfc4309f53e7e156de2a86c972a22fb9e748 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f27a1a80517eb053aa6f7a4fd3a4d66f6f8bf0eb |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8fd8b03b8fd3cc954e73ad5b13e8f86799527262 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/663539a12ebefbf1eb0935b20d6982654bd2cd85 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a05bedaab2caa4dff8ba8983f57912b686935992 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c84bad4cf3d7a783537ae883292de0709d10aae4 |     
    arc      |         parprouted-0.7         | NOK | http://autobuild.buildroot.net/results/48ca42c5bda700f18d905619fa9bcb3b3545ce29 | ORPH
    sh4      |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/503444780321b11815afac68ce0303e82eacdf9b |     
    i686     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a10d41eb9b32c0c98a6341991852bf56cd21debc |     
   nios2     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/15ce5b9808438065e54c5b2bd65ec7b8094c5798 |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/353810cfdf663ee7c177b1d5c8685f27845400f9 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/04e3793d3e885b70850bf170e4655490d5327d4c |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/c9d9603e09363600c1670ec243c7ef99aa4114df |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e91390949f9b6d7e7bb1ad540590648e5a7987ec |     
    i686     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/623849955a1ebf4610325e36cf79f11b1e56b8bc |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/7d8d0d20ff4443fffefa96cfa6629ef3f8a825ad |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/4e452041f3ed0f85ee5d4ef303ed4a9a40924403 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/95acfe21ea0f995b96bf93aa5bfc48bd3b134d2c |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/fd55607dfce2a0051068345c2da22ebad1d9038c |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/296741db66878171e8e91513959172fae1d50733 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/2c6d9ad5aa209f4d857c1362f5d1865517fc7936 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/303ab1bcb72a668e695a8a20069ac9311850a225 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c633cac6b67307036c3481fcdc55ba0dfe99f791 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/57a90d36d19c6d3d69707e0b4aed70a8a21ad305 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/bcb0fa98d961e370bd26f7802a4c1e0c5506f8ae |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0c955097e120ba80fe07fa3dfd96dbb1fca67996 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/da78dd5861e839ca62ca4ea1a1883c2bdf3a204c |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/eb541fa459dee9d5d759d2941052bf739f05c464 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f1855c2ac84608d4a1cdb9969e59bae89178ebf0 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/5e0dbcc07479c728e366450d3bc3dbd0c93517e8 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/980727f760c3ca3046618975177b2cd72d0865b6 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5ff4117455cc8975726c568cb53b8e2f057aa800 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a18d154555a6457d2ab2a5ab069ca607ac6cb8e0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d63fa7f3fbd51e62f8dcb47418ec8e4f66b960fa |     
 powerpc64   |            vmtouch             | TIM | http://autobuild.buildroot.net/results/b2fb5ba74b9c3b053970b6cd82f8e05974799ba3 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/986c2f1c434a1ebe1731e85030eabe50c09eb005 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/883c16f99682c0cf79178decaef09dcd6c6266c7 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9de397fc63b0324c9127c90e7a04cf3e95aa4469 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 uclibc-1.0.32 | 2 
                   mimic-1.1.0 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c496f8b70dd1ee9cc6b8147709aa39bd2041ec26 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e08c0b0ec72c616bc672e3e3a4d965b72317eb8d |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/4f8657f6a2855b449b20635e746e4834b419fd2d |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/5094f9bbfe65aac2761b18ba83419b23cfb56d84 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              gnuradio-3.8.1.0 | 1 
                     host-mono | 1 
        host-sentry-cli-1.57.0 | 1 
i7z-5023138d7c35c4667c938b8... | 1 
                       vmtouch | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/4c04f15c662823c95c9e8cf30770ade880ae02d0 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/df5d88c32c78205d91c83f4ac8a7fc4ea317ccd7 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2d4c65fdead3504440163b125a991ea78c9894bb |     
   x86_64    | i7z-5023138d7c35c4667c938b8... | NOK | http://autobuild.buildroot.net/results/72ca4e447655e1dda5d201301b6916b47be2dc71 |     
    arm      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/c132e85c560bdd4c4c8957b1c416a2c2ad8c5a7a |     


Gitlab CI results for 2021-02-02
================================

Detail of defconfig failures for 2020.02.10
-------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038435  |      
       acmesystems_aria_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038436  |      
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038437  |      
    acmesystems_arietta_g25_128mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038438  |      
    acmesystems_arietta_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038439  |      
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038440  |      
             amarula_vyasa_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038441  |      
                      andes_ae3xx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038442  |      
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038443  |      
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038444  |      
                 arm_foundationv8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038445  |      
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038446  |      
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038447  |      
                   armadeus_apf28 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038448  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038449  |      
               asus_tinker_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038451  |      
                  at91sam9260eknf |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038453  |      
                   at91sam9g20dfc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038455  |      
                 at91sam9g45m10ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038456  |      
                     at91sam9rlek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038458  |      
                     at91sam9x5ek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038460  |      
                 at91sam9x5ek_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038462  |      
                 at91sam9x5ek_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038463  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038465  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038466  |      
       atmel_sama5d2_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038468  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038469  |      
           atmel_sama5d3_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038470  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038471  |      
       atmel_sama5d3_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038472  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038473  |      
                 atmel_sama5d3xek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038474  |      
           atmel_sama5d4_xplained |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038475  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038476  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038477  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038478  |      
                      bananapi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038479  |      
                 bananapi_m2_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038480  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038481  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038482  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038483  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038485  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038486  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038488  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038489  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038490  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038491  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038492  |      
                     csky_gx6605s |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038493  |      
                      cubieboard2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038494  |      
            engicam_imx6qdl_icore |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038495  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038496  |      
        engicam_imx6qdl_icore_rqs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038497  |      
              engicam_imx6ul_geam |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038498  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038499  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038503  |      
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038504  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038505  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038506  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038507  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038508  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038509  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038510  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038512  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038513  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038514  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038515  |      
          freescale_t2080_qds_rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038516  |      
           friendlyarm_nanopi_a64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038517  |      
          friendlyarm_nanopi_neo2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038518  |      
     friendlyarm_nanopi_neo_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038519  |      
                          galileo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038520  |      
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038521  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038522  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038523  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038524  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038525  |      
                     imx6-sabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038526  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038527  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038528  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038529  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038530  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038531  |      
                        imx7d-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038532  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038533  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038534  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038536  |      
                          lafrite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038537  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038538  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038539  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038540  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038542  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038541  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038543  |      
                          mx51evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038544  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038545  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038546  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038547  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038548  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038549  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038550  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038551  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038552  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038553  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038554  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038555  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038556  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038557  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038558  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038559  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038561  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038560  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038562  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038563  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038564  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038565  |      
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038566  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038568  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038567  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038569  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038570  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038572  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038571  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038573  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038574  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038575  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038576  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038577  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038578  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038579  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038580  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038581  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038582  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038583  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038584  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038585  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038586  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038587  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038588  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038589  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038590  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038591  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038592  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038593  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038594  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038595  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038596  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038597  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038598  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038599  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038600  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038601  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038602  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038603  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038604  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038605  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038606  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038607  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038608  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038609  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038610  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038611  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038612  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038613  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038614  | ORPH 
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038615  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038616  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038617  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038618  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038619  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038620  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038622  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038621  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038623  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038624  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038633  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038625  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038626  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038627  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038629  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038628  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038630  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038632  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038631  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038634  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038635  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038636  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038637  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038638  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038639  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038640  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038641  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038642  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038643  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038644  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038645  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038646  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038648  |      
   solidrun_macchiatobin_mainline |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038649  | ORPH 
    solidrun_macchiatobin_marvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038650  | ORPH 
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038651  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038652  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038653  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038654  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038655  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038656  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038657  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038658  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038659  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038660  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038661  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038662  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038663  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038664  |      


Detail of runtime-test failures for 2020.02.10
----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038665  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038666  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038667  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038709  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038839  |      
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038710  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038711  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038712  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038713  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038683  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038684  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038685  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038686  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038831  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038832  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038833  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038834  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038835  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038836  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038837  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038838  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038687  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038668  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038669  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038670  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038681  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038682  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038678  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038679  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038714  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038715  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038698  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038699  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038700  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038701  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038702  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038703  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038704  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038705  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038706  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038707  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038708  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038688  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038689  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038690  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038691  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038692  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038693  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038694  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038723  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038732  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038718  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038720  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038725  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038738  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038740  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038730  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038744  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038734  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038746  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038748  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038728  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038742  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038750  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038754  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038824  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038736  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038724  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038733  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038719  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038722  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038727  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038739  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038741  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038731  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038745  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038735  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038747  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038749  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038729  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038743  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038751  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038825  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038830  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038737  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038752  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038753  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038680  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038755  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038756  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038757  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038758  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038759  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038760  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038761  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038762  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038763  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038765  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038766  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038767  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038764  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038675  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038768  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038769  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038770  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038771  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038780  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038772  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038774  | ORPH 
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038776  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038778  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038781  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038783  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038785  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038787  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038789  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038793  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038796  | ORPH 
     TestPythonPy2Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038798  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038799  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038716  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038801  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038803  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038805  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038807  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038809  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038811  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038813  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038814  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038816  | ORPH 
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038818  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038820  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038822  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038773  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038775  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038777  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038779  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038782  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038784  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038786  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038788  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038790  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038791  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038794  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038795  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038797  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038800  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038717  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038802  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038804  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038806  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038808  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038810  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038812  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038815  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038817  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038819  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038821  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038823  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038671  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038672  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038676  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038677  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038826  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038827  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038695  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038673  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038674  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038828  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038829  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038696  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998038697  | ORPH 


Detail of defconfig failures for 2020.11.2
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003122  |      


Detail of runtime-test failures for 2020.11.2
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003275  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003601  |      
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003276  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003277  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003278  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003279  | ORPH 
...rch64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003429  | ORPH 
...tlinAarch64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003430  | ORPH 
...arch64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003431  | ORPH 
...otlinAarch64MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003432  | ORPH 
...ch64UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003433  | ORPH 
...linAarch64UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003434  | ORPH 
...h64beGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003435  | ORPH 
...inAarch64beGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003436  | ORPH 
...64beUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003437  | ORPH 
...nAarch64beUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003438  | ORPH 
...750dUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003439  | ORPH 
...nArcle750dUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003440  | ORPH 
...ehs38GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003441  | ORPH 
...inArclehs38GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003442  | ORPH 
...hs38UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003443  | ORPH 
...nArclehs38UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003444  | ORPH 
...5eabiGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003445  | ORPH 
...inArmv5eabiGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003446  | ORPH 
...v5eabiMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003447  | ORPH 
...linArmv5eabiMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003448  | ORPH 
...eabiUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003449  | ORPH 
...nArmv5eabiUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003450  | ORPH 
...abihfGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003451  | ORPH 
...Armv6eabihfGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003452  | ORPH 
...eabihfMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003453  | ORPH 
...nArmv6eabihfMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003454  | ORPH 
...bihfUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003455  | ORPH 
...rmv6eabihfUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003456  | ORPH 
...abihfGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003457  | ORPH 
...Armv7eabihfGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003458  | ORPH 
...eabihfMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003459  | ORPH 
...nArmv7eabihfMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003460  | ORPH 
...bihfUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003461  | ORPH 
...rmv7eabihfUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003462  | ORPH 
...mv7mUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003463  | ORPH 
...tlinArmv7mUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003464  | ORPH 
...8xxxUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003465  | ORPH 
...nM68k68xxxUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003466  | ORPH 
...fireUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003467  | ORPH 
...8kcoldfireUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003468  | ORPH 
...azebeGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003469  | ORPH 
...icroblazebeGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003470  | ORPH 
...lazebeMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003471  | ORPH 
...MicroblazebeMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003472  | ORPH 
...zebeUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003473  | ORPH 
...croblazebeUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003474  | ORPH 
...azeelGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003475  | ORPH 
...icroblazeelGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003476  | ORPH 
...lazeelMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003477  | ORPH 
...MicroblazeelMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003478  | ORPH 
...zeelUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003479  | ORPH 
...croblazeelUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003480  | ORPH 
...ips32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003481  | ORPH 
...otlinMips32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003482  | ORPH 
...Mips32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003483  | ORPH 
...ootlinMips32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003484  | ORPH 
...ps32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003485  | ORPH 
...tlinMips32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003486  | ORPH 
...s32elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003487  | ORPH 
...linMips32elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003488  | ORPH 
...ps32elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003489  | ORPH 
...tlinMips32elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003490  | ORPH 
...32elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003491  | ORPH 
...inMips32elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003492  | ORPH 
...2r5elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003493  | ORPH 
...nMips32r5elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003494  | ORPH 
...32r5elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003495  | ORPH 
...inMips32r5elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003496  | ORPH 
...r5elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003497  | ORPH 
...Mips32r5elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003498  | ORPH 
...2r6elGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003499  | ORPH 
...nMips32r6elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003500  | ORPH 
...32r6elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003501  | ORPH 
...inMips32r6elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003502  | ORPH 
...r6elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003503  | ORPH 
...Mips32r6elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003504  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003505  | ORPH 
...Mips64eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003506  | ORPH 
...4eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003507  | ORPH 
...nMips64eln32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003508  | ORPH 
...ln32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003509  | ORPH 
...ips64eln32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003510  | ORPH 
...64n32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003511  | ORPH 
...inMips64n32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003512  | ORPH 
...s64n32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003513  | ORPH 
...linMips64n32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003514  | ORPH 
...4n32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003515  | ORPH 
...nMips64n32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003516  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003517  | ORPH 
...ps64r6eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003518  | ORPH 
...6eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003519  | ORPH 
...ips64r6eln32MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003520  | ORPH 
...ln32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003521  | ORPH 
...s64r6eln32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003522  | ORPH 
...Nios2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003523  | ORPH 
...ootlinNios2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003524  | ORPH 
...enriscMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003525  | ORPH 
...tlinOpenriscMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003526  | ORPH 
...riscUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003527  | ORPH 
...inOpenriscUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003528  | ORPH 
...440fpGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003529  | ORPH 
...owerpc440fpGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003530  | ORPH 
...c440fpMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003531  | ORPH 
...Powerpc440fpMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003532  | ORPH 
...40fpUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003533  | ORPH 
...werpc440fpUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003534  | ORPH 
...e5500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003535  | ORPH 
...erpc64e5500GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003536  | ORPH 
...e6500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003537  | ORPH 
...erpc64e6500GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003538  | ORPH 
...4e6500MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003539  | ORPH 
...werpc64e6500MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003540  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003541  | ORPH 
...c64lepower8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003542  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003543  | ORPH 
...pc64lepower8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003544  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003545  | ORPH 
...rpc64power8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003546  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003547  | ORPH 
...erpc64power8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003548  | ORPH 
...300c3GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003549  | ORPH 
...werpce300c3GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003550  | ORPH 
...e300c3MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003551  | ORPH 
...owerpce300c3MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003552  | ORPH 
...00c3UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003553  | ORPH 
...erpce300c3UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003554  | ORPH 
...500mcGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003555  | ORPH 
...werpce500mcGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003556  | ORPH 
...e500mcMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003557  | ORPH 
...owerpce500mcMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003558  | ORPH 
...00mcUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003559  | ORPH 
...erpce500mcUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003560  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003561  | ORPH 
...scv64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003562  | ORPH 
...iscv64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003563  | ORPH 
...Shsh4GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003564  | ORPH 
...ootlinShsh4GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003565  | ORPH 
...nShsh4MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003566  | ORPH 
...BootlinShsh4MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003567  | ORPH 
...hsh4UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003568  | ORPH 
...otlinShsh4UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003569  | ORPH 
...h4aebGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003570  | ORPH 
...linShsh4aebGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003571  | ORPH 
...sh4aebMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003572  | ORPH 
...tlinShsh4aebMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003573  | ORPH 
...arc64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003574  | ORPH 
...tlinSparc64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003575  | ORPH 
...rcv8UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003576  | ORPH 
...linSparcv8UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003577  | ORPH 
...orei7GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003578  | ORPH 
...X8664corei7GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003579  | ORPH 
...corei7MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003580  | ORPH 
...nX8664corei7MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003582  | ORPH 
...rei7UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003584  | ORPH 
...8664corei7UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003586  | ORPH 
...core2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003587  | ORPH 
...linX86core2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003588  | ORPH 
...6core2MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003589  | ORPH 
...tlinX86core2MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003590  | ORPH 
...ore2UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003591  | ORPH 
...inX86core2UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003592  | ORPH 
...6i686GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003593  | ORPH 
...tlinX86i686GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003594  | ORPH 
...86i686MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003595  | ORPH 
...otlinX86i686MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003596  | ORPH 
...i686UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003597  | ORPH 
...linX86i686UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003598  | ORPH 
...lx60UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003599  | ORPH 
...Xtensalx60UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003600  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003421  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003422  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003423  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003424  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003425  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003426  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003427  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003428  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003231  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003232  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003280  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003281  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003282  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003260  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003261  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003262  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003263  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003264  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003265  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003266  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003267  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003268  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003269  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003270  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003271  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003272  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003246  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003248  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003250  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003251  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003252  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003254  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003289  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003298  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003285  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003287  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003291  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003307  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003309  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003295  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003300  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003313  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003302  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003316  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003318  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003293  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003311  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003321  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003327  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003414  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003305  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003290  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003299  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003286  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003288  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003292  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003308  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003310  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003296  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003301  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003314  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003303  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003317  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003320  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003294  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003312  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003323  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003415  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003420  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003306  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003324  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003326  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003329  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003331  | ORPH 
         TestOpenSshGlibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003332  | ORPH 
        TestOpenSshuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003334  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003336  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003338  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003339  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003341  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003342  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003343  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003344  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003345  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003346  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003348  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003349  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003350  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003351  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003347  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003352  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003353  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003354  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003355  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003363  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003356  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003358  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003361  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003364  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003366  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003368  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003370  | ORPH 
   TestPythonPy2Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003372  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003375  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003378  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003381  | ORPH 
    TestPythonPy2Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003384  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003386  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003283  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003389  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003391  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003393  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003396  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003399  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003401  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003403  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003404  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003406  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003409  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003411  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003357  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003359  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003360  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003362  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003365  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003367  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003369  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003371  | ORPH 
   TestPythonPy3Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003373  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003376  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003377  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003379  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003380  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003382  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003383  | ORPH 
    TestPythonPy3Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003385  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003388  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003284  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003390  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003392  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003394  | ORPH 
      TestPythonPy3Pytest |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003395  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003397  | ORPH 
     TestPythonPy3RpiGpio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003398  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003400  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003402  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003405  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003407  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003408  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003410  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003412  | ORPH 
                TestRedis |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003413  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003416  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003417  | ORPH 
   TestSELinuxSystemdExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003273  | ORPH 
...SELinuxSystemdSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003274  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003255  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003418  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003419  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003257  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/998003258  | ORPH 



-- 
http://autobuild.buildroot.net
