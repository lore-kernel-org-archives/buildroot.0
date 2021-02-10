From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Feb 2021 08:16:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-09
Message-ID: <20210210081659.35EC28691E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  6  |  1  | 25  |
  2020.11.x  | 25  |  3  |  2  | 30  |
    master   | 132 | 88  |  6  | 226 |

Classification of failures by reason for master
-----------------------------------------------

              netopeer2-1.1.53 | 13
        host-sentry-cli-1.57.0 | 8 
             libopenssl-1.1.1i | 6 
                  dhcpcd-9.4.0 | 5 
                  zeromq-4.3.4 | 5 
                    mpd-0.22.3 | 4 
                  perl-gd-2.73 | 4 
                  monkey-1.6.9 | 3 
                  ndisc6-1.0.4 | 3 
                       unknown | 3 
             gdk-pixbuf-2.42.2 | 2 
             kismet-2020-12-R3 | 2 
             libgpg-error-1.41 | 2 
             libopenh264-2.1.1 | 2 
             babeltrace2-2.0.3 | 1 
                        bustle | 1 
                  bustle-0.8.0 | 1 
                        c-icap | 1 
               capnproto-0.8.0 | 1 
                   ccid-1.4.34 | 1 
                elfutils-0.181 | 1 
                           fmt | 1 
                        hdparm | 1 
         host-shared-mime-info | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libgeos-3.9.0 | 1 
          libmicrohttpd-0.9.72 | 1 
                libselinux-3.1 | 1 
                libshout-2.4.5 | 1 
                mono-6.12.0.90 | 1 
         mono-gtksharp3-2.99.3 | 1 
                    noip-2.1.9 | 1 
                openblas-0.3.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    orc-0.4.32 | 1 
               pcsc-lite-1.9.0 | 1 
                     ply-2.1.1 | 1 
                proftpd-1.3.6e | 1 
           python-pybind-2.6.1 | 1 
                 python3-3.9.1 | 1 
                    qemu-5.2.0 | 1 
             qpid-proton-0.9.1 | 1 
                  quagga-1.2.4 | 1 
                rocksdb-6.13.3 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/2f83da4c0b7b339d2f656189106f343cf2e58159 |     
   x86_64    |             bustle             | TIM | http://autobuild.buildroot.net/results/5401a6a186fdfff360ea1d5a4507df722e43bf90 |     
  powerpc    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/34925cf03e71a3b5767bb2d5c69b0d0e027aa0b5 | ORPH
 aarch64_be  |             c-icap             | TIM | http://autobuild.buildroot.net/results/7e4f2dfa7ba66cc0db4644e0845f5f9e141cdaf7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b0e801db5874fd52a0b7840e05d488ad59beffcf |     
  mips64el   |          ccid-1.4.34           | NOK | http://autobuild.buildroot.net/results/c1464e70a4319fd9175eba7a38c623d1680f5ed8 | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d68867460c8876e2293fb22f1110d3967df792e8 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/526cbee17ce9589d99a39a0588014f86466e5640 |     
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/c0b60461d980fba41bcefde24b34c8ec0d50246f |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/82b72a5b8ea8d171c6a113137484e95cade8d1e1 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/081ea32abee43c5cb5a5caf2405798dd0a48105a |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/2c6a8e9bd0bc99020a19cc6077aefcdf61966af0 | ORPH
  aarch64    |              fmt               | TIM | http://autobuild.buildroot.net/results/2b6211168ebdee82529fc0d582ff6c2fb6fd9cfe |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/498ae5b16d78e23ac66065c27f4717fbda6a0b92 | ORPH
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/79c9e73202ed7c1e044d1b3126649696e297ba7a | ORPH
  aarch64    |             hdparm             | TIM | http://autobuild.buildroot.net/results/765af987c586d56f20071125ac555e53c84c1ba4 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7703487f02d76334802ac7962077a8f9eb3459a8 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa07d3f2c0e0123ca22c79a08d2354a92e9d17d2 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e6bb83e6ff58fd5f64f6608d8c6f51778f81b930 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc9281fd2f592208558a7d25833fff4b3068b383 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc8255f34638a6033a65238bb57aa1ea8dee8393 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4134f274cc2c275da2c56d96856aefa5847d6b8e |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c04eb9fd7f7d3cac67542e793403a1bced34884 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c24f47d2a263275bfd0fdd5139bbcd7f01b5b8d |     
  powerpc    |     host-shared-mime-info      | TIM | http://autobuild.buildroot.net/results/58b1aec1c5d1b1761dbf33fc9d04f463c6e5148c |     
  powerpc    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/93fc838e48476bf0ebf18d29dd29739cf93907ea | ORPH
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/47d27cf0b676a2db50636b0bcae89fcda15cd47a | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2a79036fefdf420cb6fab49350972ceeb298cfc1 |     
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/52b5498ed68482aeef2c4e6c862dc94d359a3649 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/49bd4fa09e4a59cc775d9d60e30469e6dd7a77e2 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/a8da24a378ee46148a9b093fe7612e20eb14b78a | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/8beebe23efb225621ab007acd385237878bbdb82 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/a3cea5404f2ec74f60acccdf6b5f96fb0c0de71a |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/8b63a952a0954d5c644e08575b0b2b2f9f4c2344 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/598e28fc019a8c2d2024e6df5445e82920213d3a |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/5632e77ff405cd414bce34ab8ee66c515cb224af |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9ef74003ed2914268fa948f693f52e1c7afd594f |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/b730d490c3b2c9d434c1e16e29a99c79dedec1eb |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9d6eef36b2b55ddc5465ac6abe08192bccc15fec |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/e061bcc42aae59baf655ba15918e60d9763e70fb |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/dccadc0f24d7e0f66dabcc980136aa84b7f413bd |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/5ed80fbf25ae6409a2796957cb93295b0892ae87 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/57337de4a39e2a304e1da2326f48f0cc502db75a | ORPH
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/7caaff83e10731acb407e904413b905145dd734b | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/16059d77a2b358d428047ae8215a32be0384e50d | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/c93ce8d63f0fde28559503e19013fec8286de008 |     
    arm      |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/16cf2a5906dbc80ef0dee286c273bc5a2cca9739 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/513e258732bc7b1c7e7cb94d7295f156b4b1ac43 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1eb953a491ed970b232130e5119aafd5d3aa8473 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/15da37cf96d4a19cc9f3dcff687351d32ef5a602 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2fd4e47d7cf7a114b0b321e0fc0cf62a757a043f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/49ddf17b7382320d0f7721db8c1463a4027acdf5 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e3601816c5f3047cf537dde028e8fa61bc827b51 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/19cbc066f621ed11b2767eb941bcd37bef9ce18b | ORPH
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/7e961053e3a0d374091705e41007ada87d643d00 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2d437c4f7dea563c9dcc5c3021eaa2201bb90991 |     
    m68k     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/38b2825228ce9a68f6bdfdea67fd9491b7eea9af |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e005034b3270e1afa53671c4533a9107270345a0 |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3f5d5d5b5089c65e8e05d1cac23d8d7a7e319c8b |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b42ae9dbbc5bf4d43a7470d8b6fbc08ead4f01b7 |     
    i686     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/42986360402b054fdcbcc6ae859872f8eff6de24 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/69e6bc7c10fae3abf45e214b6896edd653a267b0 |     
powerpc64le  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/cde7ea6817b458768fefd28c31f8917baf1b7b8e |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f4a2dd61a3c412a7cd568f258d9119bcd45c0cfb |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/43697d0b69cb964ee555176854c81a3dcd1ca93e |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/915d2df13c199827a26ff624acef7d58e6aa9512 |     
microblazeel |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a44589006fce172f2401675c8316f39c58432ae1 |     
    i586     |           noip-2.1.9           | NOK | http://autobuild.buildroot.net/results/4eb76c1926afad275a88fa69f9d13f796826290d | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/cfa827af32d24f16ba876d8cb8fbf0f7b4984157 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c6c2d127b0f431b9ffbcfa8ad91f77d1a56cac78 |     
  powerpc    |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/3a199bfe36b7c983993149402ad7d9e017cc7f03 | ORPH
   mipsel    |        pcsc-lite-1.9.0         | NOK | http://autobuild.buildroot.net/results/3fd93c26afb1a729f19a10d5455a0091443d79d4 | ORPH
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/b8925c143028c7f5bd69f226261ab12ec624f45f |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/136172daf3b0a15a877386ce31d767e775e9299a |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/544d0820d36c27d6af8264aa8baf2cf0c31a68a0 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/25b2119f933f3797025553b16dac2408c6ce0a94 |     
  powerpc    |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/22cdad31b821b19e7b28c3c901ccdfb630a0fe53 |     
    arm      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/d7c8908d50008c19315859b2edd42030fe876436 |     
 powerpc64   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/50c061c9f79252d3a80bf8638a3a626f9cc84fd3 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/88d1f2dfdb6e1a1bce35f9a30da4c036b2820037 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/5fc1607b126f1c9ec89ddf24c98b166e513cd334 |     
   mipsel    |       qpid-proton-0.9.1        | NOK | http://autobuild.buildroot.net/results/fe0a80ce3d452fb36c122b166eab6946877d3377 |     
    arm      |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/21049191d4a4255ad08a3d70b1d705424d2d23a4 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b7b0caec983dd99d17bd48a98a6eb93ea209513f |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/a694f8e1f1daee769bd9fadd218ed6cc7926b655 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e04f2094a712342537cf4bdacb86072a9cef4dfe |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf1bacb0369eda485b1c951138fddb23fea9a7fd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/252f614d596290ec1aa3365475b91d7e56727c5b |     
   s390x     |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/97628e92ab3306239c4b1c2c43249f4903f8b262 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9a503d064604c8e17abf83d5464cb8f39358e1d7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2fef991cf67dc759101031c901b3baff41d19f4a |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d2d3e6a671a9a63453125bdd1e98875a977c088b |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/36bab0f400cc1f24e0aa29c6c08d43c3e71c20dc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7e8b8387e90ec3ef93b7e630ee8a8b59a5f7c6ba |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
                        bustle | 1 
                     daq-2.0.6 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
           host-xcb-proto-1.13 | 1 
        qt5imageformats-5.12.8 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/22d783540fb6333313d9dd6e462f4000d6823216 |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/08ec62567fc30fe1fda254bc0b25a50edb63bb7e |     
powerpc64le  |           daq-2.0.6            | NOK | http://autobuild.buildroot.net/results/eacb2fffafb2f2dc12d435f13cba50779ffd31a8 |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/75d346daa82639eda30bf4a23a37ddf8fa506093 |     
  riscv64    |      host-xcb-proto-1.13       | NOK | http://autobuild.buildroot.net/results/cc4e5f7fb6dbe150f2b90ef0eca3683014869efb |     
   nios2     |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/8d084faa339bf4758f1f360c766c93d15e105aaf |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d2eb4c16afb9d5f1d824bc75f7d978234daa8898 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                           fmt | 1 
                        hdparm | 1 
             host-cairo-1.16.0 | 1 
               qt5webkit-5.9.1 | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |              fmt               | TIM | http://autobuild.buildroot.net/results/93a9bac8066cbea623bd995d547447b66110fac8 |     
    arm      |             hdparm             | TIM | http://autobuild.buildroot.net/results/82cb3d21af1941811b92694f2c7a0151205d1ee5 |     
   mipsel    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/f8477675c649d137a67140dd9c0e8088081c1d3f |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/f863c2d05461d201a11e6ad86065bd380895e44e |     
    sh4      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/46f4d4394e459362c975dc45c564f6489ef0ef8a |     



-- 
http://autobuild.buildroot.net
