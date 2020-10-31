From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 08:10:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-30
Message-ID: <20201031081019.2A451872EA@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  6  |  0  | 31  |
  2020.08.x  | 33  |  2  |  0  | 35  |
    master   | 190 | 115 |  0  | 305 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 19
        host-sentry-cli-1.57.0 | 8 
              asterisk-16.13.0 | 7 
 host-libabseil-cpp-20200923.2 | 6 
                   sshfs-3.7.0 | 6 
      libabseil-cpp-20200923.2 | 5 
               domoticz-2020.1 | 4 
                  luajit-2.1.2 | 3 
               pax-utils-1.2.6 | 3 
        python-m2crypto-0.36.0 | 3 
              sigrok-cli-0.7.0 | 3 
              bitcoin-0.19.0.1 | 2 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.64.1 | 2 
              host-guile-3.0.4 | 2 
              micropython-1.13 | 2 
                   pcre2-10.35 | 2 
                rocksdb-6.10.1 | 2 
       shadowsocks-libev-3.3.4 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
                       unknown | 2 
                  zeromq-4.3.3 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.74.0 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.0 | 1 
         conntrack-tools-1.4.6 | 1 
              cryptsetup-2.3.4 | 1 
                harfbuzz-2.7.2 | 1 
                   libcap-2.44 | 1 
               libupnpp-0.19.4 | 1 
                lmbench-3.0-a9 | 1 
            lttng-tools-2.12.1 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                opencv3-3.4.12 | 1 
                openntpd-6.2p3 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    ruby-2.7.2 | 1 
                snort-2.9.16.1 | 1 
             stress-ng-0.11.17 | 1 
                 systemd-246.5 | 1 
                  uhd-3.15.0.0 | 1 
                    xen-4.14.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/145d96e00211f6ff48609ec7ba66e05019792fb3 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/353b7aae4e1fac837702c466399d649bcaea0d38 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/557b11f9e98ebc814a42186dc2dc0a639dbbab99 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/644de4f189a7d135017c5bad9d98a11e72974395 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2d8066b3734f9e49bf2ec48b82dc6ca71be4437d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/df286286e939a6e0008e5b133cf2566d62240c44 |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/74d8e07c56ecf23ba37a7ca6a4273cdf6274b379 |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/534219d73ef26666c8e09c356c66c0cf1863bfcf |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/102ac49d4abf66f19b4cb4da1b7fe6dbfd9821aa |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ad09bfc2d264eb551211aba71e194adcc9fb1156 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/085a016a99f8ed11e3f368f5b68142ec2a854c51 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/38c70f5daeb32cc9465b6cf0efdbaa396a2b86ba |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/d64ec727b4cbcfb0a444a8d127da0dc94ddc9e41 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/c52ccaed8c8f6d7c9ae5a04a37ba2a862a2d507a | ORPH
  riscv64    |        cryptsetup-2.3.4        | NOK | http://autobuild.buildroot.net/results/9db89ddc2e59590473cb2c7ef80abafbda5ae636 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b5e80f56c6ea99a43cdfd708144cdbb25c95141c | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9e408cfba5dc213bfa7081f67c1d9d43066ce17d | ORPH
   s390x     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/150ac13c5810be140624355d3754aec5d5a295c4 |     
    i586     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/743ed684c2553a9ea53feb5ffed06c5d50f9ca06 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/612bc7b360843b3f282e9f769ee0548cf6341cdb |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/595af9bd4c6f229e10b02e479f77b2e864144dbc |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f22032bf9bda9688190da6bc871fbbe7d9df1c2c | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3f37981dde0aa5d0892221e764487985f4ccfaa7 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/8ed6153d141a3576f75dbd3988cc0b4cf3c79b61 | ORPH
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5a5286c5b5260e9d2afde60a37e7484759823250 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/25713c5fbc38a216bb55172693679c567a25dac5 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d9ddf0f4b905caa0a3ee6bce40fdb9b6d4d0f12d |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7cce5ab0c10e848178bdfc111f6d098f8a7a6419 |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/da38c04bb4f001fc682992c14459270201a6c5cd |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c23b5d87cc7ded8f5a41d0ed7a093ed86f3c16b7 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/afcc52b58364827487f91d7c75b5a58968a6b65e |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4e1b0421d116a7d9978e7042fed1a43de535d549 |     
    mips     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2ef18fc92e7a96299dbdcd921b1392098b999fbe |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5395c3f14c85857a1698a1999cf3f4888717c83a |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/355fcd9de4171b7bd1c99b56d5959896effaa36a |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/bee111e33b71c543ebbd582d481957d70c19df11 |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d69aace889c6ed751a5e58b1de9e11dfabf9d7db |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/aa566d998404907e5d75a034dfdabf474d0be39b |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/886adb49b1c1187e7ff07d1a1377497e59c89eaa |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/11d9897acad16d5538b017e2386b3775f68c1547 |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/fe44c1bbd7aa4bd84b7a5ea5a1665eda8607c2fe |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b0bc8aab2e02fa53ffa7bb5d5036e8842e8d5211 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9e33d9c1efc7db90bd545f6382e86213a1687e22 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/2815c60521bfea477fd00d4071db97017a2c7a5e | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/dc7064cd5987ddd09872298dc4c68021837325e4 | ORPH
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/aae55dc60a3385ee578d5f517e008f7196c0ffae |     
    i586     | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/9801246bbd4ff448506ce855b7610c11f6231f90 |     
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/97555003382f5ed235214c9ef7adb2d4cd55e7aa |     
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/7f6aa688f211a1cac81f5977745aaca54a29c18b |     
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/6da91049ac5e82f43e507fa566c6a72359bf0230 |     
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/ab372ac9de688ed7cecb9d731650d9bf9220a194 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/31beb3a539e2e9233f47c5ebd16bcb2478759b48 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/861a9b1fe16f06e6a65c5a0b2ca0722093c565ec |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/85d588169e23dcbc5bbd5485fa4f370cb0c04e2f |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b5f100ca653027b10c76daef1dc094eb579ab21 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3b6a1bdefab49f8e157b37090afbccd707d04cb7 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bdcbe820d8809632d458bac514f7ae11d09931d1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d99c20f013fadb148c77135042cc1607728d61f4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f80e187e093c477af5053ae38d94a34fee55ee66 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/13fa8324c618c196f8d7988c1cffdd762b1a2b14 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/b0460393252807e7bc338e2e5d3c2a084b5f9a26 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/d71029693be0d111a1c0cff42f76a03d764627d6 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/2165195b21adaf300f1b3f6f5531c6cb3195dd23 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/fee34365992c5930b4c5967e0a09e9325d52508d |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/cc7b94f2e405b1ffdc4fe51997e61864fa3a4cbf |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/db5cf8f13095e20ba026a5282163dcd34402a98e |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/2f38d63d4de796c6e1c34bfe6db04c0d843bb508 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/d3cec46a9f092529b9482f450cadd1af06161b2d |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/9cf513886b67738ead7937d5724b9947bb0771be |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d4b3fcbcda372234aa11ddd7fc1c60ab9182a2e2 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/955d553079743442870a3034c90d3119163b29ad |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/6ec715f8640c233073c8ec57c2eba95c6f4ac986 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/23ab26ead4647439ce6105ad6e206b064ec20563 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/01939a1ecaed9b63158d9f9dfde5744739fce218 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/097a43ecd24616a1a92cabe49f8392f13e8862b9 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fc59fc553fc6306a09c9e70abd8f2be3a1a4036a | ORPH
    mips     |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/017b35d19f31687fbefa904a3e21795340756b88 |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/d6d07b8a94318d8ffd9471a05550c3321658fb2c | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b5709b1b7d85c981b9e838f2c09b225f42bec327 |     
    arm      |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/6031745814357a7d69b72856045a1266607a4bb2 | ORPH
microblazeel |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/2e5e15366f2e9ee1ddcec74e0b3c5563f870a794 | ORPH
microblazeel |        pax-utils-1.2.6         | NOK | http://autobuild.buildroot.net/results/159fa6785045f750e909aea75d2c774eab72ce80 | ORPH
  mips64el   |          pcre2-10.35           | NOK | http://autobuild.buildroot.net/results/969f1024afcbe3fdc8050eeb7efa0dc764ad0463 | ORPH
   mipsel    |          pcre2-10.35           | NOK | http://autobuild.buildroot.net/results/544d76162e262490fcee4f9544320cdda471adf7 | ORPH
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/d85f25895a78766802a51aa54f7c953ab78115b6 |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/155edc701d6f9bcbd5269d0195bbaf7ffc290d26 |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e5202f65841297e3277ce9ba72ecdc5c75777f03 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/78315a576e3b31e6bea276ffe8fcace74d4f6299 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/33a20c465af190cd5bf68e8fff69c510b60e5735 |     
   nios2     |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/7eade1f7de2a0190cff4a28a6b35927cb73b42cf |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/ea0869b258283b1bde7e2e46eb5241bae3f49391 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/ae67b7a01d6b0eba59c0878bf0da06001ee21e03 |     
   s390x     |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/835fe3ab02f42f8cd29261d8637c0b1cfb81736f |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/314f1e42df5eef2d8d89e104dbb4443f6df511fd |     
    arc      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/7f5223ca834da769cb4446de104230d5a9eb4961 |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/b71934f6e9c3a19e5279a67cfec114d0c421e9f9 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/987beb115d384d6d65a4fc3809da1d07eea73390 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/3eef6e09ba276910f726c8777fac9852dce7f157 |     
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/a679bb87d7470744c7a0450f17bf2e76185313e1 | ORPH
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/80a488aaa98bbf4c16f0637b992b429d50d87df4 | ORPH
    sh4      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/69194a14b6a49370a521b3fdafdc5e5a224c1ad9 | ORPH
  riscv64    |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/dfff38e8dabf92e68164745c4b210d7df19c87a3 | ORPH
    arc      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/da9109514fdc698277ab7255f409eaf6ab7ae4be | ORPH
   mipsel    |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/d4139d667130cc3ae1e3ef65957dea9308b5b2f8 | ORPH
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/2f98c5d9ca907dd62b30bedfe4e52b014bb3e8d1 |     
   mipsel    |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/3f772e217fe128630697ca00762c5f0b62c3a45c |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/3fad7713c683eed03454841f29ab9181a506cf39 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/fc09b681fa2a4e23127dae7855c398d24c686b64 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/4e43b05eb974f02bbcddeed0d661fb3f1e80e98e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/49bbaeb3f827773cab44fbc2fe693dfbe5a2a4e4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4122d9fd4d3e313a6d9b40c5a71d603482e8295b |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/16c6ee6dabb979b28275bf3f8440bb3d9cf3a115 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/55acdda37d1fa6bcd3d5ae34ae6abe09c6563099 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f4e3b774eff4ca1c278bb16966032c4f6b8ec204 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a8980f6443a73115746ee515cb28d734f58de8e0 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
 glslsandbox-player-2019.08.23 | 1 
             kismet-2016-07-R1 | 1 
               protobuf-3.11.0 | 1 
                  ramsmp-3.5.0 | 1 
                    squid-4.13 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/bce6665082629bd94d088077f9a3c5a90a7e2043 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/fba59c8becc68f249f0f16870c75a1a06a067a95 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1e955a35b0bde2fadd282ca781abaa2252331839 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/bee94233a8dd7165ab9a6566f0fb6c016b461e53 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/350c9116a881c37c5bc14eb96e3a2c91b4827c46 |     
    or1k     |           squid-4.13           | NOK | http://autobuild.buildroot.net/results/8428039c34e121d2cdef07fcd1820c8e7b3e79e7 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f66aafb1dfc3c80df1f6b0f897a75baa207d376e |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/65f005efb287ae2eb5a4afc46cc05ee24f560131 |     


Gitlab CI results for 2020-10-30
================================


-- 
http://autobuild.buildroot.net
