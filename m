From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 07:11:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-18
Message-ID: <20200919071127.110D087394@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  | 12  |  0  | 38  |
  2020.05.x  | 31  | 16  |  0  | 47  |
  2020.08.x  | 17  | 10  |  0  | 27  |
    master   | 160 | 126 |  0  | 286 |

Classification of failures by reason for master
-----------------------------------------------

                libpfm4-4.11.0 | 16
              asterisk-16.10.0 | 10
                 gnuplot-5.4.0 | 6 
 Makefile:752: target-finalize | 6 
               apparmor-2.13.4 | 5 
            ghostscript-9.53.0 | 5 
         libcpprestsdk-2.10.16 | 5 
                  luajit-2.1.2 | 5 
              micropython-1.13 | 4 
                 uclibc-1.0.35 | 4 
                       unknown | 4 
                   dav1d-0.7.1 | 3 
                       iwd-1.9 | 3 
                   libcap-2.42 | 3 
                libgpiod-1.4.1 | 3 
                rocksdb-6.10.1 | 3 
               belle-sip-4.3.1 | 2 
               capnproto-0.8.0 | 2 
                  dnsmasq-2.81 | 2 
                   guile-3.0.4 | 2 
              host-grpc-1.31.0 | 2 
                   libnl-3.5.0 | 2 
               target-finalize | 2 
              alsa-lib-1.2.3.2 | 1 
                   attr-2.4.48 | 1 
               audiofile-0.3.6 | 1 
                   axel-2.17.9 | 1 
             babeltrace2-2.0.3 | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.74.0 | 1 
                     cpio-2.13 | 1 
              cryptsetup-2.3.3 | 1 
              fstrcmp-0.7.D001 | 1 
                 fwts-19.09.00 | 1 
              gnuradio-3.8.1.0 | 1 
              host-guile-3.0.4 | 1 
host-meson-tools-0a02e2d344... | 1 
               ipmitool-1.8.18 | 1 
             kismet-2016-07-R1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libupnpp-0.19.4 | 1 
               log4cplus-2.0.5 | 1 
            makedumpfile-1.6.7 | 1 
                  monkey-1.6.9 | 1 
                   ncurses-6.1 | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
                qt5base-5.15.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/f38f2128fa296e879ba79ad4afcee90a506356ec |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/398745f5d3f01c708e956b4e4efa65a563125ffe |     
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/92f103e32059ef41fcbe11d81dcd7b502348a1b5 |     
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d86937c975facbb23198d2096e64d5dfaf098e77 |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/cbbebb94b4d109e10663d69ad88d0adeabcbc043 |     
   mipsel    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/b564e9f834b907505f436991be98dd397e53644d |     
    sh4      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/97dcbe7a508481ff8a6aff99c51afe04bba54402 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/291b3b4b03fe2b1db5e6ccbf5c4b1a05e0575f87 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9cb50dde475a1d3fa008bde3d961e04a90edc600 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9c9a65467ba4010955df600d0e966710c5780cef |     
   nios2     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7fd9549be9bde9dc29e6062cc955e6499e59fac6 |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/52bd24d070a6305b0ceff32955af710872e2c2c0 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/6533108f5dc70896b1228417a28106e01283989e |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7f09d20a5212b7a787273657aa4076db85a8c6ba |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5ace6b42243d836a4de5a980473420ab7ae24ffc |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/485f72e672f5396c25f05f23ea57af23e7ede1da |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/1382a326f624a683020756af99c98927b0cc4a72 |     
    arm      |        audiofile-0.3.6         | NOK | http://autobuild.buildroot.net/results/e9b0ade9190a6bf89287ec43d889d91e6b3b21cd | ORPH
    arm      |          axel-2.17.9           | NOK | http://autobuild.buildroot.net/results/cd3fc72a8b916dd13f6265f7737d80820097d428 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/086cba0fe233e1bff4f7fff73a01a1209984c138 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/8d9446bf08c191a273cfe1f3dae1d4683a39d87f |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/0e1ef4a10237353d1230db396d4b2168c77b3316 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/2ea2cb55b654812f614cf596c8129f5dac02bfd8 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d584a120329bc929255d32265df7ef7dcd598dda |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2d6b55562dd94c428d4ecace1824d0a4c4dc99e5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/300fbdbc8ab2f0d126c4ff2b14cd128a8177470e |     
    arm      |           cpio-2.13            | NOK | http://autobuild.buildroot.net/results/7db2ed799e0a5b054c3b8871f56ca0c29e47f957 |     
    arc      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/b819f0c8ee95b92d6adef37db563af25dbec04c9 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/fbcdb3f9be55f482dd6ccfd32b67aab793b1b353 |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/70a19418b8903b8c5c1dd2d8c33eaa2db788295d |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/fc9a06bb03c06cc3a13d6d8871af311ccca29694 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/157288e2e65d457d8c1291e8123a35ea465e38bd |     
   x86_64    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/4e64ef8f82acab4571627e0601a827d907347149 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/90c603edab103302e34921e3f15deb06a432608d |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/f1abdfe17bf428123a6852e7881fdb9590454dc3 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/6468cfc5665152ce0c723d6252349ba6c35b4e7c |     
    i686     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/4f8b1c41e113fe587d2f04ccf694eab9d1b94f77 |     
 powerpc64   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/c05c03572270e6734d39cb9e1d9a2a23a6d4210d |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/ad5e01d835feb11060cf209ea2853db9d4d23233 |     
  mips64el   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/ce6a04b1ad33cf0a039839cacd7255541ec54fdc |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/b6491ea6ab065853719cc46525b38cb55b1226a9 |     
   mipsel    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/626721c13262fa8ba065d214d3064122faa13b36 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/f8d601c804c17f213f96e0492d11b982c9f5b5b8 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/7b1fe7efb91781ba98fc6948da6e3400e8b64323 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/1d6e330b890750e5a8269f702b5da22275e8ef4e |     
   mipsel    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/b464d55a2a46ff145f1bbcb3fa20597c66ed8348 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/228bccc08fe527ec5beaef15eb3b17634f315c09 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/8c470516f84de9c9b3b4876525a87ab47ff67033 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0743a5971c2eb59b9551ebb8f5113a0ebf80028c | ORPH
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7e981b91180e07bdffd659fc48c0be5e3afbf35e |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/990876211b4ea06dbc6963e511dbe21c7afbec93 |     
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/d331f9bc285e823387b24b01411557e557148fe1 | ORPH
    arm      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/f4ff310da44d0267735c82d6ff0aad2b339e6955 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4f4deabbe2faf6a8c74f1df05840e0c9627d3357 |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/95f53e8b645cb29944698aa312159034804f6337 |     
   x86_64    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/7ed412e5741a2748db20178c5230ba9a6682c201 |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/b17a37d94533665e49e2141e8e0ea175c4bc584d |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/f845f6f7a7791113b3bc0275d4f5aef3cacc1724 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/76e43c6e0d763e2814dafb2f6b85d79be87fd42d |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/bfeae377996a682e719059a13ec31c4e2bb4aac2 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/af0636de2eead22f42226b4e9957940a7213d9ec |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/fbce433e727e7ffcdc03e9c9c28ab59ffdeaa811 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/5b686880345155cf020cbf05ff87eb5a56550c8f |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/1330603945c418cb92e7112af01e5772e8b50411 |     
    i586     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/ead3cb5f42a4c141a9cc9260840d9d5a78488c94 |     
 aarch64_be  |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/7adf81db64aff5c07ef533cafb87d4dad5394579 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/f29cb94218150a01e1ca38ead969903fce7783f3 |     
    arm      |         libgpiod-1.4.1         | NOK | http://autobuild.buildroot.net/results/d6c3483e6c208a3cb243cd6b59687d4df1aec0be |     
    arm      |         libgpiod-1.4.1         | NOK | http://autobuild.buildroot.net/results/a0e6eac1895c746b82a65534204068bc5017e99e |     
    arm      |         libgpiod-1.4.1         | NOK | http://autobuild.buildroot.net/results/0bf08cd9ed3e77ce4d2e4f7cb0a8aef644ad2317 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/c2321146dac04a42e14469dfe79f4633dbe9c0b6 | ORPH
  mips64el   |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/029ec8f9325a0161e442fb9787a6a868959392af | ORPH
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/45aef0951805f22dc7bf485c8d780925f0124a17 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/742b19fa925024f7bee98b1ea3d3346e529452c6 |     
    arc      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/c73f77e3c4258b9268fc4dbef6678dda27e2fe9a |     
microblazeel |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/a5b973585fc454c52a95589a7d9602d76603cf68 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/92ca8170536b6b2146a8bc2b5949fbb2702ce179 |     
    arc      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/b9714df445fc6c803424b372f477c65acf051880 |     
  nds32le    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/1ae282c0da5fd63cb8bcbb1c86725dd00e18145b |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/c45c1ff206cf14fd98b87e0daae174cda6737255 |     
    arc      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/2b0794c84f07d3bc9e8730cc1fa3e41fb27654b9 |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/927de975d9f3f29523111f4ea0a43644634d12ea |     
  riscv64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/2663447d90fb601a1c68227c0b925f40156e2fe9 |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/885a5f1d4933a643889de5903f0d6e80e327d7fc |     
   x86_64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7d19a27f4d9cc3d9c9f9af4e8db51b461cc1df8d |     
 aarch64_be  |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/ac00675b68c583150b64b80d5baf66e4608d7250 |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/e1ebe4233a23f6dc448c0402a04d5b2045232ed6 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/b4e3df3f40e5858a7971a9be5fef7013598b2a9e |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/050db538e7dfd81883c3615b18b2547e8ebef7bd |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a53cb83eb7dbeda8175bb9fdc054f2b36d81b07e |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/3852e27def8c22264e673eb1c96df8a4225ea4b8 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d0859c36af4c72ad2af1b32a604e75439e7d6b4b |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/bc0478e6321c2670a5bb019bc4cf92f59dfcc4e9 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/3f32e8c49bec8b0dd19a2b4e74b269f90da668b2 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/9110647ba22f793bf5a70f8ec04fb43491b19d98 |     
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/576d4585dc2ec782ad590e2d569a6b222350577e |     
  riscv64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/778dfdc135ecd8f14e7b18aa3ab18990e6c061bf |     
    sh4      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/dcb1095729c2516aa1f7d1487aa38831a5e72ca6 |     
    arc      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/d2778ede09a36e58cd068ac8a952ac859b99fcb6 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/e430a096bc4ae5f52f6e286343d2c74cccb20e98 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/871ced459f2d5dd9fc0e00b38f080e55502a5abf |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/fef662b3f6431bdfa7491218cb9acb74e3687aec |     
    arm      |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/873786196e6b7975234bcb7b010d0dc00b3acbdc |     
    arm      |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/cea4316033f81014e08d2039bd89647a23fa6dd0 |     
    arm      |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/0580ff521a9aaaed3a21b15c1ee28b66f5c2c7c9 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/f87c18b7854342baea137d9b7b9a79aa5a7e4f63 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/922ddd19581e165e8bbfbc0ee4112c1a7592107d | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/dac64419ad3e5cf1f11cfa8d918180be29e8dbd6 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5ae8738cc89ae7e10b19ee22c5b3eb417c0647c8 | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7838598687ddca295db221bcc222875f26615d96 |     
    sh4      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7b459ceeef38eb5319ee31679cee114c7e4e20f3 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4d2e21ebf8015d40ac3dea0df1f41970ce28756e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/dc87a55d74e13f3899228a0ee004f5096eb4b7cb |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/483f704381822a0ee5b7513467518c14ef246f66 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/6f9cb533f99db0c260beaec12664725fa06581d7 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/f05ae5378b0779b4454b8696036a401dac56a12c |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/bbe05af49a1aed4897a50813d4def6f113d9c1a3 |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/c30065e51dae071b0a2c3cd8b44b8fdce80eb556 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/4979f9ccbbd4e415c238bed9abd0bc35bcf9ee48 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/257debe3ac13b71e48994bfa049c8029bb56254f |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/a8df48ce016dc8a49e5bbd37230e26c3a730fa94 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b9abaa80c92e057775530a9cdeb7f70550fcb2d4 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/484c95fb5bdd5095e88aea3503b1db341fdaafdb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2bae2d7fab10c5ba3e7af325438e0fe8b45ddea0 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/530cfefc6d532d2e9b88d0052896e2f72c89b312 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5c9a5cfdd18747a64c3a5a4a77eb30f9dc5d578e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 6 
                       unknown | 2 
                 augeas-1.12.0 | 1 
                    mpv-0.29.1 | 1 
               protobuf-3.11.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d9160f922a518f25d1a22a4f7787fbb33e2d8496 |     
microblazeel |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c244783eb312968665c67e86d6bf1a58bd55f3b5 |     
microblazeel |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/203cb7e1a92ec7b7a1715c4bbba12a473be8ebe1 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/cbf85bd9fd727a5c3c040997f4191774fa4975c9 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/65092d814bf45385a702b4d9085821f795a117d3 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4f08ceca5863d583269547e276928321e19b84dc |     
  riscv32    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/067550d0778a6d1c1cb9d4e82678b06bea8bd431 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ba760e8f1cfd8eec818ab588235327faa2a98b84 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/4ef130c478f3b20fd8b3ef66637d539cb96c42eb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/49510a104e4e6c03d58e5db1cbee73f11e09bd1c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/cbab9d0469af477471f8aad623bae023a6546dbf |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/fe6a0b25364ad66570145227fa198a3f445721c7 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 7 
               apparmor-2.13.4 | 1 
            ghostscript-9.53.0 | 1 
              host-grpc-1.25.0 | 1 
 Makefile:753: target-finalize | 1 
                   mimic-1.1.0 | 1 
               target-finalize | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
                    vlc-3.0.11 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/e60791ae5dd653f8462d8cd34e18b879162741ec |     
 aarch64_be  |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/20aabefd88249b63ecadcc65996d9c5f9520b4f0 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e3c32f5031696ab217528200e5b2ca1804358e17 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c0ee26193ed86cba48d5d473480197895ceeb95c |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c94d0689a300d37bc30e7bdf17947af6d9bc4de4 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/bcac707beb191671b8dc524e610d4caafddf7dcb |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ca4e69fc6545e0d4c95b4cd11f598e85bc230038 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/117df945aeb14b5032b43aaab3722e71b933bfd4 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/5c4649b6142741e7894dd51c2962a5320a24682b |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/97abfca942727846f82b05a9b12c2651451b2bc1 |     
   mipsel    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/f36918346dfccb30c03241698ec9c2b074b39f5f |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7568a2b3fd8dbfc3dc5d476589448ea3a745505e |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/28421fd3d8299a021e320a0cfff815b777a02652 |     
  mips64el   |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/2056ed43492d04bc2960c4bb894ffa956a059636 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/461da8e30b9cc9d4b65fd0321c886e4c2bfea448 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/706b398d4c21464a4af82c2c0b6e0fc881f3aafb |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
                  luajit-2.1.2 | 2 
            ghostscript-9.53.0 | 1 
               host-go-1.13.15 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/d3245d5fcfd9b308db6d40b2ac684323b168581a |     
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/a9371328c17a2fd6039c460b86e3dea7f9dab068 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/0407624005e00a3ba31e5f42f4d26a1b0ce4538a |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/63e0512fc218fad93342229685c7f8d76db5315e |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4b80e9596dc6f5421c31dfee1767ac15c8120883 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/6cc76d92be513ca75d816cb63803d1f6e5c92604 |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/81e9c7059f22e0186444ce9f6402e441aaca0603 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/b53b8dddf8b41d7756113f1bf4bc8964a7bcaa62 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8c7ea132a9e46967213a307284b7c6c93990a7de |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/cf3254827386cafcafcbb48dae4682184ce82610 |     


Gitlab CI results for 2020-09-18
================================


-- 
http://autobuild.buildroot.net
