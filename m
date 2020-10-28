From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Oct 2020 08:09:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-27
Message-ID: <20201028080916.469CF203F9@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 33  |  2  |  0  | 35  |
  2020.08.x  | 34  |  5  |  0  | 39  |
    master   | 204 | 115 |  0  | 319 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 18
              asterisk-16.13.0 | 12
        host-sentry-cli-1.57.0 | 10
      libabseil-cpp-20200923.2 | 10
                       unknown | 7 
                   sshfs-3.7.0 | 5 
                  boost-1.74.0 | 4 
        python-m2crypto-0.36.0 | 3 
              bitcoin-0.19.0.1 | 2 
                 dc3dd-7.2.641 | 2 
                harfbuzz-2.7.2 | 2 
              host-guile-3.0.4 | 2 
 host-libabseil-cpp-20200923.2 | 2 
                 libraw-0.20.2 | 2 
              micropython-1.13 | 2 
                openblas-0.3.9 | 2 
                    rpm-4.16.0 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
                apparmor-3.0.0 | 1 
               belle-sip-4.3.1 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.0 | 1 
                  dnsmasq-2.81 | 1 
               domoticz-2020.1 | 1 
glmark2-c493520253fbfe3676c... | 1 
      gst1-plugins-good-1.18.0 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
                   libcap-2.44 | 1 
               libglib2-2.64.4 | 1 
               libuhttpd-3.4.0 | 1 
            lttng-tools-2.12.1 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                opencv3-3.4.12 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pulseview-0.4.1 | 1 
            qt5location-5.15.1 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.10.1 | 1 
                suricata-6.0.0 | 1 
                  uhd-3.15.0.0 | 1 
               util-linux-2.36 | 1 
xdriver_xf86-video-nouveau-... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/9a7430384f23251bb8c8ec8483cea46fb9d4490c |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/da4a29d3b39ea0591d0a125b6f249d16bb4b908d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/45b50fd9cacca342bb018264863e72eff33e3af3 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2c133e300b5132d2d79afd3dba390bf8b642dc50 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/845660e827c715d57ce50c939260b981ef4b34e1 |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/315391f06617bb879c063a24e52bd58ce20169ba |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/99942db28900a5b55181e8fbe8886a377302819e |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/696fe62b6a0ae5848ad2a75a4abb7b8a7d6bdefa |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/57e2b49c2e6863f5324b050b7d89e8f7dd6a8e6a |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/005b4b3031b4f435cfcbfbc7275261ca8a894056 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/01669a654387ad877dcb5b17f5bebf2b8a709e55 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d3a58a63689ace895c6e6b6c9c71961c0cbccd1a |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4531c55ebea8ff08ba6b04300f750e7eddeac389 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/3a00683d2dd8f6bce9a29e50b79fb1b1087fa09f |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ac085a8e9beaf869a0153adf9b834b5519d4f887 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/da5cecb91ff9e716780ed3f4c89a6f4a7e582c6d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/02c61bb2debc09f9127747e520d4c6d8e230adce |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/15705cb7f63184c0794c14811b81d7ac950c75f1 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7785f3b7050b1151e97a5bf9ef2be08f5f1fc406 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/081dce56fdc590472ea9dfde891a6b660e3127a7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a5a27118afc19f9e9d94fb2cf5057e77a9f544ab |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/95d9b6ca896355f68d57812dd1ae19d3ea0bfdc4 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd991c58c55c170bf3eb44ff3da4e197dae4d68e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/870a72be289cc244b6b37e9e97883c3a39dc0bbf | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/99fbfcae984e7ed1fbe4c22a8b648f3d77dd3959 |     
    mips     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/d66ba1205050b9cd7c264fa566a93ca34326cb7b |     
  mips64el   | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/ca5ff958bd54d468b8b68546a70c3559ccef2c6d |     
    arm      |    gst1-plugins-good-1.18.0    | NOK | http://autobuild.buildroot.net/results/c6d803ca50ab68a5e2aace8b435ee6c462aa4c4f | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/2fd16361bba2aceb345fb019e707d4356768c4b5 | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/45d4580503d6c936d6a404d87f2954af3568f16c | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/56673a2b842e7316315fa6fc054ccc9029f8d56b | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d3fc78c7aa86f9a0f214efec8be1cddf4d8d0f9f | ORPH
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/aa899eedf4c1c78e26e82326db62e03664d44218 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c5579766c98810f3c6ce996da19382a938730d62 |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2ac77792a32f7c0f7e7b0f074f1a78f83bde6b8f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5f429c48d489eb9fc6aad94410f6b7f378a2430b |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/66337df35b56e128b96b80b532bcba7d930ef883 |     
 powerpc64   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/78dacc84f1ef6615c8d50d2ffae37231a504a442 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/bc618aa7a84f112ac458f9455f1f76259c1c8314 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/eb904034d16e6a72dddff5a00e5462a47cfc78cc |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d441ece3cfbb0f54cc8a39caccbaa9549c384fc4 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b7ba1c0cc7aa3bee3280914f02219391560af93c |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/39b1444debd22c4385ae8420329f66f297c94ae5 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/879ee594ee29e25934f2b4d87f08bdd68d15c1f4 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a582464acec3e1bf46278d389ecccdb22390bf37 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d7d17c6b4fb1a17206a7ce29ab6887c5804470a1 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8c7ba0609c601af7c7ed865dc8c51456d612a00e |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9130016f2c55c6396f8bae37d64a872678ed6b2d |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/910bd79a9dc300b71c1e99236cd408e6542a533d |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/363568d119506fa96b923e2914fab5bf9f67db43 |     
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a4015c952c55d1833caf89984578e85b6d7d2905 | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/c6516b6d95b1f65d798f2bad697561e7d9832ade | ORPH
    arm      | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/c3bc27bca5339cded68b8983dde1cdb18a0f43a7 |     
  mips64el   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/d0bfc7c5c57ec91d634c6ac61add31de877b43dc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/56203f137cefbbc8e5c87ee4f83061c4fed2791e |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36fa6f432a3300bcda5766156724fdbde0cc3ba7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b985527cdc59bdd602b2ae547f912de087a72ea |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d5fe533e4d590044c40f52caec94a30cc3285aa9 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dbaf92667539ac1db9f96d337c844bfed006a3cb |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fccc5291efe8f3eca805981019033e77ce309914 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58674d21b4701d7bf78d4daf1e3c46004e694ccd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9f4613e4533861dab4d23d7fea0efe7dfef866ec |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/216736306d6853ee3937cb1d9f4042f0568d0f30 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c71d3a6c3114cdd2aa6ae2fe552ed3c18230509d |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/85abaaafbae8d9d5905bd2c74338dacb163638d4 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/b3314cda489fd0bfea5868974df5c1ab70e3cef9 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/0477fea0381872502660d85fa20686411ea34619 |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/13fc37e8b2718a78b6bd8d913c0fa56a5acfe691 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/016ac21747fbcdc0c6e2e587ed85e81d7688cf80 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/2e02d21c3d3788fe8efe68c89a91159ae21b5503 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/606717459a44d1482e100d3baf9287fc71319ffd |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/edf83cda9240bc5213c4310a42b8adcfc23f554d |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/ee19c418a39db77fdaadd3e34387bf776ffd4045 |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/2a72445914df6c61ec353dbb874f92de766b7fc8 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/fc1e7573327c7412dfa45b45a96966d993c7fc86 |     
 powerpc64   |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/d2da9bda4e38b301d11d3baa66ea171e9e087171 |     
    arm      |         libraw-0.20.2          | NOK | http://autobuild.buildroot.net/results/162ac7510062e0c005ef6066f61f8de0ddba65a1 |     
   x86_64    |         libraw-0.20.2          | NOK | http://autobuild.buildroot.net/results/abef2ac14a959093a6391cad28e738558e15ceec |     
  riscv64    |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/5a8a9942546a6229303796eac2ff53e803ce3a8c |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/3db20be002f8ad03520e383a9429ee544185bc74 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/625a5abad8457fbea526a2db5848cf7b950d3402 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/06f4ec2559f5e2c8a87937b2b597ff49615ded27 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/eaaa0f05a3af0b9d98b789525f483e9b3d36c584 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0d600c39a9f46f969450041081508d916d00948a | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/3e0a7731df042e371d2496db4255769ddcb2af9b | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/537ff10ed007fc4b89d61661e95e81e2a3fc2992 | ORPH
   xtensa    |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/bebc54e9b0674fdd3570b8593a0392e582bde4f4 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/37f745469edf6acd38fe463128621356734909be |     
  mips64el   |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/3253198bad2991d893938b6525158f1fbf301d83 |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/4886be3b18155dc173cbb7db0ad3c0bbee3279c9 |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/5549da93b3b2181099629c8e2e78f58d137cc14f |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/4109ecbc7cfb8d531f9e569ea275d78dd9848711 |     
   mipsel    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/1c9caeaf1711ed94df9b1aa0e128f8edc2619d34 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/848d51e1c2c13e0416deb0c9354a893bd344a3a1 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/03223b36df2618f0e45b6ee09ac2e61c2a2bc2bd |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/7ed55688c63a41edd5afd6b3343db3f51143705c |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/68c3e99b3d007ba71fef2a2c11cad862b5ae11bd |     
    sh4      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/0eac8393858252595731f3c590152afe9cdf150b | ORPH
  powerpc    |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/1027969e856fcf487ad8deabf0d9170cb4522d3c | ORPH
    arc      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/3348f7b3a85cd8195d435ea0e1a16a59347b1895 | ORPH
    arc      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/7966069a0e50d6bf6f618e9f7950cb253438622a | ORPH
    arc      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/0acc380a0690652ae78fc3762fb66b25e1989c93 | ORPH
    mips     |         suricata-6.0.0         | NOK | http://autobuild.buildroot.net/results/6402a0e4b21ca78a515bc255055e5835214e4828 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/21dec2ca221b136c91f024480c1556b0fe862c9e |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/bdbdd891b7c2cba1d312ad5dbe4243c65d77d756 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2519bd075b8c021b440677297b32f16b1c3cc3dd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d57e24812a414d95e0b0816a182e63d0690282e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/187cdc282fc33a39a1be7bb6826a3084b3539477 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f782285f33b0b6029fdc16ea6c4a9c50fffe80f5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5a4129dcf5d30a7a0ecd9fbf9e4a8448d7118d10 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4c7b90d093e8f308505d457a9133ba74b2038a98 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/093650c9e8a7f971aedfee5fbb975cff5d46e1cd |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/235b4d30818002ec5e41d945deb70b7fe3d800ef |     
  mips64el   |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/4af9b8bee0538a5e683e64803493717d3a04abe3 | ORPH
   x86_64    | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/f7040ff3e8d287cea3c5345cc7b82848521587f0 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               libtheora-1.1.1 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/535912ef25fa910f608a0bcfd2f0c356ecf6f29b | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/14da8ae1d9c8e81899be9114b4a418011e4ded34 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 openal-1.20.1 | 1 
                samba4-4.11.13 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5733906458cb07ee409e069276af7ec020d96f0e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c6f4c6c85fd21b68a6a212f906d80db86d429e65 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ad7b2bb7916e09fdbbfd08732f7b24e5a6ce71ce |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/f2313c71bbd72a24b3035810e4a32ab34c3a1971 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/b816a090d6be45507a1bff9620adaf31ca9ba735 |     



-- 
http://autobuild.buildroot.net
