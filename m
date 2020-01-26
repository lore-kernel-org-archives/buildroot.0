From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jan 2020 07:17:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-25
Message-ID: <20200126071708.7DC0520442@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  0  |  0  | 13  |
  2019.11.x  | 19  |  1  |  0  | 20  |
    master   | 105 | 93  |  0  | 198 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 16
                    brltty-6.0 | 8 
              host-grpc-1.25.0 | 6 
                    olsr-0.9.8 | 4 
                       unknown | 4 
                 libnss-3.49.1 | 3 
                 opencv3-3.4.9 | 3 
                    parted-3.3 | 3 
                apr-util-1.6.1 | 2 
                 exim-4.93.0.4 | 2 
           host-doxygen-1.8.17 | 2 
           host-nodejs-12.14.1 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                libgdiplus-5.6 | 2 
          libpam-tacplus-1.5.1 | 2 
           libwebsockets-3.2.2 | 2 
                    mpv-0.29.1 | 2 
                     vlc-3.0.8 | 2 
                      bash-5.0 | 1 
                bitcoin-0.16.3 | 1 
                  cc-tool-0.26 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
              fluidsynth-2.1.0 | 1 
             fontconfig-2.13.1 | 1 
                  gensio-1.3.3 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                haproxy-2.0.10 | 1 
               host-llvm-9.0.1 | 1 
             host-pango-1.44.6 | 1 
      host-uboot-tools-2020.01 | 1 
             libopenssl-1.1.1d | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
                libxslt-1.1.34 | 1 
                   mimic-1.1.0 | 1 
                      pdbg-2.4 | 1 
               protobuf-3.11.0 | 1 
       python-matplotlib-3.0.3 | 1 
              qt5script-5.12.5 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2020.01 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b3d64b49245cceabfaf06154612c3a0254ccb86c |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7689c6f0c73d620936dcf6e23072ca27fc409517 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7b8cd1d742ed82aed3183bdc8b389852d131f2f7 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/55c2d29b259b05e6a939f44bd5afd7a4eab2e4a4 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1e185670bd80fbcd8651a01b51e53030afdeefd4 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2e542f79d341d73359b7a54782462c9e4c7425c6 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/828073fd1fe54028927212e4f0afba9c63dc38d7 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b595da929a009e9b0c401a2b3f8acc8641a13ec8 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b8106323eff6ac84a17d6fb242d9603536128b48 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e5db1269c7d6f0101997d01cd0a3b947703c09c7 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/816211268188a6e5782278b8966db3fdf500cd0b |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4c799e0248052951f8429e8814513a8859e56ae0 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/cbc42246c21fbc697bcf3af437a0df546a6e66ac |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/50911bd1dfdc9ba25a18dc27bc1c364e3fb6d11f |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/f4c9e4423bf151065233f489add08f18426f6368 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/d7685cd2973ea737773dc4d68f45fe74450e2145 |     
  powerpc    |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/fe8055bd99415ad1a74775f6b78c212a38c1b966 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f2517873e45e63d86a4929ec3568bd9d505e43d7 | ORPH
    arm      |          gensio-1.3.3          | NOK | http://autobuild.buildroot.net/results/b5847ac9e818571b746e2a81cf830b6caf50a7d7 |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/43597ddc42ecc1dcef84c492c2beff795e1a65ab |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/c607ca515677bb8f25c8003656da88b4dc0365d5 |     
powerpc64le  |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/e2dd7f0c4b817bf2fa9d197ef9e27f5258783e54 |     
   sparc     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/74545cb576a091c87919ceb22e134ee484ca3efa |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a3f1a40a97c9a22e59bf0603d6a6f80c3bc43e75 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c7f93eff96b1486754ef7d3c8b429afcce564c3b |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/98d8e1188f7b002786f6a2beae58e084b8e1cf80 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ec0498efe8994878518c13f72e1377ccf65a6e36 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a0120d44136de2fea6f186babefaf41906aea12d |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/815314e8b3bd8fc00ba209a0ba40c761d58049e5 |     
  powerpc    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/ef32b0cf0f9a80f0994a316d898ea32ffe5db968 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/473bc18d72504401e7d879b37686764dea0c507d |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/f5dfb0eb5df460df9362d9379f63dc765b162aa3 |     
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/bc5f23bf0a3c8fe2dad04c4b034661743f467f69 | ORPH
    sh4      |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/51d9bf4414b2c25d2b1f0ba8a797e1a5601579a1 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f4be501e9f5d2ad5f01ee6a02a2bfc552064e432 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2a11c0fcf3c0493666af10bad64eddbfba47e4c1 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/8dc3a14a94990fe61e23cef12c66239aa44637ef |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/08bd44421f5437cf859f798d0998ec9102012541 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/1d35c52135907f0f1d19c6a25c16a7225463b185 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/2322bda08d8f99947073ea9c8a55362447239861 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/699a2099aea15075a6a85ef4abc7e50d0cadd443 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/4d2c1167d6cf650382f39df4a459fa713f9e8185 |     
microblazeel |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/7279010c9fd01f987f5ee204e507591e42a52ae7 |     
   xtensa    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/3c6b94b55b7c4b635b7705ad8a81f34aeb62e623 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/05ddd8677bcda52dce2fef10dd9d2e3204e48c85 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/118a41fd8f72f3e1e62ae0860b597f0da277993c | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/762713145219b0af0bf6aac6fff314392d38191b |     
microblazeel |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/5ae79953316a7bbc921a413a89a1db851d648f53 |     
    arc      |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/543652b958bae2f5dbd847d6de4256089be2da73 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/514facd333146c624941282fa56ff15a9c0a0fb4 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/baab444eed926af6eb499553c0c7c6a9791b7ee1 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c497868a1e66f4491889d57da4fcae77d386d0cd |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/99f9366fd28b0b80c5f78fea135a1ba0a0c3d142 |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/674b9bb046e0f6e14d4b89c018c7105c3ece1525 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6c919de123c57a403feb8febfdd84a14c0663786 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6cf52aa4d8ef111e53e26e71cb983487e397cd63 |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ea581bd0172661a6958bce2aa7022a3736198fc8 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7ef1ca101c01e034f61758f1c5776a178509318e |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/213942752c98f94d844c88e9d4237fd3926e6a9f |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/727c8096a14d842b23c8404f98deffafc5d1705f |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6493dafd12f1f9ae680149e669be1c4c1b8fa66c |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c1881b7af353b391274cc1dcbc25a68a8d291e15 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/15dc3345643b754793ffb67935a706e3deee97c4 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f3cf956191ac37c73cfbc34d2aedea5ec015d34a |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/d0bf624c1656215adad6380618bbc406fa8b6082 |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0e40d7663bc99363e46c2c8d04e26b39589e97f2 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/25b69e2272ff3ad9519f04df65ff4086455d92c0 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7df55905e1629391252a25a4e7b634926dc9e6b5 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a9a416b42afe864ce3fbf771218b1572b295a576 |     
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8b4c6463d426536a2634f1cdd9c9f58b461f33c4 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/88e33e730a3f643f840f274e6f4e9e9c1b9cb748 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7d9948a4075f5d8961e7063a868fcb723eafb906 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1ddceafb7ffeddc093c4e329a824e3c7de9f729f | ORPH
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/27dec2045f4cb28512a8c4b3b6d505471702ae12 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/10316023851b8be78e90109411c4c95ea6074bc4 |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/94f994f81a27bb5a498b13364d9ad7f27a42b31d |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5c2e0afb38b25b5908cb0e91939cffc07e2fc4c9 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b279ae8f93e3ee7b72ee1e2c642ba24975526529 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/b0f29dc1efb52982800d71be35924783ce266ea2 |     
    m68k     |            pdbg-2.4            | NOK | http://autobuild.buildroot.net/results/7255640d58e2960e10445198a465fbe7e3bfb181 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/0cbe5398f32b2c091a88c0bfa8fa3b3bc2f3146e |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/1255bd289c366532133b65f2debd1ddcfd8bcdfb |     
  aarch64    |        qt5script-5.12.5        | NOK | http://autobuild.buildroot.net/results/b9e6b3986ca112d70580a6397dea094f4ada40e4 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/04adef777a05df3e0cff7053416ccf994d9e6c46 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/04fa62bef8848a6175191adb0a540821a5d754fe |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/5512ddc34fe0523fb4d3bb8a2cffb84087a1f72d | ORPH
  powerpc    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/84cb561f39b4459060c08ff68b6e5cad6cc53440 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/280b4db392e2917e265f53c67bda5b62b3c7ce90 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1422dd684cfe45f22d310d8d7a293ba793267453 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8843e280ae7e1005a23414b88786fadc3e6ccc9b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/11cd83e679e0bffe2ba625465f0e42dc5805fa49 |     
 aarch64_be  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/27946285d8806e745323491a9b04d0c199b51dc6 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/286f405f07665363b3b45c9539db32a32e85d031 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/bcb56daf788c8ec0ebe7b6cbbd22f4cfde765ffb |     



-- 
http://autobuild.buildroot.net
