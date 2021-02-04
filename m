From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 04 Feb 2021 08:14:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-03
Message-ID: <20210204081436.2A83D87131@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  | 10  |  0  | 32  |
  2020.11.x  | 19  |  5  |  0  | 24  |
    master   | 178 | 93  |  0  | 271 |

Classification of failures by reason for master
-----------------------------------------------

              netopeer2-1.1.53 | 15
                  dhcpcd-9.4.0 | 14
                    mpd-0.22.3 | 10
                  perl-gd-2.73 | 10
        host-sentry-cli-1.57.0 | 5 
                 uclibc-1.0.37 | 4 
                       unknown | 4 
                  bustle-0.8.0 | 3 
             gdk-pixbuf-2.42.2 | 3 
  gobject-introspection-1.64.1 | 2 
                xenomai-3.0.10 | 2 
               belle-sip-4.4.8 | 1 
                    brltty-6.3 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.0 | 1 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
                   delve-1.5.0 | 1 
                elfutils-0.181 | 1 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
 glslsandbox-player-2019.08.23 | 1 
              gnuradio-3.8.1.0 | 1 
             kismet-2020-12-R3 | 1 
                libselinux-3.1 | 1 
              micropython-1.13 | 1 
           python-pybind-2.6.1 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
               wireshark-3.4.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/6e13da2bba0ef660ee8688dd11ec5201c6e3228d |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/9571535c05e29059e742a59c365917bcb2cb2da6 |     
    arc      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/4dd8243d3094cf9030eb32cfabd6942e9da164fd | ORPH
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/5a762238e525876f82438d6d1572720cc039b1d3 | ORPH
  riscv64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/87fa673622f8099acc39a311d886feabbfaa006c | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/395d5212a385a4b8b9e9e061d446c429df7482ca |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/7a332becb23988fc9336bb75fe8a033ef6f6ef30 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/89eabbd0e3d5bf0fbd8461614a095ec1b84bfc55 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2349b395da1529f5e1b4d673fe1119b62faa468f | ORPH
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/24683392e6d2eb628a80f25fff913fa5f9099446 |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/026c2ab0b269ee5e64c48bc7f9f078fcd6b4e5eb |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6c4ec4da41c2a2c55202577301342d6046bd8830 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e4962b919ecae7291bf4786fd06b9044e792ce55 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/77afc359b5e12e0ff7f7a016dba06aa86b67c99d |     
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/52852d12d67ceb6be0b6091f6021a5a2930dacf6 |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/7321c63b3862a153766b06945d0f62b18c631177 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/38adf0b3e1326dec35b460066e406e9746d0e3bd |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6a41246bf451c2322430932717e2466fcdad0a4e |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ee6959736fa24001325405345a6aba11981323b5 |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/1edf6e99ffde4a0f03ad55f44fbcd253bde12d02 |     
  riscv64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a12b3475d27df326cdc4037809ed582e63cd76df |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/3b3aea604aedb447cddf4611a45e94d225015c31 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/4ab3e8ff06337b8886a4a1a0caa9c608c4b2dd2b |     
  riscv64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/1076361131720ce9909d4ef1a8db1cd5fc89fcbf |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/0703ebe8eff94f177050b1e1b789858ccb80283a | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d6c54a9ce12de5863ccff1f53c65857d4e449238 |     
 aarch64_be  |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/f246ea54a4a4302d3188c1e37293d09638a8cb46 | ORPH
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/ef5e8558ad81df5436686b7c0b0afd19db260cfa | ORPH
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/a9852672a3b5fdd181e145386b6fe0064e08399f | ORPH
   mipsel    |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/0226a10b1c6bf4c38cabb7d1f3e4df1bf1e00e37 | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/3da501d0faa4a12c27593ccab2e73a5ee7256d9a |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3599528a95f38c2b4e37ee2485818cf0dd65961a |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/990ad1093c96caffffaff6c46bb0dcc4867afb7e | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ecb35573a838bb29c904e6be36a336ab2934c21c | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/101b806b14a93187f5be63caaf0c665525f0f7f0 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b08a18e24ecdc6e01887b6567436ac31c69a6a0 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/187a8c79b8029b116f9b1a50cbdfcd39cdf14958 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b337db5f19e272d6742003f6863a9eb41e23ef5a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ec4cb54dc1f39a287ad854598fec9d2cc6483f58 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/0a01f6121a9fb016a26e11e03a7b18b00cab5d37 | ORPH
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/39a5d53db5b2474a616013d04f523b516911d6d8 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/a8d19f3b1dbdc671844b923b7f62a34450e74d8c |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c8157e1498ddc62c6daa70b6640ba52630b676d1 |     
    sh4      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c4031495c7d2ed0cd03c63fd6f2553bd234cab5e |     
    i686     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/368a73eb8d9c51807f827dd7caad7943b9b11097 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/dd3d81bee3dca09afef5d4d70b3b6981695555c5 |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/40085f21f1e85b3d2b285b965c3e8d5344c42e17 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c17ce0014263fd41ccca9af414f3eeb1f7fae44f |     
    i586     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/ca97ef8f8c9caa81f6bd79f814b89c10a761df94 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1188eb52135e738383602c2210c3a9f650bc5aec |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c0e2b3736788cc3c54e8b5d9048de085f8229785 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1ad26635b0abfb931ae7e75c0e915654e99c8079 |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/94262d67479e5f09522dddcad80f1cbfa28bb2de |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/29586c1a151c635a2f392b37940e5025750ddfc0 |     
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b9b4d625bfebdde8e7c9fee03aafd1583d462910 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/de8576c96b7e8b75ed458f6f1bd0afac7887dcdf |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e66f200df0e0a9eddebc39789ac53f94c663d0d7 |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/0c93ad0fd897d21165bf6747233152f51cd1697f |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f732eb852892aba8d342ae0f1af303bc565683e5 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/9a6c5764ab0b7781078b19d4c85e1592a25cccd6 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/371a7fbf0f7cbaa7041c80d4652fa90ece499c7a |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/ad53c4cd8d436ab32978672bee3ca7220ab5e0e9 |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b7966856ac5612c5efedbe6508b5f1a4cc3f5fcb |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/84756dda4cf087043e6673867432fc730e7a19da |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/66d6c6730b3186921edc1090dd369de8bbd920e4 |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/14e0fb48893257055c990f67ed7298e9f7a9f899 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/98151115d4d5ccd779886b10415cea1aab19d4cf |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0e58dc8fe80a8794357378430ba0addf9089a863 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/5295a439e83bcbb9638ca14a1bf9c41307f22b57 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/b6734042463d4bb08b69a94345555691bb5da204 |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e4a48a092c86f80eb25e3fa57391cc2b1287035a |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/079c747730ae651ba4f81c7bcfeeeb3d907561d7 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/18c30f3e32390985f83be528ae139bd61dc5634d |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f069ff3bb98ea4fd62be85dd00aa925f362fde98 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/9128cd355735c2b93247fd20165bf69e076a19bb |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2050b4cb60f150e4ec31d1fb7af5f4b72c1097b8 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/73d714dd5282f03f6043910529e1289f870606c0 |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/dc134017b9f5b8607fcb1e0f739f65b05766cd56 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7e91b92c63763e15d361281dca4152f342a90d2a |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bbc85f08b5b3a942c2b59fd714e8440e67c05d7f |     
  powerpc    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/ac44876db27d374ffc594d968ffb8860b1be4041 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2687592ad9a33f2e24e9415904a2668dd46c3016 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/cc69790b26be158b4d6cc68dca26ccdee075b4b5 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/120ca2df01fc50643b93740ef02a115d09cf25b4 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0336f427b4c4eae7476a7a5a81cbf28282565cd3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5925d997660178e593fd6e7de916fbe5da7fe440 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b5687e6d6027fa30ebbb0225d020d16030a2244a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/351aa746c22edfb065da32de96b4193a6e22f76c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/703d90b6e49fa2b0f788e9c7370ba57f02e582a6 |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/f73eb291dac0282324beedd9969a415a3d3b0874 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2bc47615f9bd27ac13d1b7421ed69f8274793e53 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9a6e493ccce12031dd852ab19db54618ee60b479 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e7e858b13bd99fd184c4ee038797e23048adbba8 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  ndisc6-1.0.4 | 2 
                  botan-2.11.0 | 1 
                 gerbera-1.6.4 | 1 
             libnetconf2-1.1.3 | 1 
                qt5base-5.12.8 | 1 
              tinydtls-0.9-rc1 | 1 
                      tio-1.32 | 1 
                 xvisor-0.2.11 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/c7e41e4e696a8bd84f1da4871da01ddc854bee53 | ORPH
    arm      |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/a1d6881ee32adb2d254ddf3b8782047b86777c5a |     
powerpc64le  |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/d4a802777de32f54e8f209d0e5b4c6779d690d52 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f00e4c38bc580cf22f83a849a7ed428407c1416c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bdaaa61f94088115eb65a26d12fadc7c763dca07 | ORPH
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/43896a2b6cd4308b106a5a6dc04b93b1da5df84b |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4328ce0132ee28bbf4be2c3bd6a2d9a676a9dc26 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d98ad37e4377d935dfd57f47679968c466dc838c |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/9855365fb5cc27c6e7ed3ff0854ed72e352fc348 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/75ff71653942f511e07dde417ee590300f57bf5d |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.2.2 | 1 
                    ruby-2.7.2 | 1 
                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b4d8094fb7db22bb64069ca86e75e5b49e06b148 | ORPH
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7409f4e5636d5546331e58bd4c9d32aff254b012 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/8bf5c5d5d83bf9ebfa16b249a9bba8b5c022e5da |     
    arm      |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/d5e1211aa759a9784ce69ba3fc50ab7c32e08e35 |     
    arc      |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/372c0c3a663246032261f9570eaf2b522e8e1684 |     



-- 
http://autobuild.buildroot.net
