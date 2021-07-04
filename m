From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 04 Jul 2021 05:46:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-03
Message-ID: <20210704054639.654506062E@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 12  |  2  |  0  | 14  |
  2021.05.x  | 12  |  8  |  0  | 20  |
    master   | 46  | 72  |  0  | 118 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 9 
               memcached-1.6.9 | 7 
                qt5base-5.15.2 | 6 
             safeclib-08112019 | 6 
         host-gcc-final-10.3.0 | 4 
                   tor-0.4.6.5 | 4 
                  exiv2-0.27.4 | 3 
              libostree-2021.1 | 3 
casync-4ad9bcb94bc83ff36cfc... | 2 
  gobject-introspection-1.68.0 | 2 
                   gssdp-1.2.3 | 2 
             libsndfile-1.0.31 | 2 
                 mesa3d-21.1.1 | 2 
                   seatd-0.5.0 | 2 
                       unknown | 2 
              asterisk-16.14.1 | 1 
                host-odb-2.4.0 | 1 
               host-qemu-6.0.0 | 1 
              keepalived-2.1.4 | 1 
                    libbpf-0.2 | 1 
                   libqb-2.0.2 | 1 
               luasyslog-2.2.0 | 1 
                  mupdf-1.16.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
                    qemu-6.0.0 | 1 
          sane-backends-1.0.32 | 1 
                  waffle-1.6.1 | 1 
                  zeromq-4.3.4 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/28664910d04281549285db08cb811a862a5e21cc |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/7b25dce51595eef1ceb8114067647723ab98bdb7 |     
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/bd020951c07364dc0a14a609dd56385536aac9cd |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c50633f333ab9fbef638deb02f05a7f5c6d00a04 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2bcc250a46e471c38123875bf1931b592598ac50 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e59bdbeb0c3b403e66b8389113c23daec1b9d3ce |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/96d2841413d77f113f69adaeb219a6a8bb374af9 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/31e76aebc2c517590570d03abfab2c2175fa3af3 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/101ee23a4ad4a8986133e5a4eba31e711d6f0e36 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1de6cc24809c00bca9c0f12cb0929453c5675789 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b5a73e10f3767b13a54a3f2923800e5f6722db66 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2dd23be64fdb81cf1bc91b05a520ec8fd3667b6c |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5294e77c6cfe5b1d8d719c1803359608acb587d0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f3a64d2a8dc61ba8329a9b499aa52256d41b3c7a |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3eac25134d429315d64c31628458da4463d61b8f |     
    arm      |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ca796c3ed8df486d673f3d61dbf3845a0e049359 | ORPH
   nios2     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4497ed06d48deaadb80f652ef3a9673e6f1082bf | ORPH
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/e531029f75c8d6886f797b5bd01795d16f6848f3 |     
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/7645f711ce7493d64068882ec18e61a29229ea58 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/306a7a7086539c17b2cc666916ae6a36d7e0309c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a0be4237bf2ddae27920b2a6c397c199d8baf0f6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/df4768fd027b635f0db2341e3e289ec325e1ccad |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a96cefdf2c81d80cbd7fd253bc49e836197c0987 |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/77250d8ff4ccde5011f9b7b3030c4919d5d7bc9e | ORPH
powerpc64le  |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/0eefd09e22fd2c5d59329e9eb213b4f886e79ab8 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/8c8d44427b4b2de8542152c380130daaae850af2 |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/6950ddfed9fbaab36e2a9e0f24ebd50a4417f7a3 |     
powerpc64le  |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/987acd631dd3dd2e3b9be5029e0bdc4b70993387 |     
  powerpc    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/59ce25144dc8333572d606b1089864fb2b75850d |     
  sparc64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/47e6b1b31ec60a62da2d28bc652306c5a38b31ac |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/ccd04b2f6a246eb28cca6303231b69c970dbd53a |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/83f6c610164f83ca1b2d6b7e70764424bbc06bba |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4b3b20ddd27af19f433fa04493a1eb066f2a1d97 |     
  mips64el   |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/d72e6c042667acf829ce394a6e2ae10d08db4819 |     
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/a29235b0bc8727cd4d6ab0a063c66683a2ecd08d | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/5af1f58cf458ad036b6a338719230c589067e2dd | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f435458dac4506e704131c383206bb8780e60c34 | ORPH
  aarch64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/b21b2787b68d0c2287dd2e865f254aaea698c688 | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f75b892cb297ccf2267eca6618379a5e70e9a39d | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/03da0446c7412a1e2835dd499200d5cc9cc83e3f | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/b4d5b07769a123712d3df466a6da8a014ccb2cdd | ORPH
  riscv32    |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/ecc71ebb41f5bf0742d0157d136fcff88eb86b5f |     
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/233f98a6ef4b26a3211b85cab0a90dc00828cf9a |     
  mips64el   |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/58ec8a73c031264070eb9ab3ce8df3b12413e4ed |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ddc7e7d2ce703257fcd543d7e767e4c4a64868a9 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0cfa483189ec5d4c29b162ef0bb5423840c2b264 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6a936604efb646931faff2ffab6213e4b46e25b1 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7a5aa482811108c52c9825713a3cbabff643597f |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cbc3a8409dec759bf1a99d7a5efeb3d232a30b3d |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/db39f5476d13fc7bec8a778d3b1bf578d382bfac |     
    i586     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/063f8b1ac7a49cd98f63b49aab262a896e149f41 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c381519a301457e8ce3e065ae99e626b4825e293 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2fd6e499b7292afe3bb18c377479ccfca443419c |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/252e72a3925825d1901e282ef2eaebddc312cb8e |     
powerpc64le  |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/d61094d5c57ec85f4400144f375d5e24048be236 |     
  sparc64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/0a8603997bb61d98b87acd3d6328cb099e6f8f61 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/744ac51820f160eb663c3072526bd5f9b4d20b7c |     
  riscv64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/947034b0a3ad3dff90a1a344f562483de15ff82d |     
    m68k     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/944aa87c0682015714210b52d322cdbff3d199d9 |     
microblazeel |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/8a98fddb5ac1ff31a176bf574f1829af71e7ac3a |     
   x86_64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/5f27ea54689c38ce9c95631311ae45ff0da63964 |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/87b4d462c8ed80d93c7a89d26c234bef277c0062 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/52bb3eb5e5221670d3d7f2f070bdb66dfe013158 |     
   xtensa    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/709878eb4e9aaf726695e70a9ed49fcce9465ad5 |     
  mips64el   |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/f720bb9cbe5980128c65343540889d710770c235 |     
    arc      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/887e4b349ed7dff2ca410f42e9c09d5f29390f89 |     
    arc      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/15692533bbb95397f7d58d8d8b39464bcad1d0ee |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/524b474b6a180c2e19da69c75e180b67da3a8620 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c0513d9c7a02cc552317aa9af9eb77ef82135dcc |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/a4edc54c9fc9b12e85a0960cf0b14b264d324042 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/303d9320329266d51220c0426cacb8577bf35e10 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/e27b671fbef89f807a5e70a2026a5db990a44d57 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/721e44db4c27513c2dc3ce2dbedc897150ce53a3 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2d65a7da630b50c2edb2831fd82cac9c428d3528 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  exiv2-0.27.4 | 1 
  gobject-introspection-1.64.1 | 1 
               libtheora-1.1.1 | 1 
                qt5base-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c2de252d2fa2b0a10513ea92aa48e9df52f2a3d5 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/becd2282aa5f2a438ae90b451c1c1fe2d41e3db7 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/de8cd144e17d7453b81b75d69a82612933082032 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1e2b1263f221e31771770cfc5fbca9087fb0bc6f |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4815cc831e0b0c12475deab9bed1247542c6a66d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/1cefc75c700167856a0d8735c3aca34cc88403c2 | ORPH
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/afccf7c9ebb4ed405862ffedc234f74aa5e1d50e |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a24edc08014204c87a73c33a1f3c2b4820b8eba |     



-- 
http://autobuild.buildroot.net
