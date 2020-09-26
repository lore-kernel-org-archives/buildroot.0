From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 07:10:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-25
Message-ID: <20200926071055.630358756E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 34  | 11  |  0  | 45  |
  2020.05.x  | 30  |  6  |  0  | 36  |
  2020.08.x  | 36  |  9  |  0  | 45  |
    master   | 161 | 117 |  0  | 278 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 15
              asterisk-16.13.0 | 9 
             kismet-2016-07-R1 | 5 
                 ser2net-4.2.2 | 5 
          gst1-devtools-1.18.0 | 4 
                  ndisc6-1.0.4 | 4 
               apcupsd-3.14.14 | 3 
                  boost-1.74.0 | 3 
                   libcap-2.43 | 3 
 Makefile:753: target-finalize | 3 
                   ncurses-6.1 | 3 
                       unknown | 3 
                   attr-2.4.48 | 2 
              cryptsetup-2.3.3 | 2 
                 fwts-19.09.00 | 2 
                   guile-3.0.4 | 2 
              host-guile-3.0.4 | 2 
         libcpprestsdk-2.10.16 | 2 
               libupnpp-0.19.4 | 2 
                  luajit-2.1.2 | 2 
                openntpd-6.2p3 | 2 
                  pango-1.46.1 | 2 
                rocksdb-6.10.1 | 2 
               target-finalize | 2 
                 uclibc-1.0.35 | 2 
               acpica-20200717 | 1 
             babeltrace2-2.0.3 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
               freetype-2.10.2 | 1 
   gdb-arc-2020.03-release-gdb | 1 
       gst1-plugins-bad-1.18.0 | 1 
                harfbuzz-2.7.2 | 1 
                host-gdb-8.3.1 | 1 
                    libjpeg-9d | 1 
                   libnl-3.5.0 | 1 
            live555-2020.08.19 | 1 
                log4cxx-0.11.0 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
             netsniff-ng-0.6.7 | 1 
   openvmtools-10.3.5-10430147 | 1 
        python-m2crypto-0.36.0 | 1 
                qt5base-5.15.1 | 1 
            qt5location-5.15.1 | 1 
               read-edid-3.0.2 | 1 
                samba4-4.11.13 | 1 
sconeserver-6b932d7d8dbb700... | 1 
socketcand-69e2201222f015a1... | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 
               util-linux-2.36 | 1 
                    vlc-3.0.11 | 1 
                    wampcc-1.6 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/65c78f1b8beece6c1edace9280d8f5ab3aea36b8 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bd7e32e6602dc8baaaf7bda050a909777a6c6515 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/55be997fbb6c6451fcbd78522c1fb6c4099bc3c1 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e0e5568c35bbccf42a21fb20277ed0d1f8d19675 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/dcec91dfc50709e12c2c4e1bfa472f7aa76a41ac |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9298734fbc188c1d522951e844e449ebadd03ba0 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/779e1773090520a7971424f5b786000d1d44d7b3 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/185e56b06fe8afa4306e7a42f5a60417b68671e1 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c6f5ab4b1b2d9874f5fbd6274d4745419c28a95e |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/50b57eae9dd5c383f28f4d79f792959970564319 |     
   x86_64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ac6390b340774c4ac99bff7f3e19920212c4bcab |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f0ba7d293b40b46034d68c618de95bd37b087c12 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5f9b64e979821d2cce2e331b482b467ab9ddfa8b |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/d0002cf4393c6ca3ea932589a2d322bdeaaf2575 |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/fa185fbcf92fe621ff1f63b128c9671afeb824f9 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/8db6ca580174301e02dba545e1642671650f7dd6 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e4088b912b91b56f2b96040922de2e2ececec764 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4d484b6c3a38d9e5e5b0020d575f5be779bf3d5e |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9b81178f28667421793ee49a42f97c0edd5ae9c3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c847c684b65db2a3c16ccce4fe459511f531b63c |     
 powerpc64   |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/7a09c6d7c34ec5d6d472108b8fea138a3b3c8179 |     
  aarch64    |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/3121ce49bcec4477ddab6313c3c39f0d6eb67879 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4a46458ec468143aa4835efd668a83e323728da1 | ORPH
    arm      |        freetype-2.10.2         | NOK | http://autobuild.buildroot.net/results/f0051890c9047bb0e1233575133d74af2e4891af |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/70fd4fc9ec9c4ce183b47920c27334a5e8b3ced8 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/e9f95319b94cc65d396cf0a4904b3288cfbe810a |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/88ed383a1b5ac315569bb41633dc03e20cf40a56 | ORPH
  powerpc    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/1ed539adecea81bd321f5f0f29ef11bcaf6242bb |     
    arm      |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/c681f71301f6757c8c60e13deeb3dac5e59ff867 |     
  powerpc    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/297ebea95b487f4c542e1217620e8c3d921260f3 |     
   x86_64    |      gst1-devtools-1.18.0      | NOK | http://autobuild.buildroot.net/results/49f4cfe44f6a3494d736f35d4609e36b0f61ee97 |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/183e876d63340b5c204f47a4653cbfebb0523277 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/1228266ddbaeb07421f160026af4d159e5bb6cc2 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c265d104c9b9366d572e78e8a44c81264594a3d6 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/829eab2b93c111b7cd177e77dd0bfa4ab45539ec | ORPH
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/2abd81735ebd5535df6862df5e2ebcbe880009ee | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/d56a3514d947e0b5794e21ead3f967cebbecb873 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/fc1d7f422132fc58dea384f23e207df1b0138027 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f3b631957b747c1784e35f2857afb6f03948da4c |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/648da0b0b7d4b358e975147748a28ce32fd0b4a5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eddd0acc30d396996ab7027a01c51d2540f388d8 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/35948f3f80477db8c391dbfe2286589af741cd66 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e53d01f44ea5c7eb89c7fbb4d351137de956997f |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4679cd5f848a2506d9acd5d1a47774740c4c48a8 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c515c44aa1160aa3825b99d3e9b1d6c01cc83aa7 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/08c9b89705351769cdec64f63cd80b27804528a5 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/85d5a960cccafed78e82b05e20c6c04dfc1af524 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/063297a35cfc3ee50da14e910cb9a87b9c76dcb1 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5c12111efb6ce356a924eff694af350d2d2127b |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f7edb5138ef3738599b4a2709cc2396ebd792858 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/de3e14dbaf78d66f0261b5e9350d879201f08df3 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61fbfe5bb6186698a4b7ed1e6e7d29859d7e4e4d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0b1966fb975bb113d494e7bb8f20b8422d0f7b49 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b3d95532c4fb59e8dd9107d710fa2b32ae416b95 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/9c7e0f18e27ee882e1756d30cac277ecbea9e617 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4e341c14a474c28ec36981c97cdec9b89680e61d | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/63519343128c2b6b8ebbbc6b93641967a51d9847 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/581ecbbf875326395e0349f60befdb02a272747c | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/07d9628dcb79db67cd1e8a445999663c7b0e1b88 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f5ea0f3c5bd676aeb14b018e5bf7cb7cf5321c34 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/e7ffd7ed4beb33d0e01e91f822ee25a2bc5bb8bd |     
   xtensa    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/aa25b04578e91d18197773bafa7c7ffe37bee422 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/265ae57df32b05c24624f48eb19f38dc5d044ead |     
    arm      |           libjpeg-9d           | NOK | http://autobuild.buildroot.net/results/2ff3bc3a22de42515703e212725c71e7c8fb1474 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/a41e68a7c5a84583e812a225a386576e606b1430 | ORPH
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/e2811f4e24652a7e1736f30e14faf5622e4c37fb |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/ecfe163e6140727fd32bb35b8fc434b3ccbc806a |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/cdee75a3e759def7a0186e8f791f030001410f2a | ORPH
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/7af6c8fda1cc1b86ef0afc50d2c2c3238a45f8cf |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/62138e5af1f570cae65e60a850c3be0fcc456e5e |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/ccc50abd022f82d83f115889d6439698e377fdc2 |     
   mipsel    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/52a0eacbd7698f37172016583f00af3addebc9da |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/dc408e45676a0abc27504c47b66dfdbd3089d3fe |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/7cd2c2164842c85228f1efdaa4a9b548d80375c6 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9dba7b11afc18ceeebbd24b55d96254a2d5bfc75 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/d7955d1e9b94dfc2a6721166d495f0c2246ea717 |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/e425c49e130ee94239cb9ffc778edd4cc4fe3f2d | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/8ca1bb274c7f71d152f418bb9b9aa370d108cad4 | ORPH
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/ee55ce65a51e11a5ba0ee261553e5e2f41496479 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c17df9d19102f14afacedf43f29b8220e2aae41a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f356d03bd3219509dd50dc4d1468e5529eb2d4c4 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f707a3ad7f122c9d9f335b37d0f78ff3f8a0508a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1599e805e70d08c6a137b2e2d8f3b1d0c3f53289 | ORPH
    arm      |       netsniff-ng-0.6.7        | NOK | http://autobuild.buildroot.net/results/811b9eada9558bafde4e4ed824b36239c72e0501 |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/94f64fe5dde5d2506e423c513403180a28ebde83 | ORPH
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/4a7e6b707d061f5f7f5e00f0054f02a0f7fcb452 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/82f9130661780fd8b3b64b7706a82db1caecf0c5 |     
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/825b982cdcb6abb884b331efe153d55dcebb8be8 | ORPH
    arm      |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/a0f1d50a81de2797e4a5e81c36faac2c51909327 | ORPH
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/bcf2ab5f61edd506006e527dc771e7019b2be536 |     
   nios2     |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/40e9a8f4f74a5f8ba235c75ef19e9b34f967403e |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/432b3168090d7601e479b9af5c1c09859697ed05 |     
    arm      |        read-edid-3.0.2         | NOK | http://autobuild.buildroot.net/results/28bde8049b6610273bceae26eca407c819a37dcd | ORPH
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/931999c33b3f02917d1e1dc5279f7f6ffd4e21c0 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c484399d3c3b25bcf4b9cdce4351b1dfc672cfcb |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/fddaf11c5b480b9ec2e54977356a63a7be0a697f |     
  powerpc    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/7445625cbc67227315229fff6b1fd4e5ec693dc1 |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/92d8878c3216e016269254657a53e7b04dd9f5de |     
  riscv64    |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/f4b750577cdc6d3b9844167056b92b7f7c73db12 |     
  riscv64    |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/57cd1e4b9f7875057dae1a76d3dd12e580a653fa |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/01e6719f1238145d073d9909e532068f2cfb41db |     
  riscv64    |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/6f9e48b549a3923720b5e9c7236ca4f936ac5b38 |     
    arm      | socketcand-69e2201222f015a1... | NOK | http://autobuild.buildroot.net/results/a72f3e34c161a012e8091db331d02bbf2da6ad94 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/f61a3fcf8751cd997f20804f205bb96dc09f323a |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c4ebb855bf1e994af6a9b4b52df7aceff41c7120 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9ee5f157c2a1f7471eb7617c17930395d66695fb |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/cf5e15ad5faab8cb5f90b34b5f5151669b74ec7b |     
microblazeel |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/caf8403f001944b58cfbf5698232e4f90ebf2478 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d1ede1b9e3d0bc212000a50aed1ce1e421b57aa4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8b5e59ec80b480e2be7dc418b72aa41bc4369229 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/ea4f72c6fe6286ad15e5aa5dacf7b366c52ebed5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b7af0dc198c97b91fdb9e5024e2bdf366236ebee |     
    arm      |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/87ae32fad8a08989c955c35a11d56bceae9a6014 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/1cefc953af3e3f85d4f8fa4d47ea91ad5bb71fda |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/02b1d58ed1e9f3159b85fb8f5e6c65dcab4232e6 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/731323e1481b62f16df2c6c4d0152b5b3ab7f5e8 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/cae32a7ede5551ffd48e44e5bd0f61c565402bf9 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.14 | 1 
 Makefile:753: target-finalize | 1 
                    mpv-0.29.1 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/17e0d34ddfdc0283730425898aa58d391e776fe8 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/15aff2137f5acca51f3045873d1a5603f1fee3a5 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/81bbd756046234c94b3d958431091af5ceb52bd2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3ea56813f7e67fab32cc1f2d150fda2e4ba28648 | ORPH
    arm      |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/ffc664a7bc55d12b54835515feca832fbf33e2b1 |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/a46a422beef04fbc7f4b63ad71447c759fcaf129 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/73afccf441d01dfbb0562f43e6b58e7cda3d05b1 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/1d20dd87ee2da18a97d8e6479fc50496aa9dd1b9 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/7c05b0ee3c60309566448d7730cab7bfa03c34c2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/33d4d2d720766dd09dc799241d80fb9e4be50150 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/b3dc2ccd90030565e8a675393b709b4f14e7f227 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

            ghostscript-9.53.0 | 2 
              luabitop-1.0.2-1 | 1 
 Makefile:753: target-finalize | 1 
                minidlna-1.2.1 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/33c31b98fe25d616319f40bdec0c30103fff8e58 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/1badbe3a72f4ee39acc1256dc34424b068b692b8 |     
   x86_64    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/9d3429e4840e676a8c7df727feed99aaf9d4e6af |     
   xtensa    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/5a1b1868c3f5802f107a87f11ff507afdc8d93b1 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/bcf9843b4b133a093f234f7cfcd6a584dc4ea35a |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/cf977ad0d22656fc2c55aa8871eaf677c33c451a |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               apparmor-2.13.4 | 2 
 Makefile:752: target-finalize | 2 
                      gd-2.2.5 | 1 
              host-grpc-1.30.2 | 1 
                qt5base-5.15.0 | 1 
                samba4-4.11.10 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/06f8018345d8528abb28138ffdc2c0b8262f873c |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/3927e2d0c8820c4f469f8ae9c192f1e650f1ebeb |     
    arm      |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/dd0283586a31d1eb0a4b5186e23cfc5d19813bdb | ORPH
  mips64el   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b377ec683401f116bd76838fe72af44bc6f7d94b |     
  riscv32    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/f1dd78cedce83f313be52b93d21052bc7271a508 |     
    sh4      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/9479c1336b89f4aa8b3fe35ba6fdfc9c264230fc |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/46e1e2ff6744d45e15ac784a5368bea504d28693 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/a0c6ab6d3b856db6fb105e824c082cb3bf8efc09 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a941b2da790c88010022f165fdc2bd49cf4db0fb |     


Gitlab CI results for 2020-09-25
================================


-- 
http://autobuild.buildroot.net
