From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 07:11:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-22
Message-ID: <20200923071151.008EF8709B@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  | 14  |  0  | 36  |
  2020.05.x  | 27  | 12  |  0  | 39  |
  2020.08.x  | 20  |  8  |  0  | 28  |
    master   | 148 | 114 |  2  | 264 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 13
                       unknown | 12
              asterisk-16.10.0 | 9 
         libcpprestsdk-2.10.16 | 7 
 Makefile:752: target-finalize | 6 
             babeltrace2-2.0.3 | 5 
                  boost-1.74.0 | 4 
               target-finalize | 4 
                  uhd-3.15.0.0 | 4 
         conntrack-tools-1.4.6 | 3 
                 fwts-19.09.00 | 3 
                rocksdb-6.10.1 | 3 
                  zeromq-4.3.3 | 3 
              alsa-lib-1.2.3.2 | 2 
               apcupsd-3.14.14 | 2 
               capnproto-0.8.0 | 2 
                clamav-0.103.0 | 2 
                 dc3dd-7.2.641 | 2 
                   libcap-2.43 | 2 
                   libnl-3.5.0 | 2 
                       mongodb | 2 
                 ser2net-4.2.2 | 2 
               apparmor-2.13.4 | 1 
                   attr-2.4.48 | 1 
                  autofs-5.1.6 | 1 
              bitcoin-0.19.0.1 | 1 
              cryptsetup-2.3.3 | 1 
                   expat-2.2.9 | 1 
                 gerbera-1.4.0 | 1 
                       gsl-2.6 | 1 
                   gvfs-1.44.1 | 1 
                harfbuzz-2.7.2 | 1 
             host-cairo-1.16.0 | 1 
              host-guile-3.0.4 | 1 
             ipsec-tools-0.8.2 | 1 
                libgpiod-1.4.1 | 1 
               libupnpp-0.19.4 | 1 
                  libvpx-1.9.0 | 1 
                libxml2-2.9.10 | 1 
                log4cxx-0.11.0 | 1 
                minidlna-1.2.1 | 1 
                   mp4v2-4.1.3 | 1 
                  ndisc6-1.0.4 | 1 
                 uclibc-1.0.35 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/5e2e4103a0018089e2646b912bc560c0aa085e18 |     
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/07c51ae01d96ecc7cb43c736a2f371808fafdda1 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fbf03445a1bf1022ba6074de5b9b3af111e8ad6c |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f764a9214b207f8c90ec5f5745430e79d9801caf |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/df52eef371648c4212c46bddc859c0fcb62c78f6 |     
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/fedccce7836e3205f24a95a63a82b328f9888d67 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/eafdfc3fb8a1d0acce37377d3d0016d456e95dad |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/5342fa17f488ba523b1affaffb1ab70867d22ce9 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/51b0e7fbc30ea54040ab0774f858111e45f12543 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/30bd9065647d91025689a0337745d7292170d9ff |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/23396579bc18001ad1dca705ae7858e7f0af2667 |     
  riscv64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/df0dfb3c1d4e5340fbc4422ac9f9e1b665960c11 |     
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e52eb145d18e788486fbfbc33a2d95ce44f4ceb9 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/383a55c534ba2bbea9b900aaa9fd58fc9db5caee |     
    arm      |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/b94051b06b09eb86b2249658508389fb20d4ffda |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/842003e248cf6ecf8cfbea4701375060b590698b |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/4f14dba78e87465e385da1b6c31547abce18f54c |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/3e98082c73aee3090f2c8db3ed58bec92aaf9af9 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/22aa72e49f8ba0a6c07b59df065bea17a423e17b |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/ede27d5d822cf0970f27d6a29c36b7cf1b6bfeae |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/1717b692536af5114d161fffdac77b6e6c627323 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/af8daa4eba727083d6ec7b44932d59d58c0c2c6b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c6008d9dec6a5a4b2fd7b9186eb82a7d3a4742ed |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/07f45ca6301cf865ca5dbd8d6910db2c266387c4 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/90982d4dacb399ccefa3eed64235bab34a8dc78a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0a6e783958a44aea20e4e8cf8cc7a3170565fb30 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e22c7149ce805c6a5a8f0088ea90ba972a4ac833 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6b81a36ad3c71ebf4974968d895f4c4e106e14cd |     
    arm      |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/fde4af47542f0eb0bd57b172c99bd086eb566b76 |     
    arm      |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/552ee8d9e44152c9d7e315a5491542771264d466 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/25b3b9b35d13fbb1fe81a44a49e7cfc42c25648f | ORPH
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/78f7fe0d6ce5cac7228a35b253603d246d752477 | ORPH
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/88ea4af852233c422cfdd080b5190d22367f4e65 | ORPH
  mips64el   |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/fb1292e0f5dba902139e187da27324884733e64e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/869fd7bb92e67413d129c8a62c500f2f1c85b3a1 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/56d68b30476f01f1c317c0c3bb578bd00d04d1e7 | ORPH
    arm      |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/1f9108af6f603a7c2472cc49fdb2e3f2ca037677 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/d1ac75bbcff48aef51e7c44cb07fdb44474ba2cb |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/d931948528f224bde0d0f73acb3a197556fa3241 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/1bcc1dcc46b2b9b0ee7c95c23fc1161376d8be53 |     
    arc      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/0492cf6ecabe041b56156d1802b12b03632904cd |     
    arm      |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/cad9a6b654a0644e0562e1a996bc894b2e2d550f | ORPH
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2d2fb8e7bc009e3b632515b123cc445810f3a98c | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/1d855d293a680fd5414984522d0322c404c0df42 | ORPH
  mips64el   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/4400ec9069d40c1a2b41006203282389c86d1b05 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1760871cab884bb793405449e0b302d7c8868989 | ORPH
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/15ac68e6b8a2eacc9732e6267e35d608e7d7f5ac |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fb100a19756e5237e8ef91d35e999ac6691bdf2 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e586ddc9a7eb59a45e54989fa283a982ec2a3bf |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8dde407b7c772750e4d56b825b40f409e04e41a8 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ea1caa56d402b561c0b56baca1a2809b8ac9d820 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1d5c0bedfb96379799f1e7e45fe4a0c3d4e6e20f |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/474c357b4cb28176d8d2d76eeae72b057a9415d8 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efda5922ed27f2a067f1267994c952f87513ea7c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/122326a947b161df3eb67e04e66ec92e7e77efda |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c2d3e3ec3087707c78634f1007ddc838304ac84 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fb35fb4b5859629768c04391db413d826ab5672 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fd1f7fe707598f50db87344ebef2da1b48a6ba51 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3222d447d7a52a9e0934ccc9feb41e9b5f229304 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/2202ddb92e29c4a31121a86866f4d8de066cc64e | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/bac64236f461c8e0d5920b81a6bc33ac7d1b6bb4 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/92fd7179cbc6401bad27448b88e0c47246439468 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9071409c19ee9c125037a3e078c1ffee162a0c32 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0fd10361b604c46f30e6511b38f607e8b5dc1132 |     
    sh4      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/91f1b6f8a978d94cc10bd1a32b5b22cfde5bf644 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/8085c8597404f20febfe503be2769a1ec7dfa667 |     
    sh4      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0abbd772e0b81b879a612a8ff927498c84eeeca2 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/9f3eaf07db65d4cc888aa011ba7c76dfb748d18d |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/eddcc5e1d878e23efc24b94c36f4488eb1de4a6f |     
    arm      |         libgpiod-1.4.1         | NOK | http://autobuild.buildroot.net/results/19e8030ca992709bc7f5c163a5abbc3b907f99eb |     
  aarch64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/820f9327f2861a77e19318e29517101f7d7e09c7 | ORPH
    arc      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/e3d167b203f0f81129bca4073a39b064f76adeed | ORPH
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/5491582ab7e6c2c9ccbac38f597dc883dc11391e |     
    arm      |          libvpx-1.9.0          | NOK | http://autobuild.buildroot.net/results/9836215fe22f260483f9153fb5447892801a14a9 |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/1fe3028ac208fdfb814e6320158e4ea15b3565de |     
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/28cb4225794f8f10a963fbd6b58d11fcdca97013 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/d02f5467fa916b8421b20ef27216939ec9b4cddb |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/d937b904bc9d9679bfd34a729fa5176689b8f462 |     
  aarch64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/71db39bb3addaf2fb116608209425e7080cbe5ae |     
   xtensa    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/cbc9422780d9a0fbf19c66d2a7178fe32adfbb89 |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/3b424a42cda4a2ab870dcf7ddbaf0bfd6a66fec2 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/6b0580db37baf9dd6bbab5a5aecc30c206dba32e |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/c67d854a89717740cda838ca71e222b39b0e1fbc |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/798879ac6743e4bfca95bbfaa7609c3b27c0295f |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b7c106e7486957a9c5141d1b95243332e7c1099d |     
    arm      |          mp4v2-4.1.3           | NOK | http://autobuild.buildroot.net/results/36770b3316613a1c9da5a9d4e9d3d10f72a5ffc2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7df5b5972c6ff9de0411d17bdc6961d7cb422f42 | ORPH
    sh4      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/506254bd6f2d696a8be7cb4882bcf54e75714fa0 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/6d26feb5b29777ad0c019ae616398214c775324b |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/cf0eb62266fbb907267552304110b127be2316ef |     
    i586     |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/eb5d02fde574aeff3d6bcd51d8ca601390ce9603 |     
    arm      |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/b4cbb8d7d802e1dabb3ccd6d2295e957a3202eb3 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/8a26c3ee19b24169ed4f2342746e2876313c1c86 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/5a6f55e115218818492dd8ec80a18db6f30385e7 |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/80864cf8a1b8aa46a1f4dc7ae03f94c51e583f97 |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e3e2155f4c87cab6a53fb40050194b1c989f7b02 |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/966b8716ebf490d113e81afd093dd7ea6eafc706 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b8985c686770d9eb6b4a65968fd901018074c5de |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0ac757e54567c17e44e2e37d7e70e672f0c09393 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/79861720a9cbb80e904f5c14a36e0480522714bb |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d458267b13e164638a500f5c220985948561bb1d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c03e729de6623618cb802f53ab6541f22b09613a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7669300f5c652633cc67848eb72a6f1aeb4d66c2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8763f74abff7022d8125938c19e99997a9ec7359 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e5d596a8380a4140ebdca046754350054f5d4ce3 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6d6d37ecd24b29c084bb9abce5f9092b67945355 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bc05372e4d0e4cb31c1f6cc9b69a656d85c9ce43 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc13711a71c80f0a28b59ccea0238f35ddb4e4c0 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a11106491119bf8d710b7eeb4779423e2aaacec7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/75c9f956fe171aafb7fa7fd549790a41793a1121 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ec3542b851b61ccc2f691532e31223f5ad9e6da9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/77c16d78f5d17d8128e63c1c3b40b6b2b2fbdab8 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b734e54bbab801f441f27ac5d40b576d06cdd54 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/8df32a3ecbaccd4921880ee7b2dfc460783490f1 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/7fd9da6410a3aa3cde910bea115a8ab0b97914e7 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/7ead918aadb0b074538dce5b66e9bc12bbdbc858 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

 Makefile:753: target-finalize | 3 
          host-acpica-20191018 | 2 
                 binutils-2.32 | 1 
                coreutils-8.31 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                      icu-65-1 | 1 
               ipmitool-1.8.18 | 1 
               protobuf-3.11.0 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.12.8 | 1 
               target-finalize | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/9b3098ec46df2351ab6d34bbe8cf2b7af0ff6545 |     
    m68k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/3b43730ea776f4647c3b760835f87df65a312b4d | ORPH
    sh4      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/79b402158d491b52a0ee56a30d25a7e6af052896 |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/a41947264087ab6e862c023660166e76f5cc664f |     
  aarch64    |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/e3f01703812aa0b7d18865961d7b05d722ab1140 |     
   x86_64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/a672f167c7849034d99a410caa432dd31a98a648 | ORPH
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f8e0f2d164465966adc8ab5105c4cb3fab58048a |     
    mips     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/d93b5d086185d35e75008c33ee28cee51830be54 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/c54028095ffeb44b12775910c27ebb91bbf577b7 |     
microblazeel | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/76f3aaf816b837d8482e5b5f906f8bf33d2f9301 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f9dd5dacb6226b359b1e7f6b699ac8a088b61fed |     
microblazeel |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/56ba9572159cc7fd4fc019fc526ee93ee6081f4d |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/2bdc4b7cb0d74aff387253dcf63904ca8d893baa |     
 powerpc64   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e8063ce2f9fc9812ee9cec1106ea98ec9f1f4808 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 4 
               apcupsd-3.14.14 | 1 
                 dmalloc-5.5.2 | 1 
              ejabberd-19.09.1 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                minidlna-1.2.1 | 1 
               target-finalize | 1 
               wireshark-3.2.6 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2cdded8c10e6a26fd69a55d2ce93adba88a4149d |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/50dd7156710541352d9d1e710faeafe0cff95e68 | ORPH
    i686     |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/83e83ad431d336a90b9b8d58bc6282e709cbd4ff |     
    sh4      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/75e799455dbb96acf641910b89dc23aa73d3531c |     
microblazeel |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/14db0861232ec4368920aaedb38ec15a901ccedd |     
 powerpc64   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/6b05c8a376e82160f8fb8e4e0d2a1377496a2b64 |     
  riscv32    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/a4723eae12c6a71783531101e867c804cad7e8e7 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/0f82e5aeeebe9982fe21546a5ef391373bc04d8a |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/6cf4b2c5e395e02ba40fa22072c2fd821a31ff70 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/e0713055163671eb9dc49900d594369311ca2953 |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/dad7a76e0dc39c9a53e55aed355151e59ab31269 |     
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/f5762fc6f458c59f058380b0f5d3e0500941af48 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 2 
             kismet-2016-07-R1 | 2 
             host-pango-1.44.6 | 1 
                  monkey-1.6.9 | 1 
                 openal-1.20.1 | 1 
            qt5location-5.15.0 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/48c20530e7bfa356a883a8da00fe2aecb9fbbe9b | ORPH
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d137512ccc8a5f8300d2c19abe7435d8177a7dbc |     
   xtensa    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/c3a25da55880c1eeec8330582d294cb2ab4ed703 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7024a5b70b604ee0212f0fa07dcf2be6cca203c5 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b7e7370dc4f7bdd5dc086744b67903cba5d2e7d9 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/7bcd509b5e2e713bd9d96f1a37446a0135ee5fe0 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/1c629ed6ed2f42c3b184a046028854a5f394521c |     
    i586     |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/0d754d575b99b8f47f22009fa621f95cd9edfd1e |     



-- 
http://autobuild.buildroot.net
