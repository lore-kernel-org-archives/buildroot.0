From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 07:13:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-26
Message-ID: <20191027071310.94D0986E1A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 37  |  3  |  0  | 40  |
  2019.08.x  | 27  | 10  |  0  | 37  |
    master   | 155 | 177 |  3  | 335 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 42
                       kmod-26 | 26
   jitterentropy-library-2.2.0 | 14
                    brltty-6.0 | 13
                    bird-2.0.7 | 9 
                 mesa3d-19.2.2 | 7 
                libdrm-2.4.100 | 6 
                      icu-64-2 | 5 
                  cmocka-1.1.5 | 4 
              libgeotiff-1.5.1 | 4 
                dtc-legal-info | 3 
                  flashrom-1.1 | 3 
             libopenh264-2.0.0 | 3 
                       unknown | 3 
           host-dtc-legal-info | 2 
              host-grpc-1.23.0 | 2 
           host-libselinux-2.9 | 2 
                  leveldb-1.22 | 2 
           libwebsockets-3.2.0 | 2 
python-libconfig-b271c3d9da... | 2 
         uvw-2.2.0_libuv-v1.33 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                          grpc | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.31.4 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
                   ipsec-tools | 1 
                libcurl-7.66.0 | 1 
                libgdiplus-5.6 | 1 
                   libnss-3.47 | 1 
               librsvg-2.40.20 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libupnpp-0.17.1 | 1 
                  lksctp-tools | 1 
        ltp-testsuite-20190930 | 1 
                   mimic-1.1.0 | 1 
              mjpegtools-2.1.0 | 1 
                  pango-1.44.6 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                    sdl-1.2.15 | 1 
                    strace-5.3 | 1 
           xlib_libXvMC-1.0.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/30255e42748c5cbbc9286a7931beb5106ded600f |     
  riscv64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/c97639a06aba853c8a024bc1bc404666ea379ac5 |     
  mips64el   |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/46f9c11e0386d19b0afe52a4e5667c62e7ca4827 |     
  sparc64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/9b3c8a59c1b7f570b771c30f880652dcf2cfe13d |     
   x86_64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/181ac70dbf175beb275d37af7f20031e98d860cd |     
    sh4      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f45c94a115afd1cbe229eb6b1e66940f17d98e3d |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/08213153736657fd4b4f4183063da753c5a7a8ce |     
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5b4a3467463477b263fbe01c4aece6dec1173afa |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/d8bf353d47bb595c27df2c5c8c1121e2dd1ef1cb |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cf288818697efa787930a23773e83389ec74dad5 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8239a2eaf725e08c3fc6d9289f78478c0c7b1c52 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1372834a9224668cb53d56698a610bf5c8289fab |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7afbb887b4fa83c5066486292a710ed9e46b968b |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/258eaacefb32feedd2de9a7d940f4ddf37d2a6dd |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8f30a2d70246637c90cc4d042a5e8b10adef105b |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3f2633bbef6c99408dea4fefc140416784ab7160 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/df25fa08fec989a993e87aa76ee6829d58f07434 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c0c14cde684162341588bf127bbfc465d1097ab0 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f8903157b46f90d42ed9367c1c6fcd413ee4b8da |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/97460376ba443d2167b1b0347a8d1e95082b7054 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/af4899c52d65d995285567bfe7f45693151ecf5e |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b73b31ba419bec100a27a7a808780441768cbadf |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/e8453f26b1800f677458c808685500d756406fd8 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f8cacfc6d196ae2671fd78b79b9a903b8bdb1bf6 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/ed1bfa6ca4b82bda6e2e8029c748b69bd3164e6e |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/cb03e2154917e321e689d66b0974a103e89d0b32 |     
  mips64el   | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/dc6b40ede15969f573136252832a41ddd4dd3c17 |     
    arm      |         dtc-legal-info         | NOK | http://autobuild.buildroot.net/results/d3db8ddc096f09bb1728a0ba40b925fbf49c424b |     
    m68k     |         dtc-legal-info         | NOK | http://autobuild.buildroot.net/results/3652b2f3649f46475864215840f4c9f67a970c66 |     
  powerpc    |         dtc-legal-info         | NOK | http://autobuild.buildroot.net/results/538c0d9287a017b3c2b4c49aaf9666808f0e5d33 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/96ffb02ef6dbb6522a7b27447e3fd9f0649c16e5 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/63c0655741a4328e7aa46f2ce8a8ba37f470c36b |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/84c365adf8eff0221c997a2a22916b37c376d7d3 |     
microblazeel |              grpc              | TIM | http://autobuild.buildroot.net/results/6f301904002cdd50dc3a66fe782b04a05b116319 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c0e425ccf5beac36d9bb8e8fdbe74a6ad14e161b |     
    arm      |          gvfs-1.31.4           | NOK | http://autobuild.buildroot.net/results/486187bb7b8800f44a8c173af518b84e68e53584 | ORPH
    arm      |      host-dtc-legal-info       | NOK | http://autobuild.buildroot.net/results/5e6d442f2aa64a6f8b49cb4b660b4ab1f0c3899d |     
   mipsel    |      host-dtc-legal-info       | NOK | http://autobuild.buildroot.net/results/df4cdfe54083ec81d244ab677c091c6ab92c4b76 |     
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/535538a5db003f2d6fb8484c16f555031083813d |     
    m68k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/c1ce2b6e224a79bbf07765d78283c56c8ae86f87 |     
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/56c8a18a10355159103b50c86e55d36296aa749c | ORPH
  aarch64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/8c0217b86b9c3c9ce414407a9497e9e8d0aa8ed6 | ORPH
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/5e9fdef7c58c7a2a92a040df6b581a2e4b9262dc |     
  aarch64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/438025faca1d48fb6ed86822ae2458fa8a989522 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e4650307b294eb6ab89d4fc2ba12644212fa4c91 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/fa5288e5bdd7c296a780f7d56a067f07b96a5f84 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e2072a35e70277fd93afa71717407f8162141083 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/737d966a856005adc33b6f55c4e07113f9a7d7bc | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/dc67c742b47efea84e00d7e986393f6b53f4a36f | ORPH
    arc      |          ipsec-tools           | TIM | http://autobuild.buildroot.net/results/c257e255db084812068ad22c89b8d7b2888203b0 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/7ae95954ac9c872a0a55275cfb78f09256b78930 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/c53481445b68ce30ddab4afeec586f46622bb728 |     
   mipsel    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/3d789e06d32c1dadd4b846149b23a34c2e4f8c3f |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/3ed74c487c5631a302359887dafdb7b66280e19d |     
   nios2     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/9a67ee41d39671c3fa26e71f3b4d5baf800a53c0 |     
  aarch64    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/c106464bff00d307fdf9742a214ae578dc0ce9e5 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/084d4e78ebe26221301135066366e3f314d3de92 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/e75c213f4edf66eefc390dd312392746b9d6a288 |     
  riscv64    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/cf509ceb877c3e5e6e91157605967ae4d6afec9e |     
   sparc     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/d802254bdfe5a225285eee24991a0e1f5047ae15 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/a5dd710c222a02520d75a7d3a0db9b3ac46852b1 |     
  mips64el   |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/41f86f8dffa17d24b46ebd1a82cb3d90d90459a8 |     
  riscv32    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/4a520c91fa909c40330f55ae64b52df7442994fb |     
  powerpc    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/203d315edb4a59e9e1dee466efc1585b09b05088 |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/511e22b8dd79b9c81c26585ff03bf4c073940c9a |     
  riscv64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/1a89d33724f592a908fa1012d4b144b92358e323 |     
   x86_64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/5185deba0c18072928a0a6867f15f77448228b0b |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d78117b33892ccb8b0a732c92df3e486871d7daf |     
    sh4      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/91db0f384c9510b32f4a4414790bd0d8cdc3c0f1 |     
    m68k     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4af0491cbbc1fca426cce8fdbe726eb9c39ff872 |     
    arc      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/dd301336bcdc3e8d1779b75759e702de98e859f8 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/2620fa9b1c5513235dc54408231f618e03b21639 |     
 powerpc64   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/52dd8e12c57b697301dbac7bbf148fc3f3b9129b |     
   xtensa    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/41dfb7c876e52ebcae10a05912dd2b4f72d752bc |     
   mipsel    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/25f731b90e6b21b2a97fed588238ac75b17859ab |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/52f875c638c7394735e95e442793349283791434 |     
  riscv64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/81e8e7327d577d07528e65262e1190277e8e0716 |     
   xtensa    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/837606ae922ef7ff527e5f44a1eafbfa7a469c56 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/8c867939e74f4edd0334f77bd77437fa0896865f |     
   x86_64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/3cb94465d3014d0785a147635069899147596294 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/7fd7df2e84094abe584d6bddf0776a113f8231a0 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/e2bfdb462cf843759f8c7421212227a42ce0608c |     
   nios2     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/8289d3db7ff3c9a3409b01bdf3766c3b3cc34452 |     
   xtensa    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/0877bf982f6aebdbdffa077f5806328d69c1d74d |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4adc2e22b571c89083daf21ca576d36fac8e6ba3 |     
  sparc64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4a05c6ac8df1619d1f536270c25c6776afb417da |     
  powerpc    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/cb0da67280cb975d74969d9633476e262770eae3 |     
 powerpc64   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/49545c2c78afdedce3324782b16956b462f2bb58 |     
 powerpc64   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d3c4b4f1090fd73f9533a184033c9cc339ce78ad |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/9cca008ff9424b24b4b189ffe0d5c54db16ff6fb |     
    arm      |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/2fdf1029d2e774c5cc6781b07418f5798fdad233 |     
    arm      |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/4ac8fbed79307326086ab294eba9e68cf208e6ac |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/e905b0c6c473f938283d1af763db0114124b5f57 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2235a22afa0e29a3608cbbccb5f90ee5246c3364 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/51c4948cdc3b29244cebb663767de4d4b38fbace |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/5ce5da4acc22d61fa8621b70939bb5495d6d7838 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/02d2b5eb1f4c13cd8c12eddee6554433695035c7 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/ef42445e82c8f558a7fbd0e73736a0626b867543 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/ffcc212d80386aa5f6ab1df0e1504ae43d117031 |     
   nios2     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/455b7238ca3d68229849a5e8b4acbca9447ae21b |     
    sh4      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/2d09dc18f57903876dbe214792a557410c7a47f4 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/7ded9baa4379700a6553173ea4f4fb70c86d77e2 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/0139bf277f705f242144d38624e868d0b25852d2 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/a0760d7fb2dcad486e1525a6b392bbed5df4c1a5 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/6cf59e12fb6829ba505de61f1c966bdaece968cb |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/081c0426dde94015f5391e612454fc0b86888943 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/97f4cb8b00bc079ab5b7494ebf1f862d0280bfba |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/1659cd291b70e89c3020afe270f998c79facaba8 |     
    arm      |        librsvg-2.40.20         | NOK | http://autobuild.buildroot.net/results/9fb04aa7761845a58df14d460b4a7bbf426e19ee |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fefbe88480a536cda5a3a6b10e89c01f4f87dda1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4488f6c7936e04f79653bac2da14c4b7beeb7800 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cbfa2f973f91a30280e4d6378aca6b27f576de46 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e03fe89204db5886d50860ad6dd69be292d9e173 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7d3bbfec7ee3f5e865f12fc34c80ef7da817ea4c |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d4a38dc05d485aa5bdf8a369e0f689242f334508 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/87c39e709dec459750cc4faa6682fcea60a6cd51 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4aaffdcb462de1ac0636b2ae929088c4c4fee29e |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/effe7f1f8f54ae714265a23bbe68dba6c16008f8 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/979d149ebb09f009cbb2286d2efde0d22bda3642 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b445fbd6910ef5eae838a9623250e4e3a252a213 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1017d95c28af9134be6c439624a40dd835b926be |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/270f6ce42935e2f49fd0d04912ee328039cb22e5 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/38a4fff67f9e6e6120c12fa56ca948803efcf371 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/48a7f2a547d4305972fd9a414f4773c760e1278b |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a9eeb0de9e56c3f3dc68ce052be5162aed85edb9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/597cea5d6274e703b4683b18ea3efa7baa8c46b3 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e249285ad61516e921100791eb552ed0c546f26c |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1b19e2d93b8fe95b967bdbbe4150cca4f8b71725 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b2c13a80ee0886dc13dec7b6cdd21f61d5fa6770 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a000cbf45a00888428139237e3f571e247a4f64a |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fd027c57ee42f3a6aef3ae2694920e501d330340 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4aace5d6be7cab35d1a5353122be91038ba9781f |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/31c55db1506096a41cf6f4e2195d1f730e2d181b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/211868569517ca9eccca6bd354aab0655f3ac446 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d303cb39dd0d12b9376c5ee4cd4d6c1fb4ba38c7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ca1c30452325481f5e62e8c1828c73674b97d1a3 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6c7b456f761b331702eadf3b988b5fa8f8eeae28 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/60be96891eb167e3c8496df34bd59212b6015ab3 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3786f9be056b5ca15065b7e4179b6c43e19d3631 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0bf654d5471fd7ba9cbe02b2b72381c57f460fb5 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e10a55ec96002d40470fde022fd842acc7c2e182 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b72e041ce57444566f120e51c9742cb5c89f91e3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b0c9533e4a7b68618a4ca355118469432837e5a7 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/124f57f61bb476e4e1e18964ee954d961622ae54 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5ba5e0ceb2d3c48335038306e44c4d11ad7a9cf4 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6da0e6cae7d7b246265919a85f9341b46aca9cea |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8ef2b8a4c7906b1f795c0bdf4ebd981848455e4e |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/83fa3c63ae02c8097c52212891ff28e1180cb652 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6306a270004595f85c425f88d2fe06cc194df844 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4fe43d22ad36c2163cbad56b2577b2f7f38e2f73 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/71669ef9c71943df99bc30389548cb3e1a29a104 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2aeb32e7521b973b7d74603ccfb57b50d317f8cd |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/64e782cd72e5725a9f05a96dc1cd390c69db22b9 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/d4ae4cf3c9ddf5ff63e7e8df611e78dc18da4d04 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f1e72ad24bcb33c5ea9fa6d2ac4d88ee3ac36511 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/cb85a4fea38153fcb92d22ed9150f43e5e8c4090 |     
   nios2     |          lksctp-tools          | TIM | http://autobuild.buildroot.net/results/0caea0a3ca5e0b1083ad9050f042ea369c0d0037 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/6ac40f61e686e03c9821f5590f8f585cc79b179a |     
powerpc64le  |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/fcbd555fb6081ff978bf31ee7eba42332a68701a |     
   nios2     |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/ad329c9313015b9f372901bb8719ba0988a41cd3 |     
  powerpc    |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/515cee01cc0097eebde2e404c3071109064922fb |     
  mips64el   |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/e31caf20e756ffe019e2162034bbd02fa5ed557c |     
  sparc64    |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/23a8a06a427cf35c75866fd02bbb8ef5a7f15178 |     
  aarch64    |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/97b87ad4f56c94fad0f3558f79b17dc798a7f5ca |     
    arc      |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/2c4032765823055cac73080bd24d8dd63a419ab0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/368b35f93ea7ba77957e519072659a8c4bf61a42 |     
   x86_64    |        mjpegtools-2.1.0        | NOK | http://autobuild.buildroot.net/results/b1252b7907944d227694ad8506de25881bf2ca04 |     
    arc      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/c17bbb12d9deadd64a441b36e324cfbbe8aba5be | ORPH
    arm      | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/301f8da909eeb700c50a8c85df4282794da1d8d9 |     
    arm      | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8b2e0c66d91da937ddaac748c4af82686d94cd85 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/6e736c1b0663d98a7655d2aec880a3d34b68f763 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/466e62e4fecc1e049919ef79dc4e3508effc8d57 |     
    arm      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/94b88d5ffe8c686e698b2dfa3e94fae546767e8d | ORPH
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/5cee4546cbd935703853a83fea5e4ebc9890e3ca |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/533ed7e6ef61c6e86f8c82abfc8b6047ce9ecedd |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/7b71c82877f95e70e2f33c12ddb21e61339407c3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cca63749b9c3bd86e4fafbe7b690623085b6ea18 |     
   mipsel    |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/9c61c06142c832a9669afdcafcbb8b1f7df51082 |     
    arm      |     uvw-2.2.0_libuv-v1.33      | NOK | http://autobuild.buildroot.net/results/ae96b7e79f0546fb3e5bcde9bad42da6901fac40 |     
powerpc64le  |      xlib_libXvMC-1.0.12       | NOK | http://autobuild.buildroot.net/results/3051f4fbc1ab725de542a550e4f9eeb3cae385b8 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.8.7 | 1 
                   mutt-1.11.2 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/01e17b739b5cbdb1a74095e235623916b2bb16df |     
    arm      |          mutt-1.11.2           | NOK | http://autobuild.buildroot.net/results/29d8f1996958ac59911132d046ebf696abe39592 |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/9f0d6e844d806c36479521cfe265fa66391aad1a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 2 
              host-grpc-1.18.0 | 2 
                      icu-64-2 | 2 
                  flashrom-1.1 | 1 
               libupnpp-0.17.1 | 1 
             qt5location-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a55467a7463c85f340e80569ac172eb29c3baee1 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b54df45ca47fd7164fabbfc0cfb35efd3a4fef30 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/859015fe2774669bd6c1d271f5019c76302400ae |     
    arm      |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/a09067dfc55d85e728b5e38b55908e7b3e76d044 |     
microblazeel |        host-grpc-1.18.0        | NOK | http://autobuild.buildroot.net/results/70b3578fa75191f9342817358673f6b61e0e47ed |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/22230187dad39fc124be0bed39e03e600855837d | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5fc93fbd81d9485b343636e8c8cba54097f92576 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/7451bca6beda14f92ed84383842fb9b117a4f112 |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/cc20faad87fe9eac4d992b0fb2eaa12ac0ada3e1 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e233d555948bb6a3ad99aef6670b3933d76638e4 |     



-- 
http://autobuild.buildroot.net
