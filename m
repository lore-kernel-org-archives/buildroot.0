From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 07:11:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-16
Message-ID: <20200917071152.E08728767B@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  7  |  0  | 26  |
  2020.05.x  | 18  |  9  |  0  | 27  |
  2020.08.x  | 27  |  6  |  0  | 33  |
    master   | 110 | 95  |  0  | 205 |

Classification of failures by reason for master
-----------------------------------------------

               ipmitool-1.8.18 | 12
              asterisk-16.10.0 | 8 
                libpfm4-4.11.0 | 8 
            ghostscript-9.53.0 | 7 
                       iwd-1.9 | 5 
             babeltrace2-2.0.3 | 3 
                 gnuplot-5.4.0 | 3 
         libcpprestsdk-2.10.16 | 3 
 Makefile:752: target-finalize | 3 
                  boost-1.74.0 | 2 
                   dav1d-0.7.1 | 2 
                 fwts-19.09.00 | 2 
                harfbuzz-2.7.2 | 2 
              host-grpc-1.31.0 | 2 
              host-guile-3.0.4 | 2 
                  luajit-2.1.2 | 2 
               target-finalize | 2 
                       unknown | 2 
           wayland-utils-1.0.0 | 2 
                  zeromq-4.3.3 | 2 
               acpica-20200528 | 1 
               apcupsd-3.14.14 | 1 
               audiofile-0.3.6 | 1 
               belle-sip-4.3.1 | 1 
                host-go-1.15.2 | 1 
host-meson-tools-0a02e2d344... | 1 
                   httping-2.5 | 1 
                   libcap-2.42 | 1 
                libcurl-7.72.0 | 1 
                   libnl-3.5.0 | 1 
                libtirpc-1.2.6 | 1 
                libxml2-2.9.10 | 1 
            live555-2020.06.25 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.1.7 | 1 
                  ndisc6-1.0.4 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                qt5base-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        acpica-20200528         | NOK | http://autobuild.buildroot.net/results/15f0ddfc0d2abba335265123fc07a96897019639 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9092fafc7cf75ce13d53c7e8fddbcb62eb890529 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/a06d4dd889cec5a858f3425385b0402a94aa4a69 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/487daca54242624880ce2fcb7e40e71e36d647b3 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/d8577cbb44d224f3ef06cad57b5b8f952afa194d |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/c8995d9159440437b54d55e5caeb02c5909b3381 |     
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5976e157c2b9f65b1eb83407ae591b3a411c88fc |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/ad9d0805bed373c6a8adbf60ad5110e359c3d1e5 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/1bb142c3d7e2be0227d5c66264735b19ff7e66a8 |     
   xtensa    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/dda13373a45b165fb29b2b8fc5fec56ce01b90f4 |     
    arm      |        audiofile-0.3.6         | NOK | http://autobuild.buildroot.net/results/25d61ced60bb7f623b2ae10bf585e43fe61d34cc | ORPH
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/fa5d5cfb7615911a862733c18196a5a3374e3c67 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/132d953f83daada7aef5eafdc34eac4b527f2e8c |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/0c6ccaeaaf231ce27c0f272fa6ba2f1d9a900f35 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/772129c8f47482e020b55701e9de1cfe0423d0c5 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/8f57b3b42b98f4f1865aa9c07903fe25b263dc11 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d10fb71b524c3e75202d3ecbf4dd10152e635831 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/72e4089dafacd245e781214b72baeb81a1e3d3d7 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/396d4dc248070f9fc2f30dbc87fd04e4b548ba4f |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/1f8e987b871da7b73da87d219f83935f8df9a8ac |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/8bfc8cccb149fe5fe7d03085accb78ac58b1fe40 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/d0e6f423aa626dfa66f3b12cc8712f7dc68231b0 |     
   mipsel    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/880461974fe66d2b8a5532f8797045d032f97b00 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/673be2950e8cdf1cec4c86cf474b97400573d740 |     
    arm      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/c73fcd51169a67607034467bc1381054a7703adf |     
    sh4      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/0011b2380e1198b671dc62aa21c06d48a0b23a19 |     
  riscv64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/ff76d750250003f6996becbe3aa54ebf251ad406 |     
  riscv64    |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/5e870ec5b543c5e7e90974450b3db265d3190d3e |     
    arc      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/c0b830b3fb86b0717999c22d4bb0dc57e0254c34 |     
microblazeel |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/e6c115a1a82f803c492ef3aca07c77c290801c84 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/ac10c3aa163262f021841105a161a12181238f66 |     
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/68f1afcb01bb8a30f779cc1a163e5713c13853e9 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/3648eebc23ace1e234f134975682544d7959a2b4 | ORPH
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/d74e75cdcb7916541ac29e70d51c65a40bc0049d |     
    i586     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/4682259a38a415eda6533dae809ad6c325569482 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7e70f9acb9ea2da56d4a0e1b1d83c5b124e51ae4 |     
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/2169fc504edf96d97267e122a8100bad1ba6c5e2 | ORPH
   mipsel    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/8e8b27b7dd48695b7f1899f531b798eecdc4dba2 | ORPH
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/4608fd34f88fd35b7df7641ce983a8db577fce31 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b56cd35bd6f4d6c8a29af5bee1c9dd0855528769 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/8d55daa65f247a0a44af146703a1babadd99a79e |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4566c9acbb2a1513077efbe2eb947dba77597972 |     
  aarch64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/8c33fb79fa0cc26e2d32924607acf78a3f039c3d |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/cdff463802ce87c039a10033677b83596ae159e4 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/20fc547c911ff488fb0b282d1dd32832ce1d0598 |     
    sh4      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f3d8c435d27569eca87114ef05dd0ed797972812 |     
microblazeel |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/1f803bf8d95b715f8fa181c731b6f3ff8570c021 |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/14096e20a06d2749e519e26823750b010046037c |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/9375572cff52961e9eed6d3670703b5cbddf27e4 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/2a4c9cfc7daa899df0d1e58c4d9e3471e7e02e76 |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4cef0e6c95f6106f4d430689fd91fa7b819a2603 |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/135d348c6117cb40b5170f9ec3e2a34c74ff34e2 |     
   x86_64    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/7d2f73eb050a90b961b95ee59bd4da7ca55ede26 |     
  mips64el   |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/08327b0a8778cfb45febbba83578e3335f777daa |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/73bfe7c775d1870436ce95e7e9802b3cd70ba243 |     
    arc      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/72ebbe772cf6dd82ffc1011bcf817efb753b329a |     
    arc      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/bd7fe7959aa79c1abb88ba4e93f82bb99c7ec0a8 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/7ff666f6bf179b0a20ce8ad464bb2e1abdcf0de5 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/72e00679a64f930b732675c20306ecdfd0743460 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/223ef908aee7943320c7baa6c2d47a46b7835a28 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/628523a6e3788d7ebd329e78a656987450ad21be |     
    arm      |         libcurl-7.72.0         | NOK | http://autobuild.buildroot.net/results/d932bf209c1aa694f6c2b3a447586316efac7b43 |     
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/620a32ee77f8178b53ab30a7056d8b2d9395ee70 | ORPH
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/8ee9a126ec87d8cb4d00b23b405dd39265a50d47 |     
 powerpc64   |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/2efb4380778de0a5fdeaa06de451730482edf7bf |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/fcdb4e1476b5e062947222813b411bffd37c803e |     
  aarch64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/60a046472de48658211aedcab71ac080b0ed2bf0 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/7037758971050da5e7b69cae97a9d41a915b1f6d |     
  riscv64    |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/79adf8ec9c36755cb8a5a918a89e281020212cbd |     
   nios2     |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/bad685593c38e796f3848e4779a7880eecbadc33 |     
    arm      |         libpfm4-4.11.0         | NOK | http://autobuild.buildroot.net/results/a42e2b7a9de3bfe74d66216dd65aa329faf3bab8 |     
    arm      |         libtirpc-1.2.6         | NOK | http://autobuild.buildroot.net/results/8e012352185564defa5a18e950754a8cf6743eaa |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/ff7e637e3243205738ddc0b034b561522bdf1fff |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/f13f1e40a2749fec5ad8a93cd8eea9a6e4e577bf | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/2412d8fcbc44962c3157d0026e2cb577fe5e6218 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/7fd858259e909eeaf6af77961bed1cd31360ab0d |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/0828aefdafcd1faacf816a419ae3d28c9a546a81 |     
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/aef1c17ffac576493dc0a1d542d330cb4bfd624a |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/0ad6655a9af2a47fe9636420b0ba60bc0c183c09 |     
  powerpc    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/f9fcd3d435d0a8c8631dadabec8dc8fc4056a023 |     
    sh4      |         mesa3d-20.1.7          | NOK | http://autobuild.buildroot.net/results/098079282c301b953373332d4982db3b28f6ed09 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9a835cecb586329f62eb692f4d311907511f540f | ORPH
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/045ccda03a881464aaf7ca78230d1b97c461007a | ORPH
   nios2     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d0e7a67c2389620eb7ad5d99518fa0f93ff11b93 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/9333a7e9083f6d2b0f1f10d9dbf3abb02f8a78ec |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/76523c026312cd31ea1a38aa83b821b37522c7f5 |     
    i586     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a4d5a8c8259d235893780cd4bc117301a1f61832 |     
    mips     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5b87a8d67c5621270e4a77714610a1a9dee5dca4 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/9e579679051dba26def70b6074dd2b1d7baa0b0b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/68d017f40cf0b3c3c1c1cfc5c25d039413d06990 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/923394a90188be52d332f038d345b5e65edd3a3f |     
   xtensa    |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/639ead7b828d491ce5c19e99cd5b7cc29e05cc72 |     
  mips64el   |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/03513ded20d639cd2cc0781df4abe66080a2845b |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/ed2733b32abd89f3e99eb859dc5a68c2f8619189 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/0c70b397b976a6bd40e698d22e47a02ea55a2d12 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
                host-gperf-3.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   mimic-1.1.0 | 1 
        qt5imageformats-5.12.8 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-gperf-3.1         | NOK | http://autobuild.buildroot.net/results/168f20af4ac7ae1e3f380f9c799da15d159e6d72 | ORPH
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c7df085f6a4d2f70f91c6220d4eaf7f159cdc878 |     
powerpc64le  |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ad93b26445c3ca2792743e41d4239765baae50ff |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3dfb9ad7e91a56a273dc279764c43cf803bf194d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d817379ded18ec3403acd6c082bae10147be0621 |     
   nios2     |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/d1d532ac5d29736b6b42f6dd4af1cb20ffc54975 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/23c68d6f65e66d69d35001fc025e712c5815dbb8 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
               ipmitool-1.8.18 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libupnpp-0.17.2 | 1 
                qt5base-5.14.2 | 1 
               target-finalize | 1 
               wireshark-3.2.6 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/718d208d961919be3735133d1ca1bee93ae7cb30 |     
  powerpc    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/90d0cc8a6e5e6c3fea7a3d0b24dc5bf084e7f18d | ORPH
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3a6cb19c50162a0857045c51c11c1306ec69b587 |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1e57ea600390b834d00da50f7dd7eea82bc48c86 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/916d703281528e7b00fd4f9704509524b9deb22f |     
    i686     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8a4d458d5268d7d4056c7531f9e3a9d7d9f98945 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5736e8266cda276e60339f7c0dc74d3a4fa6efc4 |     
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/99f583b3a160d4bc06b7dae742ecc450fab9ea6e | ORPH
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/01de62b4f7b58f76929d56880ff5842c2d9f1cce |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
                  fbterm-1.7.0 | 1 
         libcpprestsdk-2.10.16 | 1 
            live555-2020.06.25 | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/3d0b159c20f9e2a6af7182e99ecc7b232d3ea08b | ORPH
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/96fa4de6ad6aef4612ecfcad1ee5c98738e9b98c |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/5589104ce28dc8ce0576fdc292921d9dbdd2008e |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/3a518981e7934e7a88f39acaac9f9226337e5a8a |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/a423eef904b1bef4d0af5512b229a0bca1f6a48a | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f9528206c1892777b6379d48f8ca4e2d9d98e144 |     



-- 
http://autobuild.buildroot.net
