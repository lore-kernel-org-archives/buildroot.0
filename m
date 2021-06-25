From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jun 2021 05:47:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-24
Message-ID: <20210625054716.4125140184@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 11  |  3  |  0  | 14  |
  2021.05.x  | 13  |  2  |  0  | 15  |
    master   | 45  | 67  |  0  | 112 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 8 
casync-4ad9bcb94bc83ff36cfc... | 6 
           host-libselinux-3.2 | 5 
               memcached-1.6.9 | 5 
          sane-backends-1.0.32 | 4 
                  exiv2-0.27.4 | 3 
              libostree-2021.1 | 3 
                   libqb-2.0.2 | 3 
                   seatd-0.5.0 | 3 
                       unknown | 3 
                    ffmpeg-4.4 | 2 
                libselinux-3.2 | 2 
             libsndfile-1.0.31 | 2 
                mono-6.12.0.90 | 2 
                qt5base-5.15.2 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                    efl-1.25.1 | 1 
            erlang-jiffy-1.0.6 | 1 
               host-qemu-6.0.0 | 1 
             kismet-2020-12-R3 | 1 
                librsvg-2.50.5 | 1 
                     mtd-2.1.2 | 1 
                 openal-1.20.1 | 1 
             safeclib-08112019 | 1 
                   tor-0.4.5.8 | 1 
                   tor-0.4.6.5 | 1 
                usbguard-1.0.0 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f9d8cfb240ee20cc1262609dfeabd34bdf1b7e42 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fbbb50e841033a2ebca919c1d9d040d11b629701 |     
    mips     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/41d0e8458de0e7b1fa9c4d87eead2485b0756c2e |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a4ac6496d2a6a6d3c9259d9214e5e66b27f87d98 |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b804202aded757afba273500950ab77eb0d257a0 |     
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/af965627235777f1fdb87b5c4d86f5d295a4b22d |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4c69f45a41462564382f667f5e97b78b49c97759 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/778a94f63c8e9f805badb5c8ff040dcfc5c193e7 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/315c31a6b1aee1dff8922edc0cb143f1853827b1 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5e89f6f46294b2a98db6f02d7d7455a86fcb210d |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d854c45dfd9867736f61f73bf4aa6066b61d6b7d |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8c700e4b36cc70fe8cf31b13aa1db53b46606ce0 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/83d01d8a03511409c08112f68f9b7115470dc638 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f35eeb31997e1496e141d1626394392cf632e624 |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b0d48abd484549f0aef50e53fefbefb5ae93dd05 |     
   s390x     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fcfb6da0ba4d02d61ba20815b9ec96e1df16be18 |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/0804f528b591d9695e57cf1ffe371b5b8ac426bb |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/28cad7421ae914768d87988e9c74af8ca6dc0bd4 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2ea3feb09dec9e3ffb2f3009b9261454fce85db5 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dd02c5b5df71e34b7aec8875812843f7bdbf882d |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/889672fcaba7b076be8291e0f33fe9092f2e30d7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/35ce8d93a9109815c8c75febb4163d9c595c13f2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9a8832f20f010790fdb0f6472047ef663d6c8603 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d28a226f3aebc71d2060b0a3e18e489a1791b511 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c491171ce3778562b3eea053427136d22ae12b97 |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/729a7010af6f95b65aa3d8d95a8001499a58d4c2 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/2ee96365c00d18250755375756a79c4d29d52a61 |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/642c00f9aa4b2984a0163b3a95ba083fa4012819 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9b238fe39c17b23bfd9d6e9d8430d4737d0c034d |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/b8c471103bba114c7474c426e4491b2bec63fad3 | ORPH
  powerpc    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/9b3d882f3ef16e2676d36aa75f2b2d8503419cc8 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/3d58f55aabbd36ac2f85becad756b752d33b6c00 |     
   s390x     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/e86ce9e23df4ee9e14d6061e33c2ae7328e3fc18 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/cbae20771c4a74c208e5a3c43642393bd1730b4a |     
   xtensa    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/10ab04f09deadfd07971bac5cd3ceab8e78eb0ab |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/5e82910e40ed680f08e60a0ffb324f20bd46f905 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/ced43157051a7568cbe215f429ad36da6857d30b |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/199c7f2e177023971ade4480ab385c571ec80504 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b43f409709160d1835061b5415b3ae3cdd1b34a7 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/bf6f063786d2f4b770adb77200325f1b742fb914 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/626ffb9ba45b398a0610a494b12c7aec6b544e7f |     
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/00ba809db5986124bd6093a2cc7c798a91920be2 | ORPH
  riscv64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/bff7f84257dfddc98be36a71554da9f676dac265 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/632787edad6113420b222943e0fde9a74c0f4fa1 | ORPH
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/d54f5e4bc9db1c6e760e2b4cf7bccfa22c0fd4b6 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0fb8d9d5d2cb21b3c52895b458e6ef56ebb31d31 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f7710b32914058001c9a46f0e3e955b1db0392e4 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d7cd1a0e226d0ceacda2f9792b2a1543ac6eea9b |     
    mips     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/41f9226d66470ad5083609067e8bdab051a64baa |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/507314188d1783eca077dae036b223eff5f46312 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/45b05dfcc8f735793801685d28dc383ec7e2fd0f |     
    m68k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/85715d2a90832719649eaf32e575deac9bb8217d |     
    arc      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/c0a89cc77995f120abe36750ecbb82053f0543b3 |     
   x86_64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3794d5069f82ad76fa0335437f2073129e320f0f |     
  riscv32    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/37dedee62559a32657d15b284d0fa714f9e9b4e3 |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/2995694dbbaa3854aabc80c14b80ea5e56c91131 |     
 aarch64_be  |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c5ace707b0cdd44493aca1d3cca416a082269237 |     
   nios2     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/f4cd8305378e3d532e83cc4e7074586739a7f119 |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1bdb767651fff421a83d7015e6bab314a4b003b7 |     
    i586     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/a6d76116679725960fc9a1e696767912a49778da |     
    i686     |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/a8133290d30f2d0656670381864cebcb52b04a47 |     
   nios2     |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/9b3d1096322e2b1b8f448c686df96639ff36b4b3 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/53c0df999d2f98ae366e3afc83e09f6ea3a51988 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/7d176d191eccf2bbc51ac8964657368e949e74f1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8bc5a352c4312f92d1255406792bfb1578525ecf |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/d079dedb922155660ff33787824e2ae75dcd8da8 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/4d37c6a26aaa1f0651cd8c6cef4e0fc34959727b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                host-odb-2.4.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c4534e31f66860177a5035b9ed4728994f503bca |     
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2f14c6eefebd6b2bbfee6df7da61946d1b54eb23 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/56334b65ea3d2e7abcd7df4046b9cd9ae26d5f5b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                   sdl2-2.0.14 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/cbf1e8e3e15934177bd6a6b80e2e5eb6caaf1666 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f022c44146eb13ba9ab36e196fa2ae5991c7c4f8 |     



-- 
http://autobuild.buildroot.net
