From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Jun 2020 06:28:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-22
Message-ID: <20200623062813.2FF7F871ED@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  3  |  0  | 17  |
  2020.05.x  | 16  |  5  |  0  | 21  |
    master   | 116 | 101 |  1  | 218 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 31
          fuse-overlayfs-1.1.0 | 9 
                qt5base-5.15.0 | 7 
              dropbear-2020.79 | 6 
               domoticz-2020.1 | 4 
                       unknown | 4 
               apcupsd-3.14.14 | 3 
  gobject-introspection-1.64.1 | 3 
                gptfdisk-1.0.5 | 3 
              tinydtls-0.9-rc1 | 3 
               belle-sip-4.3.1 | 2 
              bitcoin-0.19.0.1 | 2 
                      ell-0.32 | 2 
             libxmlrpc-1.43.08 | 2 
                  zeromq-4.3.2 | 2 
                  apitrace-9.0 | 1 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
  binutils-arc-2020.03-release | 1 
                  boost-1.73.0 | 1 
                        bullet | 1 
              cryptsetup-2.3.3 | 1 
                    ffmpeg-4.3 | 1 
             freeswitch-1.10.3 | 1 
             kismet-2016-07-R1 | 1 
                 libnss-3.53.1 | 1 
                 mesa3d-20.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
                 opencv3-3.4.9 | 1 
      qt5webkit-examples-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                  rygel-0.38.3 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/20460d4f6a544e1b2365fd0c8ec5520b04f67333 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/35e2068afd947661c41be74a1410d7248fd5cc26 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4c33257b7da2b0da111f62a7fde1a4272ccce1bc |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/32000fea6c806ed5b04b2712bfa5fccb58cd475c |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b7a01dc558059589785896449bfc10b5aa7a4abe |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/19a58b6a22050250ed8146a71ec1fca007502170 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/34249a79a09f7d6d9b7f1347a7269100056e845b |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/dd2ba18d83cb250f9de7bf6bcb6be1fac010e0c7 |     
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/c059964a550d529e337f23c9e47ea20180a32cb1 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c46a9db23cfd5eba5906dcf5adfb5408a31d4737 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ac6fa0f6550913b86e70b429e54d7fb0ff3ab177 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/33739939d33a5232d1300354a2f3f0c94cd14941 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/7718287f333fb95b0da34deffc2c98b791603050 |     
microblazeel |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/5470a44fc7b43f162d57b082ab17156888d19158 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/743882665efeffc54d2f981e3dd2fe36cba2eca5 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/93284b15d2b982b15cc20e1e1d462aac3e69a93e |     
  riscv32    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/d842ff11375cc612b387646b997c8a6a7425d199 |     
 aarch64_be  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/18e2eb4c666e4da7b6c22b0e89c811f5c39d208d |     
  powerpc    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/67a8db53c460dc493a354c302cd061bde80a8f7d |     
   xtensa    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/5829e33de416e04447ccf0fef682b6637fac45bd |     
microblazeel |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/0b61c95defc0c70f3726af3b2c339d738b1e780b |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/c6348d8ad9d3788b33e76bfb58e64d527326164a |     
    arc      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/8b89cb5c126e4a9ccfd502c183b005ad87328744 |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/39c058452614ccdd9daf88ed0cbbceb9c03a1f84 |     
  sparc64    |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/f3f6c8f5203edfefc8477931c8ca76fcbb4d97fc |     
  mips64el   |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/63c3c4fed8ffacc41aa4c757e0f72652a7953684 |     
    arm      |           ffmpeg-4.3           | NOK | http://autobuild.buildroot.net/results/e671a79bb11b25933bea908d4320ebdff3a1e124 |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/0dfb5b6742fe0162f39e786c994d675d397232b3 |     
   x86_64    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/027e1c5354765ce352b542e9bd88040a0ba57052 |     
  powerpc    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/2fc0e7d4c3e9d91446a4e4301163ea875f1fc998 |     
  powerpc    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/31899aa8f340f1c3bc7b4a66bec64ea998cd397d |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/5879407903ec4098692c9daa27faaf2036bde5a6 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/6ad6ed23c69c521f33ad75db1ca374d51bb9d03e |     
   xtensa    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/d9989d291e9d8edfbbd82fbceb1ddca8768e6618 |     
  riscv64    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/57d6f6bcbf3c0f8761c924f8a69c71dee05dd6c3 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/1904d9d98a89bf309a259fc9d3759b05ff3d9dbd |     
    arc      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/cdc15c57ecddd648e3e3064980ff5079efb78eae |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fcfce274abcceaf1b8b102733b101d2783e5d6ca |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/18f34f73dffbc62c4164eb73ee1639b0bc520494 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a015ce23bb0549588da1f89df65dc200a512df4c |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7fd72d6ac97c2679065d98606476536aeb1de493 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c09c9b5ac53d5509d5c315417f562cc3d86fcb0c |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2078c7b3dae694d7fdc9b904d9550560ba59f806 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/544c9691073abcb4a2a7625a1fda185986fc88d2 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fecd3e9c34d162a9e880af35ca1fe65e9dd253d6 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a86ba11a8b49ebfbfd451bbc9b4675d5768ab2a5 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9f1d56c76a86e68e132dabbd7560d0520ff8d15a |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b58ddd5324909681cc4b890eca252ce72ae7e0be |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/61764fe5ba1b43cfc11fec9019639354ed9854eb |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/bb75bd791a4bb87fb2eed1c2d21c9d139bdf8a62 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3e7bd6bf22f9417d19c90b53ee450b130b6b64c9 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7a4d4207270d57914ac15b9172d83874f915428c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ebced360dc5c62515c8aa642af4bbc148124d113 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/52f8c879bb8412238f7b0630cddb4ee2a22fd880 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9db687ee8151f9837d589c4b66dee6bf64b96420 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/02f2b524add307c8f7cc1af1ed0783bb1baf029a |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7bce41492a7b640d4317a4025ee7560916db7d2b |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6f8dd9caa53a144f810252c3c51eb32995242022 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6c3044aa8f37c96a341366639f4592c8ec6e907e |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ccd97715092ec47a732733b1b851dace7673e49f |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/819bca315ea3329df75084a9debb9643232e7f11 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/03d36f56ea3346d3081c5ab846134f885f19cb79 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ca3a2973bb8347345165b45f811b72a12165ca9b |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/49d22a4d933723ba8c722cbd2435a70cc93c9e42 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4597e76954149266db87b67f275d4a4b90990899 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/dc9f2ef88d9cfff509bfc079d100ec1e6a9b0e74 |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/036178b53fddeda0f36658b13138c2393d0f57a2 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/92ded2ab58927c2ae69ea8502cc2a68bcfc3c49b |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d16fad55a4a23fda798523ef313cb47a9c5c6c0c |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2a4b8b6616ecd2ffeb04ee26f1d6fbfc409c4c60 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ef015fc1c6fe8c892ef191c513acbc186e89e7cf |     
   x86_64    |         gptfdisk-1.0.5         | NOK | http://autobuild.buildroot.net/results/8d15d2a6ac25164bc79749bd9e6fd87adb45a08a | ORPH
   mipsel    |         gptfdisk-1.0.5         | NOK | http://autobuild.buildroot.net/results/f4dd2b419b3079cac804deff3d8f8f1e5c3f655d | ORPH
    mips     |         gptfdisk-1.0.5         | NOK | http://autobuild.buildroot.net/results/aed25a8d6399f2f4c810cc9f3356b3638d5627fc | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/348e65614b77e3994a52515f87ac7c28b1027f09 | ORPH
microblazeel |         libnss-3.53.1          | NOK | http://autobuild.buildroot.net/results/2e8cb5b82098e3107aec6ebc7f9d67a19ff3858d |     
  powerpc    |       libxmlrpc-1.43.08        | NOK | http://autobuild.buildroot.net/results/308786e04709619dd96c49042b0eefc4e02f10ae |     
  nds32le    |       libxmlrpc-1.43.08        | NOK | http://autobuild.buildroot.net/results/99b0d905a839009d8753d71696b794af6188aa03 |     
    i586     |         mesa3d-20.1.1          | NOK | http://autobuild.buildroot.net/results/7b3c2f68e82c4231e10b3f63b2eecdb0d428a6e4 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4e3618b88a477dfe1a986cc892638bf91a295ea7 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/b72d9c4396afa38a3ffa1d58749bca65f19caacf |     
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/637884e043aea8ccebee16743f6ec7ff507394c1 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0a21e24bd4da37ff9befc74d4ffc720e50acef8c |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/97d3a966532226fd46820e73ccae4cab8a43b516 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/785743ea0cd4ae770120906f747028a9b545b2af |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b66bed2ee078977f479ac75fae28043ab879beb1 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7a7acdad9c7c69e2047f7ced4c3d54ac9cc780c3 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c5cb9a5bce3d338c0ac0e9a1c5d3e4b86706619a |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f3cb0a254c22de64d2464b01fbb19162d150312c |     
    arm      |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/6bc23b3c88d3ce7bb128b976c4c5626c18dddf2f |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b759acd2118d6d885c5d8eb1cce4659d04de8eb8 |     
   xtensa    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/956f279813e03fbbad7c530186c06966242b9ae7 |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/aad21c03dd217d8f3ba575df943fb49d126453b1 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9d3e03ac033e15653f8ce99ed87031fa7f42e505 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/29361cb45e3f10ddc198fc7c92ff22c94b3c04ff |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/79a0c10598e0d9f02be0a077f4e43a06381ab223 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/58f0df0e1a1bf74dad600bcb4b293b96d230f791 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/04c3fd94808df7f41f7b92a6edfa49251d1fcd6d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4346f7e97d882a972c20eadbd7462e9babc4fbca |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/a6f6c64ef846d29af7173adb7514c4f06852afe1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1d2c3794ab380d3cb92af96c1b47988f2102dde8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3c1c3a1bf845ae7a903b35a46b3417a8e16251ec |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             libopenssl-1.1.1g | 1 
               protobuf-3.11.0 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/2b92c01b8b2196202acc38fb1565b8e279e9ac5d |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/0be999f03b20cd78dc9308a5942bf29e661576a1 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/d607481f3381b272d1b13b251456e8d8d044b461 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-20.0.7 | 2 
                   mpd-0.21.22 | 1 
                qt5base-5.14.2 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/41dc2f106cfcced551cf1ae6ea73ee9effe24c7d |     
  aarch64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/1b8ec1902b7b3b8ae27110dc129a0b791838006e |     
  powerpc    |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/f2c5298c8ed6c2eeb0d1be62b54fcba0c4e8e15c |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/06cd07cf608cc43ea8a2fc969c91dceeeb68f729 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/b1f2390a8c5493c0e784946b471b620bd9dce6e7 |     



-- 
http://autobuild.buildroot.net
