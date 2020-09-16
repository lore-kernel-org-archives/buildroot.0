From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 07:09:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-15
Message-ID: <20200916070958.9330B86E2E@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  9  |  0  | 28  |
  2020.05.x  | 24  | 13  |  0  | 37  |
  2020.08.x  | 26  |  9  |  0  | 35  |
    master   | 81  | 122 |  0  | 203 |

Classification of failures by reason for master
-----------------------------------------------

               ipmitool-1.8.18 | 21
              asterisk-16.10.0 | 6 
                       iwd-1.9 | 6 
                libpfm4-4.11.0 | 6 
                 gnuplot-5.4.0 | 5 
                       unknown | 5 
            ghostscript-9.53.0 | 4 
        micropython-legal-info | 4 
                  dhcpdump-1.8 | 3 
                   guile-3.0.4 | 3 
              host-grpc-1.31.0 | 3 
package/micropython/micropy... | 3 
                 uclibc-1.0.35 | 3 
              alsa-lib-1.2.3.2 | 2 
               apcupsd-3.14.14 | 2 
             babeltrace2-2.0.3 | 2 
                  boost-1.74.0 | 2 
               capnproto-0.8.0 | 2 
                   libcap-2.42 | 2 
                   libnl-3.5.0 | 2 
 Makefile:752: target-finalize | 2 
                rocksdb-6.10.1 | 2 
               target-finalize | 2 
           wayland-utils-1.0.0 | 2 
                  weston-9.0.0 | 2 
                   attr-2.4.48 | 1 
                coreutils-8.32 | 1 
              cryptsetup-2.3.3 | 1 
                   dav1d-0.7.1 | 1 
            ecryptfs-utils-111 | 1 
                   evemu-2.7.0 | 1 
                 fwts-19.09.00 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.7.2 | 1 
               host-efl-1.24.3 | 1 
              host-guile-3.0.4 | 1 
host-meson-tools-0a02e2d344... | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
                libgpiod-1.4.1 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
            makedumpfile-1.6.7 | 1 
                   ncurses-6.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
              udpcast-20200328 | 1 
                  uhd-3.15.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/2c7b03b7c05a6ff9404b7294c4f8843304f1c45a |     
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/8c175cd0ae95a684fec34f92961ff6a4f7e68f47 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/915b7e745c6cbef8df568680a8f0c0a601c509bd |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/59090bfa8b626ba119b4558034c87ea1120dd55d |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/11d4a6f3f8692290965e3221b949ef2cb4ad0d08 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/376f597012092cdc1c97fb8af5c189405941f9f9 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9f2f365f0b13a9ad76a76d15b9c5272533b64b23 |     
 powerpc64   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/bf6a6cc71931798ee3d2637bf52c1b136a559700 |     
    mips     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/2598b2b825b4593e23882104f053333c4337dd69 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/971c930e129ee04098ad456e55bc738730067256 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/eccb7bdc5d05d9980705e732fceaf989520cacd3 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/32ef2db757d85e1703767378803e25abcce3b9ba |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/ae83d458cc7d4d16fb3bb9335aa08d3cb6ea8a4f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/1b310b720b8ea50c6733267416b663de98e7ed97 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/14657902463cd2c323f4fd7d30fef275118d0758 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bb0d5d593d66825569da6c9f0e5bc4631fac1ef6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5ce74f0d7dc2c57bb444c53e701928c472c1f8fd |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/484004836fdfc16da0bf3ed5f78f14935036eb72 | ORPH
    arm      |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/255bd902aa2600bf1623975e7b2f32671b6ebebd |     
    i586     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/59258b6b4759abf50e90a7e833cba0564324b586 |     
  powerpc    |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/9aff723bb17a76b990b2463630cfbd16c1811e20 | ORPH
  powerpc    |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/87fbf02580c83edade5eeaba46896c175120fbda | ORPH
    arm      |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/9e532ffeb3c9c3f82fdea41f5dddb3d4b7326a89 | ORPH
  mips64el   |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/579001824689c83686f527b70ac03a5a2cb123c3 |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e610783fe35a672811d492fe9ab84c8623d4e96f |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/e54a4a63b5a3529ae4e00137a6afe63b8dacbdfa |     
    i586     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/8d025dacb03b1cbd568400553519a3ed9c519168 |     
   x86_64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/521ea8b3bced070a5accdb04d1ce672228a0eb30 |     
  mips64el   |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/7637da59fd715654e5afdb51114ef72da70e4095 |     
  powerpc    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/fbcc2fa29f3736f78212cb4b3869ffaeefda7a33 |     
    sh4      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/308031bd09a906d0d279f0e0f576625cf8897908 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/b12b00edba5608d15bc0f4cdcdf49496c182d04d |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/5716d63af9acfb4a7c5fe194c46d3a483bffab23 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/7776d957bbe897c318626290b640efba0b304dad |     
    i586     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/e4256dc3822eb91a8f07366cb5249b301191eab9 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/f7c58540ba3947759f7a4a4397f363569f33ea87 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e37997d9789b67eb2e1e38ff0a66b75b3694b40d |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3c12f6884cbd8da5d199aa523f02c2823e308abb | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a25d23768239c1a22455711450810d90338dcf30 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5d39ac2e4b4e4015df0a9805bf634efb86506c7e | ORPH
   mipsel    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2cf1f5f8008f9fd41c63a7a8205ff320a95efc12 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/ae47e798901db6faec6253419604d5d2abf11696 | ORPH
  aarch64    |        host-efl-1.24.3         | NOK | http://autobuild.buildroot.net/results/f627d44919c20e068e377d7fe113833e2d4d0ad3 |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/81e1425454312933bf443548bfae64082a32d1d0 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/6ee1111f0c8253e5f76519243c06d89cd2892ec9 |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b70a8605e4e3c2d2e3e5b2e417d8e5083cb82e80 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/4f52eace43a32adabff7fa503ce37fddd2a03151 | ORPH
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/0334b971956be87ce087ceb25c2f261e03201dbd |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f1ec2cf792bcf5188472dc2da0efbb5086cb74aa |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/1861551578fc114643050cc94f0bdddf4cc78a40 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3602a68ce4cb4ef974e7ef89052f6805b9d282d5 |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/7ce165af30b08ee6d2b75a40470caaf38f23a02d |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c37a8607eeda6a8423a13660d54387e71ae5025c |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b0042c17caeb1c212fb263b866df47bd757d3e3f |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3f7fe8ad181318153c459ba5e1afbbc8b49d541c |     
 powerpc64   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/430170b098984fa08114bce744151eb5c61d4d73 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3f8fabe33be51c42c139b233e76941897ca5a91d |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4af198fa6e05b43439af035bd43c641e9e4fe9c0 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ee86df7da1890b6318d5c1be15ddeef048f7e91e |     
 powerpc64   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/fddc42913384f6a75fcc81344831063b307fd074 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/db88d56ebebf341f2f57fad315ca7a834fce7760 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/bdffed271ab33e14d9be79c37058c8a386a36195 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/2520edcb682696e8a11d67de0a9b01f0e11e8804 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e55962b5315cf97a4fda4ecbfffa7582d33d9e32 |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/5187f3e8db3ad13ed53f653c337929afb1a64757 |     
    sh4      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/9a461b967232e106cae77ee6e21175608e307f65 |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/698b2dd8f12f5106269162b2eb9de548f008a2d5 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/cd2a4247e1d32b5dda711775b9870ad09e259f07 |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d0d007a286b8a4f9f71c9f6ff8f9665caa805f36 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/3740468e2ba26f0b8843fdc77c27bd814cca9756 |     
    arc      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/261d406497d33906f4acbc9ee5d154366481a366 |     
  powerpc    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/a107a8083e4d03208cbce0ff3379b39027baa119 |     
  mips64el   |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/e525a315e9430d39b99728d77bea16bc273a5294 |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/82c8a177de9b54fcde357c21edd22c105cc85004 |     
    sh4      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/b3fdf91c60028032f20ca8bf24a5f472420327e2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d7ecf0b1fc592e184d6c8e006de5c14d1ab5772a | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/6bfd0f1c7e384cf8d968aa0e3751c39b7f9a7bfc |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/b221998cb406500d2a17b52287787ec5ac271f10 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9f887936560e4de223836e24a6f1110018192808 |     
    arm      |         libgpiod-1.4.1         | NOK | http://autobuild.buildroot.net/results/36c6acdb698529ae9939d78b51739cbf82dfb2c3 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/b10421b24af4457648441e4b3b9817a2e9eeba04 | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/703dc9066f7ceced403cd1763c13464db1861f58 | ORPH
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/49df690443271319544fcea090e374a04b4555d2 |     
  powerpc    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/4e4e84c6079fa21fdf498a7750ef39ede43afc0a |     
    arc      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/41539a55aee0609a89424c1e69e353e0f65c1734 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/ca956b34e990f6d2a514ca7df9bf9a0d9791b4a3 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/4c16e92c3527b108456dee74beb31bf4f26ef5e2 |     
microblazeel |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/6492e2d5f6afb232e124174b9677ecc57faa2bfe |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/6ed7511234916df1737ffbd2a7f89b3cbcdea29f | ORPH
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/2d3bcae27003c18fcfc68f1b3b960a31bd39069d |     
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/16f64f029fc788398dcce8896f5d1a2d4f905187 |     
    sh4      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/50c50e5c4e15eef57321272969e57bd43c4b61f9 |     
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/a8e43327e27432d6223c880093ceae9a1058f760 |     
  powerpc    |     micropython-legal-info     | NOK | http://autobuild.buildroot.net/results/f3a1cdbb1afc2ebc4b3f4cf5e6cda5f1fd2df940 |     
    sh4      |     micropython-legal-info     | NOK | http://autobuild.buildroot.net/results/8b11bbb988c1d0598e2d8e223cfe7990dc309f8b |     
   nios2     |     micropython-legal-info     | NOK | http://autobuild.buildroot.net/results/2a650636965d8575374333f847acc169caf8d2ac |     
  mips64el   |     micropython-legal-info     | NOK | http://autobuild.buildroot.net/results/ced7b32c0c2d4c8b017037977a0ec3fcef50c858 |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/d889c817447e76d1edf5c6e81d3ffaced784a935 | ORPH
  mips64el   | package/micropython/micropy... | NOK | http://autobuild.buildroot.net/results/9617772c08bb1386bfd94aba5f88d5874732de11 |     
    arm      | package/micropython/micropy... | NOK | http://autobuild.buildroot.net/results/65396ee08eb2f97863e7032072961cf735b8a38f |     
   mipsel    | package/micropython/micropy... | NOK | http://autobuild.buildroot.net/results/6138f14531494acfaf256d8728130e34819dc94b |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/432427cb719e7e4bbdce6528ee5be0fd8db1141f |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/6d4072e8dbdb509dd038a24a6b029b8ba88809b7 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/d5aa3627d680574fb8dc9dfc29ad42d53fcf8634 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/dde64caaa6d1d40f3ad25086a9a17c9368a84b6f |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/7e514b9c8b68c9f51577209dbd10e68730b39d81 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/00cd7d6f02ad15b2627d903cfbc312960570a3da |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/c4bea1397bfec068eb57d0716ad47487e3823072 |     
    arm      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/6bb5eb31abbcf7a0a952ef2f198ff876cb321323 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/34aed1633b76054a5818ac22adf9bcb3bc9a8c1d |     
  riscv64    |        udpcast-20200328        | NOK | http://autobuild.buildroot.net/results/ba72bdc960a4d654e1f7a0cc82c6b1756610aebe | ORPH
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/623ed3c1d6a28460a15c88caa634faf9d5062b49 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7ba591b2912a1f5bd100a3dcf4fd7f36e4a0d602 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dac8accba82f5cb174df8f9f3e440f2bef0db2f3 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7de865d94e68a1a55883fa89bc0a3bfedc16a18f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d62e77872a93e7a95329f704cc9cc9239d8621bd |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c276e25d66414aa2615fd55333addd4f353db2f3 |     
    arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/25c69fd16d39b4e0a5eb54646ee06f77a70ef75f |     
  riscv64    |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/a1d34c5b80ee81f4e537e0561fc8ea84fe2454e6 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/2c395d32761769bb9e21c77a89ed824187aea3c2 |     
  riscv64    |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/00b9e1ccb97d9ff5c2ee0e856288f689bdab52ee |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/83fd8cc5a19d544cd19ebe74f7230a6003ad8c7b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 1 
                 gerbera-1.3.4 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
              host-grpc-1.25.0 | 1 
               ipmitool-1.8.18 | 1 
lrzip-7f3bf46203bf45ea115d8... | 1 
        qt5imageformats-5.12.8 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4298d328dc71503271e45d4508c8e3a3fbceef13 |     
  aarch64    |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/f755bddd4e6c1ff6a7f13ff75a65e9e4a5d792df |     
    mips     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/c3753f093c4780a0da80d12c9b54176d9b7c4415 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27a61268ce4274f311418276f87bd7ffc847f201 |     
   sparc     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/684cf684c2727dea70c54c4808ac258cc65fbe18 |     
    sh4      | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/4e5a8d89d3646f4fe441c8a43bf6eb1853ab6283 |     
   mipsel    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/5d7c9bbd9e8ed1d5303477412b0a9f832ada1ac5 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/dfacfc8f09d0d8044e40fdb8a8db5bc5be8c5990 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f86b56d13863fad1da091e39e870699c224e2962 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               libupnpp-0.17.2 | 2 
              luabitop-1.0.2-1 | 2 
         uvw-2.5.0_libuv-v1.37 | 2 
            ecryptfs-utils-111 | 1 
              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
                qt5base-5.14.2 | 1 
        qt5imageformats-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/7a3a182aa91a07a720a02f854c59f952930708e1 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ff5f49f392460e594c03bf0a399b04516bcf3950 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/49a99e630a2e013a518c6b12411b82fa9206a853 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2c21c98fb538c27f58aa44e94807ae5b1fd6fbd0 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f1cd17223affb11fd14d6fce26ecba30756727aa |     
powerpc64le  |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/ed5ba58a74a2c286ec4b7c59eb4c7042c02bb496 |     
powerpc64le  |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/e78d933d38cd965d5a6f254e0615ab31cfce08d7 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/1b128bc2f9bd058559d44c5e8ca3c4d4562e6690 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/935a73d38b3e0e103f610f84c84cb807e3d98e87 |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/fe372e353533bbe3e80752672b94d1e0cc44ed82 |     
    arm      |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/00d6b253aaa9bf698c2ba6d2d91a44afcf685cb8 |     
    sh4      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/8f97643b42846285202ab1e7043c2b4c6ecefcf3 |     
  riscv64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/3ca0708e1fcf373377db4c355d5e5e11c0566cf0 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  dhcpdump-1.8 | 1 
                  ffmpeg-4.3.1 | 1 
libcamera-96fab38e02792a109... | 1 
         libcpprestsdk-2.10.16 | 1 
            live555-2020.06.25 | 1 
                 openal-1.20.1 | 1 
                openblas-0.3.9 | 1 
                  pango-1.44.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/a2d36faef7c4fe0d69d3dbd4cb3c54ecef13f658 | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/952159d6ae05686afa06efd0bcc51ac27df876f4 |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/d7b4fde55daae2fc643e44d94621c177a969da9c |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/422f645cdaaff469d1d1f7c3cda205183bb2c727 |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d568e5ba2e3697c0c8231779c00bad139c719635 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/80a229f361ded951bd3ab277688177018a0a3667 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/e50f1c070c38e52b068bef46fff7500e15b5247f | ORPH
    or1k     |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/de560607694f217e8d2ab888b7342c184f92042f | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ce6dfc150de07162b27d1e8ef5c06bd98fa7ece8 |     



-- 
http://autobuild.buildroot.net
