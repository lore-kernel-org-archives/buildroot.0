From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Jun 2021 05:50:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-22
Message-ID: <20210623055038.95C73824A4@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 27  |  4  |  0  | 31  |
  2021.05.x  | 11  |  3  |  0  | 14  |
    master   | 27  | 70  |  0  | 97  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 18
cegui-00b4e1fe174da53b7ed72... | 10
casync-4ad9bcb94bc83ff36cfc... | 5 
               memcached-1.6.9 | 5 
          sane-backends-1.0.32 | 4 
                   seatd-0.5.0 | 4 
               host-qemu-6.0.0 | 3 
                libselinux-3.2 | 3 
                   gssdp-1.2.3 | 2 
             libsndfile-1.0.31 | 2 
                qt5base-5.15.2 | 2 
             safeclib-08112019 | 2 
                       unknown | 2 
              containerd-1.4.4 | 1 
                  kexec-2.0.22 | 1 
              libostree-2021.1 | 1 
                   libqb-2.0.2 | 1 
                 mesa3d-21.1.1 | 1 
omxplayer-f06235cc9690a6d58... | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e5348164d40294197074874f88985512f01c8b72 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/8ef44832a5d85e566ec7150e48f480c5f3720355 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0cbc721beaadc675ae8faf89dc5bcdce9d7ffaef |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/33248c2b051ba1714111e955e0e0d9613b039b88 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b109c0e623df56bbd3bc27adbfc66e863ce24506 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2b503062f547b78c80665db3f14095093af1bc2f |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/abf81a7ad147880678d332458a3d0381c6bf894a |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7c796a952ef48c71ad17eb32c0f1125317cafa7c |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/56f92d4f10f2a30075f87d94298f96fb29c08cb5 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5d64b99aa085b602098401892757dcd2a25b271e |     
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5b9cdd1f9434546b5845b10a6d286754e58df8c8 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5e0421df8ab1a70d1dc8fae088c041ece3c762a9 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c62118caa5eb3315877d5cdc2169f301606085bd |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a369d6605ef680cbc262b966e16fe5b3c22f524c |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/20fb3e1d6921a12c77f704ca07aa556b8978153b |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/62115caef5487d5f044f4873d6efe763de1ce7ee |     
powerpc64le  |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/2a7ebecad2f74d4a9a75d8095cb51569ac2711c6 |     
  riscv64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/9f8a8f1c1264b52a5bc9a2d06e101a0ac9b56a38 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/29fd23bb9622c9ec5b6c975b23df0ed6346a7436 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/1e97562068f58645128c2f4b1f811b1a2f3ce513 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/84d2b687e9f240ebc0bc7bbc42ce662e5f303022 |     
   s390x     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5606a1f9cacfa7d8c249e4f1b379bcc36e7f5826 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/34f27d09af7432e921b8e535bad29c18562ec51f |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/547f7f5944bae89f6a53defb7710c6fc5517daf6 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/566bb07928eca890f0d0581457e40014e2f9f6d8 |     
    mips     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e692d7875d19befa9854de6748739a678c2927cc |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/00306f92920883d490f332226215fb6829c1b2f7 |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/50e0b9fda26b42988d5ea4fef6d9c2ac574b2d8a |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/dbf7015f8960e7034d1b7fae429fbcea04ea9883 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/181858d900dc954c7ede84b3fd5e5019b2da3fe6 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/04994dc11eb0c451ec8dad4ce968afbc6f083ad0 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/862635362612ad29de053174511439d539408b46 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/61ee7b6bccfe57df094d0c47aeefbabc4a28e7c3 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/54e0a5367bcb9251bf822bc76cdb5be643b9d029 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cd1644ef7084dcca2536e7e27cf059b860fe524a |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/0c6ada98ed0b2d103a7b8485386a25014b5d81b1 |     
  powerpc    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/72d263942bda83ccb9ea7e0028eca7274f9f3b7e |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ca488e5e2578904896cb1fc800d2fef9adb95029 |     
   mipsel    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/241f75d9cdc8a0406520aab4ea1a783b4ebd5315 |     
  powerpc    |          kexec-2.0.22          | NOK | http://autobuild.buildroot.net/results/7f19216025cf4d5167fbd05ed365f80a1ee85ff1 | ORPH
   mipsel    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/41ef84dc15a940baf3e4f4884730140030f941db |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/28eab1801d5bb5d66593e19e50073f7a33f4ebad |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/dcec43b4894be7d0971ef27d45ba1c630c67f4e1 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/ed7a4bb358e734431cbd7fcd8bf52b652cc6b06f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/c5047ceb182eb807cdfe24fbf8297bd9ee886f10 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c17a5f710c68899e9cf3dc19ce2783d2ade27eb3 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4f84614bd06a03faaee1881e69bfd1ddfcf112ec |     
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/cf4bad0ee8e3106de76162b38ded0f4724a9c0c2 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/88362d3a96ebee3d61273e8db0227d2d58df8604 | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/a86366e515a5621fef104c1c62726283d1b97e8f | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/bdbaf59fb59f972d5110570652b7342569e5a924 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f6fafc73554cbd9e689e8316ae67dbdb658dcee9 | ORPH
  mips64el   |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/7cbcf68557f73e713e216ee7b963248be7ab4e26 |     
    arm      | omxplayer-f06235cc9690a6d58... | NOK | http://autobuild.buildroot.net/results/5ad2c377d1aa8fe98ef90db265059e1ff35e8413 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2d7575cedf26b28014d455afcd1183c9384483cf |     
powerpc64le  |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f4960700583280723b95d3f6b5d938f2b7cf0989 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5d1a8c2d90aee8ca6dc30f4707ed0ad947ad05dc |     
    i586     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/015c0f37b63bd1bca3a026d2985e9997aa86141b |     
  mips64el   |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/fb4f380aecc9ed226908652338428f3156f11094 |     
  riscv64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/2e1b1229f6fe25442d16752943f2f58b17a01fa6 |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/1c3408bbbe28ac1c8342e92e098db56a460b96d0 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3e4c0f34c473a33c4fa6ce2ba5cd62e109fc142d |     
  aarch64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/f7881cc257f66736db6157f51ce138985428ce89 |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/cb8007f0c4424daa83de5d5572fd62c273803e7a |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8ef29ab0c64e55df584ce7181cdbe1a1a85685ab |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/a17b746f7840faf5a9216c0659c4b200d1f06579 |     
   nios2     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/b7c265af229dd3f44c8fdb96428e72fc86376a4d |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/7897d71d0e7fa9dee0bf5d55684c2f9e0a4df6dc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f887eef954208ecef28739abc543ac57219f3ba0 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f34e0eadf0af30661f6eb4065cbb954f8622877 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                 mesa3d-20.3.5 | 1 
                suricata-6.0.2 | 1 
xdriver_xf86-video-nouveau-... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0ec76dc1256ca2b587615ddd4f2b7c31dd6dfd11 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/4d0a5f00f61f2f2e9ad4b36cfe8c8fb28ab12e29 |     
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/d961d964418cc79fb2c040679fd5de55eda7320a |     
powerpc64le  | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/62c2fa8b8c74113cc5f953001129337f0b5f1201 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                   sdl2-2.0.14 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/b1145015ab74344c00eb0487d8148a14d0cb6e9f |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/fd35f099ca5283315d09a34052ed820c35b0370a |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7bce71db86df8ba204153e0ab5022fb5ace9a6e5 |     



-- 
http://autobuild.buildroot.net
