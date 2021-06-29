From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jun 2021 05:46:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-28
Message-ID: <20210629054615.ABB71607B1@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 10  |  5  |  0  | 15  |
  2021.05.x  | 11  |  6  |  0  | 17  |
    master   | 28  | 83  |  0  | 111 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 18
cegui-00b4e1fe174da53b7ed72... | 8 
               memcached-1.6.9 | 7 
             safeclib-08112019 | 5 
          sane-backends-1.0.32 | 5 
                   tor-0.4.6.5 | 4 
                       unknown | 4 
casync-4ad9bcb94bc83ff36cfc... | 3 
               host-qemu-6.0.0 | 3 
             libsndfile-1.0.31 | 3 
                 pixman-0.40.0 | 3 
               capnproto-0.8.0 | 2 
                  exiv2-0.27.4 | 2 
                libselinux-3.2 | 2 
                    qemu-6.0.0 | 2 
                   duma-2.5.15 | 1 
                   gconf-3.2.6 | 1 
                    gcr-3.34.0 | 1 
                  kexec-2.0.22 | 1 
               libfuse3-3.10.4 | 1 
              libostree-2021.1 | 1 
                 libqmi-1.28.6 | 1 
                    mpd-0.22.6 | 1 
                openocd-0.11.0 | 1 
                qt5base-5.15.2 | 1 
                   seatd-0.5.0 | 1 
                wlroots-0.13.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/91a9e9b0ca6702c7381f666d71793e52c134fdcc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7b0d0963d20442d87f32d5b1cab27f0231f92548 |     
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e1772014b040a65ca3562b4f30e44692792cefbf |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/685d9e34aced1013a4a610a135b5cae2944bb81d |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/efbaf308169d9da3331a369aec8b72586f7b4257 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e54bd96ad91de437cf8c1ed47b3340fef0b95546 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5394c8a13c8f318f846ac99bc6e425fd2d55d6b3 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1415999c314c063ffe38cc614352bfd73e44631c |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0c1849c289489c0a3e81ebd7d7852ab2e492a769 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0447691f4547a36a7b84144939015971a74b8bd3 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ebda4ccd5f97171e5c945cb8bfdb023c4e4d1279 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0f882f9a5b2ae47a02c3cc852d542565b017d51b |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/289d8b71809986ddb4a1f1c7f3802118b1ae2053 |     
    arm      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/09b86c0f0b0ea0488fa99c01ebbf658b5b46b09c | ORPH
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9e246279b1c9a4d2d6110892acf4d4993b32725f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5ec365eaa1b59e9ffe0f4cea2262b6083d2ba11a |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b2c3c891b397c56926dd9f3c13485f9af95bc1c0 |     
   nios2     |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/a6cd98dc52eb2cba62a28ecd1f1d22c6b0f77502 | ORPH
  sparc64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d98b91a354e771c08af9ed3bd42e7f66ef0e8630 |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/65659b85133c3920163595dfaf55cfddeaf46776 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/54a2ca25bfe525147a8a5684b6b3e5a2f3f034d0 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a17554c0f7b7d82cfb00c16611ec18c8a815391f |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/fbf148e3ddeee7752a11f407eab0a5908214e8b7 |     
 powerpc64   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/454407ed2d534f76577918c3e1cc572b4939b61a |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/7e50b53614cdba5a437fbc8028c0768f683a3349 |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/36bb2f51917976fc2a1eed5a080524010cc4cdfd |     
   mipsel    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9c7bd0b6847d01d6892400b3eb81bdc023c782bc |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/4877b1a97727ddfcb91b11412f20c6ff9d381119 |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/a0057d2b92899e9a51aec8011fb7bae8b2c6da2f |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ed49eb8f9cb0b1c2d7943321744bfb7563be293e |     
   nios2     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/6d8591f6fc780ef4c302d3ca6eae312ba89a358d |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f08afc1460431063c66a3f99331dc1bcc81fec42 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/07bfa36656465952da34d88d16ebeee5890f4f52 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/98e14d2938d3c491d42092131628588601701431 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cf40e31500fb1e253d083814c933bc8e497b1288 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cb02c415204df07603f5ca58fd9ee7b61808ed51 |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/493f77675a22c6be36d343bac175796a7683faf1 |     
microblazeel |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/cb5d28b91a7eaa528770f933cab8d5d796b2ebc9 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/1016f7c9f87f0ad5ea8703ab0fe3f6ecebbbc75b |     
  powerpc    |          kexec-2.0.22          | NOK | http://autobuild.buildroot.net/results/0351d4a0512bee76f7f4f13d1a3df79b5eee1868 | ORPH
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/cee2e129811e04d1545c91b7444ec32061c6de30 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/e6a6d0e7eabde8745d09c99bf1c12757ab818c35 |     
   nios2     |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/29cb7a10ccedbaa564d172adf092b5ebad4dd0ad |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/f87ef352e9a7dcb820d1ef9865d42956288a42e3 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2f2a5b7d4392920884ff69e7ba17d88955caa376 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/9296acd859fa0c0356d3644be1e0fd87b7081243 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/0fd904e75943b951d4b8f615e95e4fa9d4e2399b |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/e6fffed3f8a1ad82eb76007119c0fedc671f9325 |     
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e02fd7bf2935cc344df844f4f197e05f045e5fd4 | ORPH
  riscv64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/500013e4cf66a0a9dbd56d2bb85d153b7d5153a6 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/2df154ff0b4f32c0af2c47313801f6e93e8a3a37 | ORPH
    mips     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/95aeed90f514adfb25657fdbd51d39dc8446b376 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/4302f561a47ccaec3f98fd5d61c1ea1eea280082 | ORPH
 aarch64_be  |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e52ed317d82746d4d8929a1d8712449c327e8d46 | ORPH
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/509ce595ebed3cb73193165da2ab85fbf50ea54c | ORPH
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/1b06169f68ae0b14efb61c07ee8a04c4d7986c8a |     
microblazeel |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/c77bc6d4bc3c72a20388fc5c501ce7f9b2f0a112 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5b347e574341bcbc2b2ab4eb185e0ccdee6e4c51 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/addc0a5c3c8fdb94a19fee1b9db19de519f1e0ba |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/038e6a1cdd0ab3663162041aa8a68d0ef64ddb1b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e91a8ec080a92411945a44d0285b3f9d03007de7 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/30661d54bc1d9394d2330c31279e6357991e4f3d |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2e89e328de0420b90433ede77fa85d5d16e56742 |     
  powerpc    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/d55f3ad7cabec6847724c9c5e200eabc4e6dafa3 |     
  aarch64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/44bb9eff13877deb5b5686bf1f2b44134b80a8f9 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0903394181e6f406f852a8443fe1346c26d08c42 |     
  sparc64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/f165f7912412f36bacbeb713a88bcd408915de6e |     
    m68k     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/9c6d9001902ec938c7ead4e355927fa23ca7747b |     
  powerpc    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/9acbbb2e30cf4562f2fd75c28d0171aa7f08d67a |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/edeb667c0bb34bb1798bfcf708d4a75a705e93b7 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/a0ac7cf377ca5b2177243e24f85519a7e81d72b7 |     
  powerpc    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/08fa34694ffedb245833e58ff472719fbf22a2d0 |     
  aarch64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3416601623bc5d2ff4ddb401e45cb94b379c2b95 |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/db6a33f2e0b3e571f77fa44a5a1b136641caa876 |     
    arm      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/055ad37d84fbcfce3a7d828625878f464e7a0908 |     
powerpc64le  |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/03256fc0feb5eb28c0ef60c3df496c49f2fdbbd8 |     
   mipsel    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/88374537aceeec9e2fb4312a0e3a253cc5620347 |     
    arm      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/8e7776d6d79c90cda3341b47c627fe9bb8495b5f |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/66ebc536a7e9f48d5cd81c87f9d543f08825a42c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c739b8b96d5f7628b8b7cf84c4be4e09af4b1e4e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7fa40a32e199b63d131facef9169854caf36d525 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/948de7f10355c152dda2ee687c7f28b59fb2de78 |     
  powerpc    |         wlroots-0.13.0         | NOK | http://autobuild.buildroot.net/results/79c61986bacda0f739fe4f9df46fdcc62041f6aa |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   eigen-3.3.7 | 1 
                  exiv2-0.27.4 | 1 
  gobject-introspection-1.64.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    qemu-5.2.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/275464f5c5e03aadb747eb62acc30e5d4821aa00 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1290632496ffb8b18069fd246bf58314f3dc1c6d |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/735fc4272c52788056fefb74e85c1a365c463840 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9e7f89ef62048ebe493e36ef03b98051baffa30d |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/e245895ab92a3ab8094f2265d355f1a4045f0bd9 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 3 
                host-odb-2.4.0 | 2 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/606f335870d3b8430078d24799c50559012294c4 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5727686263ed05e59b202eeac836a0154c62d9d9 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/51d07f0b71ee22bbc3949125b2b9633594b8325c |     
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7853ebf7434d0d853bb7c76371ee8fa8c3eecdc8 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cc46283e6d3f3df169237f498de79853b7c2d507 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f7e5aa9cf16a30ae7c1470f6f4bfcb1539eab3b9 |     



-- 
http://autobuild.buildroot.net
