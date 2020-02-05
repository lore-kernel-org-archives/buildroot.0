From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 05 Feb 2020 07:18:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-04
Message-ID: <20200205071832.AF83186123@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  4  |  0  | 21  |
  2019.11.x  | 12  |  1  |  0  | 13  |
    master   | 98  | 90  |  0  | 188 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-59 | 14
                    brltty-6.0 | 7 
                 mesa3d-19.3.3 | 7 
                 rocksdb-6.6.4 | 4 
              sdl_mixer-1.2.12 | 4 
              bitcoin-0.19.0.1 | 3 
             bluez5_utils-5.52 | 3 
           host-doxygen-1.8.17 | 3 
                    parted-3.3 | 3 
                apr-util-1.6.1 | 2 
                      bash-5.0 | 2 
host-sdbusplus-4212292bcf13... | 2 
               log4cplus-2.0.5 | 2 
                   mimic-1.1.0 | 2 
                oprofile-1.3.0 | 2 
               protobuf-3.11.0 | 2 
                   sdl2-2.0.10 | 2 
                       unknown | 2 
                     vlc-3.0.8 | 2 
glmark2-9e01aef1a786b28aca7... | 1 
gr-osmosdr-46698a67e7e06419... | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.1.2 | 1 
              host-grpc-1.25.0 | 1 
        host-gutenprint-5.2.14 | 1 
           host-nodejs-12.14.1 | 1 
host-python-setuptools-scm-... | 1 
            host-systemd-244.1 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
                     lxc-3.2.1 | 1 
                   ogre-1.12.0 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
            python-cffi-1.13.1 | 1 
           qt5webengine-5.12.7 | 1 
                 ser2net-4.1.1 | 1 
toolchain-external-codesour... | 1 
                   whois-5.5.5 | 1 
               wireshark-3.2.0 | 1 
                xen-legal-info | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5b3bb89b87929fa2730cdf1873b9c0844d23be4c |     
powerpc64le  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7582d18578f91561dceba3445909324df4e0986b |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d7ba425ea3c656702922fba3f7137370dc0f8169 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ae3f3474accafa0971952b533a66de7e711f3207 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d3339620fc21b12760344f927bf90add3b374f45 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d5c39711642daedc5ccdcd523f0a05fb7a049ab9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/eb3ce52d52926e8f631d8898a8a6a94db76f78fc |     
   sparc     |       bluez5_utils-5.52        | NOK | http://autobuild.buildroot.net/results/a125a27814aba007b06fabe3db2d402684d173db |     
   sparc     |       bluez5_utils-5.52        | NOK | http://autobuild.buildroot.net/results/9a1600ab6b6c8587e8e254e1a9653f5316d3c4fd |     
   sparc     |       bluez5_utils-5.52        | NOK | http://autobuild.buildroot.net/results/2ae2c80168534f02a0c4e2b01cb63a919be4413a |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8381f9723854dd54873c17a955208436c7f4dd7c |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b8ad09e5342f7f7298000c20ef35cc557c978f75 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/efc00adcb6963a514289edbc460636d801121202 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c898790969bb55240d6692eeb473d204d30be1d4 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/43bfbef77ac5fcefcf1f4447570225f2b55435cf |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8261fad2efb9365ff2a2455801c840df04fa790b |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f619b7cb6785a07d629632fa9cd12af1f78e7f09 |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/c2afb6196fdc176040408e16fd49aaea213be081 |     
   mipsel    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/1781db2b8c28641167f7a39a4d799930db13f9bf |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c7041b61ceb2692951c850489b7b7e3172b4466a |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/8ed6243684a7ca0fc8c237440d54781a65637c10 |     
  mips64el   |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/8b7fee91c392ea1c700f5fb366c7cae3bc53ede5 |     
microblazeel |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/e5cd6827db771fa66eceb026e66e1a1885a0e2c9 |     
   nios2     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/4aca85c8fb1e70223011f6e8a7e68e9700083705 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bed97624bad4e9d87464d33dd68bf9b23d674d6d |     
  riscv32    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/316ec0ab4efe6f0e10a9b92009e5484e12dc826b | ORPH
    i586     |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/36959a65972bb565dbb62c0a203b00f267278aaf |     
microblazeel | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/b356c948cf2b22534ca333cfe34dee31371c0007 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/1ba92a4de5022ee7adcb4bbdcfdb7a3477a162d6 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/fac8bbeed534d91edc066536359e5c5cc8856723 |     
  riscv32    |       host-systemd-244.1       | NOK | http://autobuild.buildroot.net/results/534f41c9d97266b49b3546e85e98bf035cedeb2c |     
  powerpc    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/d7ffdaf92b7b85fc0c44e8585ed8301b8ffb1e3d | ORPH
   mipsel    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/54245db83b0c60812daefe3169da09ed7ff0f5e4 | ORPH
  mips64el   |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/2c6338089e8ef761afec22590cd08fe67f6ef92b | ORPH
 aarch64_be  |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/5185d108fc6df6e25aede70ce04cbba5301f96cd | ORPH
    m68k     |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/93eedf9bb30b5a85b311273a8619d9efb77ab847 | ORPH
  aarch64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/87c2cca822ce1069f7e7ae64a71bd5e83f15c153 | ORPH
   xtensa    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/d9a84b642357f758c3f84270fb9a109abd7e2684 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/12769560cf4034be9ca9300362d0a61b3fb45d73 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/1fefe59016e307648597f220e3f46feb708cb1e5 | ORPH
  aarch64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/0c569ec6ea845ad363846bc2effc8ef311610df8 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/7603b2952a3796be0cb4b7c78e200162a33ea9cf | ORPH
  powerpc    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/6968c892db20f7dc015987e2a532931111586e3e | ORPH
   xtensa    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/9bb96c7ce8c6aa034ba4556e8c71c88b2a466f20 | ORPH
   xtensa    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/8fc0e7f2eba2f71953dfb90dcbf6fd004a94c2ef | ORPH
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/962e40fa7e46f7b5a64f616cd2aa6e00bad63dae |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/8fcd5cb912e513ac08a81e3ee726e29ac22212bb |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/12a4db0a33889f7dd8bd5042de2a0250b23743ea |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/c7e617205c766b64c4403d136ec999226cfeb1f3 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/76cfbcf31379ebcf37c9b99271bc428364e8b9f5 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/9c079fb01cdac42c99bce9f3efc306b053f094dc |     
  riscv64    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/ae935aa823b13bc1062e33c429bc52643feb2c9a |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/2f6454c54ba6acd099e31140a6770f99a434bdd8 |     
 aarch64_be  |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/85d3a9df73cfa283328514803526414c7160dc20 |     
   xtensa    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/9999eb8d69be384c1ceca79b3c63debcd3d4e4e5 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/e6aea2239c101ac7791a3856507089711dd8e77c |     
  powerpc    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/7b08921cb48cca70a9c6ea3230cdbec2cb99a2ea |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a9691c98ccd7ed9ab7b758e8e04449d48be0d854 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8665395cecf8bde9c76abc776d88b744f07fb92c |     
  riscv64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/107cffe41081ce46441dec8699d6ad0f152bc152 |     
  riscv32    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f7681415515367b0de5d45f7ef36e2e862eb085e |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/009441ccad24fc3bb660c5146fbac28c418420f1 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/133249d1b0ff2a148e37d9c39a43ff3bd0d37fb6 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/79c64f18e263314a6c3bb1975d318449b8e71d02 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/efa48b03bf2a754c65dd3e24b82ed1d7c41be12b |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/8eeb6bf9e78d474de463656e6626f42e719a2f54 |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/ddb5d7ca0bc9f2942d64db59c59e5589e63dee24 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/8e1f61b4815d42f47ff02c56469361640b63bda3 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/2f19e931f7bb1601efcc268c0ce75108281787c3 |     
  mips64el   |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/fef499d5ff10e4b97e471c8a3cba22e866b5e50a |     
    arm      |      qt5webengine-5.12.7       | NOK | http://autobuild.buildroot.net/results/8c230ae126797835ebcd05143999a910514f0114 |     
    arc      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/56c11eb5eebada3dbd918ba24130c5db69dbd4c7 |     
microblazeel |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d505ca07c79b1b44143e28dc4f3ef999d4907b21 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ab7b2bc9e9653a7093d8b27d4445c28993572ca4 |     
microblazeel |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/22c9909c0d20e3871775f3874f7723910d7e5a41 |     
    i586     |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/a2ec8f7a7192ebd16dd1c250332934dcca0aefd1 |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/4e8487de579aecdd11f742f47809dbc4c35a1e2d |     
   mipsel    |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/6072f226af1df7279c5187b152283c9219490bec | ORPH
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/b2dae67158e0e3934e138ebfcbf8bf8a30e28d67 | ORPH
microblazeel |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/9fa8855163b9ea00a84b24cb7b067e09f78c6364 | ORPH
  riscv64    |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/e23fad0fc855486bbdf6d9251c932ccbca66a9c8 | ORPH
  powerpc    |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/faeeb7bb4b60d0b2c3c6bda939e443c42f4dbfca |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/002020b0460dec8ab1728b8405e7370571c43787 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2f5d40c2afccf55d33d67fe5d73dc79b8f3b7239 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4cdb94094536e40a5b169836cfbfd6e170e3aacf |     
powerpc64le  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bfdd7fa33a7cdf63dfe14f40324b289e2d78a9a4 |     
  sparc64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/9cd203a4bb59a44b3ebec4639f8e217ba1952418 |     
    mips     |          whois-5.5.5           | NOK | http://autobuild.buildroot.net/results/6cd0dd779d72b7162943f0f7dbb4e7d258b463eb |     
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/012d81bd9ac9ed8b67381bfebcb3043d6a2fbc22 | ORPH
    arm      |         xen-legal-info         | NOK | http://autobuild.buildroot.net/results/f7db65cfaa33fc23d6c5b66fc5733183104c9c01 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
            safeclib-v03032018 | 1 
                     vlc-3.0.8 | 1 
              wireshark-2.6.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/975bc4896fde2c1c6db3bd18bb9eb1bd92f26b70 |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/70517cd61c53596102e50f8dec53615fdd7b9d7d |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/2ba028567400698276d98f013d8420c406a54455 |     
   nios2     |        wireshark-2.6.11        | NOK | http://autobuild.buildroot.net/results/7ad283565639b906a42b36c6ec15c19b11f882a8 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

            host-mfgtools-0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/01f8e38cbd23cdac35f6c299683d4b13b5b43539 |     



-- 
http://autobuild.buildroot.net
