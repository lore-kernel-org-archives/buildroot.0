From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 01 Jul 2021 05:49:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-30
Message-ID: <20210701054922.EAFF940284@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 25  |  9  |  0  | 34  |
  2021.05.x  | 26  |  8  |  0  | 34  |
    master   | 43  | 100 |  0  | 143 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 9 
               memcached-1.6.9 | 8 
casync-4ad9bcb94bc83ff36cfc... | 7 
           host-libselinux-3.2 | 7 
                qt5base-5.15.2 | 7 
              libostree-2021.1 | 5 
          sane-backends-1.0.32 | 5 
                       unknown | 4 
                libselinux-3.2 | 3 
                   seatd-0.5.0 | 3 
                  zeromq-4.3.4 | 3 
  binutils-arc-2020.09-release | 2 
                  exiv2-0.27.4 | 2 
                    ffmpeg-4.4 | 2 
         host-gcc-final-10.3.0 | 2 
         host-gcc-final-11.1.0 | 2 
                   libqb-2.0.2 | 2 
                 pixman-0.40.0 | 2 
                    qemu-6.0.0 | 2 
             safeclib-08112019 | 2 
                   eigen-3.3.7 | 1 
  gobject-introspection-1.68.0 | 1 
                   gssdp-1.2.3 | 1 
                harfbuzz-2.8.1 | 1 
                host-go-1.16.5 | 1 
        host-sentry-cli-1.57.0 | 1 
              keepalived-2.1.4 | 1 
             kismet-2020-12-R3 | 1 
               libfuse3-3.10.4 | 1 
               libgtk2-2.24.33 | 1 
                librsvg-2.50.5 | 1 
             libsndfile-1.0.31 | 1 
                libsoup-2.72.0 | 1 
               libtheora-1.1.1 | 1 
                  matchbox-1.2 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                   tor-0.4.6.5 | 1 
                usbguard-1.0.0 | 1 
                    xen-4.14.2 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/c3230173234d3aa37ce3e461586f93161141457f |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/e3ab3a5034e5392384421cac68f17f9d0ad3f8c6 |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2b08651a4d3485c29986fb23612b1acce7fb0b48 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/af421ae0571492aaf1d9aa6061f10cf22e40ef5e |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cfe286d521eb09a412b536ef71f819f65611441a |     
   mipsel    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ba7c4d09fb277e1625eaebbcbc9cdec29ca14930 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/255a5014c9c93e2513b8960680339e203b73347d |     
   x86_64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/89c7e703e3be60053505896be9975c1ca5195a71 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/68e96dc4cab915ed6383e1080c7816064ae40ba0 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1a0a041091a80cbf4fc36535fa309f374eead903 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ed02cff9d4879532e8973fa296f6992bed100e5b |     
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c36adbd80da8ad663a8d067ec13d4fb481a6c9af |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0c52151627097eba44b75e3e30e92d9cabe56117 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/95486a75621be75a8242263a0649b2267b50e875 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f8edbefd8a4b90d155de6a1cbc1ceb193f9042f7 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ce8925ecadd7ec2ea9aed7cef8fc07f08a1344b9 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/77fbff9d2d1c54aefd62eb3b0c88eddd597a28ff |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1ca8f4aa52a496de6e792d36128a24a234a1132a |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/117370f46a338e5a666a4e58586883357abd2065 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3baa338aa5c3af2aa7fe1c8b24f3ccae86fb11ab |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b1a9ee466caf93dcc575b193240845cffe0fb17 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ea56e4a9bbec4730bb4775f4b0405d22456eb4a5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9f7de12780df637c7990317705f5fdc19df0de17 |     
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/14099ede1b4eb9774cc8d2548006727f7b0b0091 | ORPH
  aarch64    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/ffd25131e22dbda78f5fdb5033e6300c5c6fac58 |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/b8bf6f1537dcf384a6d8eb0735ff80808e438ac6 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/469d636453737281d01a50a0246444be18273ccb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/49ee15979df35951586fbc90a52f38c531642f38 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/42a84555e425a5ef6224666c2c06e83a02b3d0a7 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/bf3467733b44145c8a6c0ba94c4fa1febb822fb1 |     
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/878c02a1581c3b49748ab9f5e7e3bce3d7f5b807 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/030d97902e24dd047f4c517f793280b6888ee3ca |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/31e481cb3ae886f24d6fb13decc458da28a1b118 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ce129ab9ed480916f3e6c192f56540e47a70b257 |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9356cc8a6d39079de724ed8a56df1308a9a9e6cd |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d43ab5d237bed656893c9d9faa9bdb7d4d84f3be |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f21308d50423408cccd1dcfa19f506cb2c23659b |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d47ccbf943bab515c4f94660010ba29190e9c773 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4f0097b7d5b5a87fdfc0c10fd8c47bf6676422ae |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/2d0d48196f62bcb38e51f9efe00b1ee047642b65 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/b221624c4f9ec1e61ddf25721dd1efbb0d6e976f | ORPH
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/698fe0acc3714be95bef847331985cc2f7c39e50 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/361178aff884b5a30dc07a030c404935d7eb4ccc |     
  mips64el   |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/2c504ec5b4daf7228afd1eabdb98a6de9b7b197d |     
   mipsel    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/c9b3e79a26f4d7bf651c24ac4f391bdc4e8c1517 |     
    m68k     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/6c361e1132f9a5fd4d20b2521f6282265911a932 |     
    sh4      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/31b37a626f815f6acc383427848ddee36ba5c433 |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/30025b456915d31dc3d494e934a13fa625c15d7f |     
    arc      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/35784211c866c69d93426c1b5be88d03d6749292 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/011fa5f17edc765ff4c0bf739949e579c8a8e500 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/27fa1ba120eea34f4907d5a080d74e3c44eca0d8 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/685188b177708427c8493c9dcda0b91b62a24e0b |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/5fe8d0c69a9afcbf170bfc3629468dc039e193a8 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/0aa9d9b072aed60447979196667b0f3bbf339cc3 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3ac736f179c3ad5dd08d5278ff54fb71f2d7cb30 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/942b1cc4592a592643ba6dd5ced0c5c8f9f3caa8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d8ea973d52ee6c33e381c0be95cc6d38e3d24432 | ORPH
    arc      |          matchbox-1.2          | NOK | http://autobuild.buildroot.net/results/eef2b23c4f4436792731c523aee1828060ffe642 |     
    or1k     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/94acab0e9ece3eacf394be4cfe37eb201b5a4228 | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/fa54952fad7a677bf1b2e9a6a9332622fbf428df | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/2ab1f7e48336c211ace01e82964d4cd65fe60166 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/b7527c39115851a3cd55f3096ece920fcd09612b | ORPH
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/971ca1d0468bd4ec3d7781a9597177ae71a2d11a | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/4a2d1a1238776bc2e324495dfedf40d360fce837 | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/62b97b5d1a7cc105edf46a8841cf3c0aee30b863 | ORPH
  riscv64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e0f79ae4768b1765d6d53876f4fea993bc20a3c5 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ce5d94fb24c772d6d3775c66762e409ccfb52214 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5b088b2ff0f192ae3bdb4c08f0b6ee1b36ef9a86 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/07d3197e55fa13a116b01a67d0dc158a660b9ad9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1f2dba0b339f5a562f3fde63bf3197d769490283 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f5b51b25d2644aae43733b235245675bf355b5bf |     
    mips     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/5417f4e7295d5057705cac001c959c9b4b2a2827 |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/136b17c8e117c749af6e4b9f15660748c43997eb |     
    i586     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4fecc959ead3d32fdfadb715fc9295a6c44bb110 |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7ecee11ae54b5b0cdf4b66cb6c6138756c372f54 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e0c05481d555f660aa6e24c90f9ad615e19d974a |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4756d90d46960427988a072865af73865dd15569 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5fd687314d1b2d2691c238fd3b6e91b843e67df5 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7574530c28de57bccebc56497be0fdd5c6befb8f |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/62fb098038e1f73c9eeaa3f544473c34a6c6faf3 |     
  riscv64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/ff9fcabbf2e2d8df662a46683e5f63d5d3d01ac1 |     
   sparc     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/a7e056e86b0be76bf4485f5cf75e17ce68484246 |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/0f8f89ec7811ddeb17f1ae3c098b3f53132d4177 |     
    i686     |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/019fbdb0a09950a2c773222dea87175f2cf6aaef |     
  powerpc    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/e8c857ee935f40102715f1fc02943b34a35c9ed8 |     
  nds32le    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/4b9c2fe71667e20915cfc0a1236602e91469e470 |     
   mipsel    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/f3ccbe26d3851b69fc122c95e25ebf9f8c2f6fce |     
    i686     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1d3fe6e51c27c52155c862962d35a1a771eabcf2 |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/5bcbc610acb07176ab8331756c6c0cdfa404b379 |     
    arm      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/bb64de51931f714a5581dea712d65b4cccd215ed |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/20bd95a822acb19332fe0b2c5365a62f299daffa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ce9b6224977470a9d1a8a0d2667ea3331f40c001 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0839ae1e3d0b57c71ae7197df384d0d1a6b4c324 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e976922a5b132fc9ffbf37841b5fb10b309a83bf |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/fae3117d9f485ce21d26f813248b25eccbef9fdf |     
  aarch64    |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/b7e7df4a60d63d78167de39cf72cf717100b4dfb |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8588dbd109fb1e2afe67d83969997f9a8996cf02 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bdc5c6834a1de52fd2317b9ff6f05d8c123c6366 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/71fcc093d5fcd1ea90b31ed571696eda3bbad298 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/390e2a9efd2424eb758699b47e29c8a116c15a06 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 3 
               apcupsd-3.14.14 | 1 
              asterisk-16.14.1 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9d0245d968b5fb2ca52cb9d2f6b7bebc11e8e8dd |     
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/1b1b1e3327ff5df716c8756d67190049ef3d18e6 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1dfb3914396f587704b5c66bdf5e1221b78cab96 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bff12270f5bf4a42a76a39aee218f6c019ccf2b4 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a159b29108413fe385a12b84d79754abfa438bbe |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/15703c69be0ceb1a7cc2b769d986017448a51b41 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9fe6419af26584f5d565f19ba02cd4f4fb504259 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3381211475d187abd7c566b0b6a58b30a1770d26 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a0e5e6dd01cded2993b2aa6886d3109bf28a0362 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                   bullet-3.09 | 1 
                   eigen-3.3.7 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
             kismet-2020-12-R3 | 1 
               pipewire-0.3.26 | 1 
                qt5base-5.15.2 | 1 
           spidermonkey-60.5.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/382eec610acd43846b6846d08ac0c535a2d3c0cb |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/ea9f0f9061cb8a0d5018ca32248b8de884aa5e29 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0f8977ed096669eb7285edda472e293b29ddfe12 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6c24aa08d4771544e529fba7fa35e0932b82b3b1 |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/30a22834952fe02a54ef0c65af3730cd7bf8a551 | ORPH
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/a37df5a54ea366c6bf2afdc6d0ec3bb6ce21b8f4 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6cc2fe61286c90b16be3f602ba80e75637f3987e |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/f3e897c3b34f8263f10baf947d1d65401646a541 | ORPH



-- 
http://autobuild.buildroot.net
