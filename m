From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Sep 2019 06:17:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-19
Message-ID: <20190920061736.EC46186373@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  0  |  0  | 15  |
  2019.05.x  | 20  |  0  |  0  | 20  |
  2019.08.x  | 12  |  9  |  0  | 21  |
    master   | 88  | 105 |  0  | 193 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.62.0 | 58
            wpa_supplicant-2.9 | 8 
                      icu-64-2 | 6 
                     apr-1.7.0 | 3 
                libgdiplus-5.6 | 3 
                snort-2.9.14.1 | 3 
                    ffmpeg-4.2 | 2 
                    flac-1.3.3 | 2 
              iputils-20190709 | 2 
                       unknown | 2 
                 ytree-1.99pl1 | 2 
               acpica-20190703 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                libcurl-7.66.0 | 1 
                 libdrm-2.4.99 | 1 
               libupnpp-0.17.1 | 1 
                    mpv-0.29.1 | 1 
             openjdk-12.0.2+10 | 1 
                protobuf-3.9.1 | 1 
       python-matplotlib-3.0.3 | 1 
            python-sip-4.19.13 | 1 
                 python3-3.7.4 | 1 
                    strace-5.2 | 1 
    xserver_xorg-server-1.20.5 | 1 
                  xxhash-0.7.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        acpica-20190703         | NOK | http://autobuild.buildroot.net/results/ef2e2e343c1509739c4c3dbed1432b4437dfdca5 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/d107587fbcc71813a832bde8232e2b97f5d05eb3 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/00084131c3e0bb5a67a0f167832b73b3e1cff4fd |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f4c4218a7564c2fb2fc6759242eea97a9bffec19 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/975e93d190d99090f06e2d75cea371e81c32f7c2 |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/bb9bfe1283e46cef1d5095151f87e690cc7659a4 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/0656ac239af6b87433ae8d5241dad7e0c98e4319 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/d2c516e194eca5e7a5ec4d12030c0279d7ba2d64 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d7aac31723bdd37398835d21f2d8bb2c721a3881 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b3d653b5d47481f784493f6c4e50e566327b38b8 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9e94b19a03c392920277e71121db0d117aa0a0db |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9aa79f03e64229da177b23e95da6fc6d8ab7a55c |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e63e68b5d7904a59db52bad3feb6a4355d064040 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e0a7ea865814af82f1dd6cdd7e8f09b66ca2b21a |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b56015c61668cd9f7e3e74cbaefe705db141c42f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9ccfc778999cec479fbe653c5daca916fe71596c |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4006144c2ec9d5a7a1fd58aadc19f39849f4b583 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bd10f8862859138a66fb30915b22d12d12c65439 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0d12847c8011ab8b55292e14d96f7b63d6ff5089 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/66fc7935f99764c40997526351f50ca91a2329fc |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d103e1e68aced339a27788582cf22242a87339e4 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/114bf4c13a3dcfc79bfb981e8ba8b7d17156fb5b |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fcfd754f9d82826958d06bb6019a9cbde7f61269 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1d656cc6656587d6c9003f29faffcba62648006d |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f0ec0b8be5c5eb443c2bd5b2fde176de636cc478 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c6216e2cecadb6c31944fb20031814c91ad3f437 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f7726b907657cfd38c44ca3ec69d62f42e1cab54 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/edb2353489397bb2157295761ccdf57ae89543ce |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/36dd5062f25831143632d9d80f3b717f7f7d9ed9 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/49d6b2aa8217cfa001e735e1ad03a652ab8bf0f2 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ef0c533d93a993d87fc36355519b85fceb6777f2 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19300ff75451444c32b8e394b073e2a4e5a4df3f |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0c2f5019243298223e47affc8c220360cdc72b24 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4818225eecd308ceb8016882ccf2a174fac725c3 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b233f3dd62e97945529dc1db80c036a35d1f1a23 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0872e66aca906669d404a5d301412301009fd856 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7c1785aed0e17cb434dcdfb3677bd2a5dbe1ed06 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cc5b3623d4599e0362dc025a6910a2a10d3e71b2 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/10d81bac032d4ca5a344151a1111e0923b20e101 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/10098161a98e7b8505eb65383d6bddb43e01cb21 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ba07c6deacf683262f971f45574c13bc7cbb5e54 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8811e01e9edb271745c9ae4d0e4d62cf7b3b5dfe |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/87381cf3a28e90d9d841d4cf579fe5d47e4ea491 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5f822963ceacf83692090659502aa29692ac5a40 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6e5d720af4cf36f5d9ee5ac7097260970d5d68c7 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f8dc39b0eb0a2dcef7f9108cc2893a9c48602a72 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1fcd910dce4f34e0e6f2afc4040a76738b1fee6d |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ae417f3f5fc9228337a5e429f158cd29dbdd0f54 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ff7fd52ae15e04da4e4c075d9f0b8b36467c8d0c |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c421ee7da0f47ea3a9a7c9c50c687646c5039f57 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/da7daa9940a1995cb2ff3360904c42548df599ce |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c4b11e4918f15ddb617374df400031fb7cf2e218 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5816268d30ba3eb3ea3b68ac1bc92cdb5c7c0b41 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/24b50842e05bf0cef9e3c4d5cdba49b4e141e536 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/42037cac9ccc133f5e13458afc491004337e3042 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2eeba7de4d2d75b9ef6c80f42b836682bb10da64 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5d33a7d98c45a98d1a0a859e15295e3b5080d30b |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8d54f94ca70d37513afa3f54befc330f6392f21b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a30ba5155f8a428c1939bcf6e719c426ce5e0c32 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e21746d5e8817faa6e9ce6a39eed9b3212134807 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/adc21721a0d197a645556f367bc6ef50be4ecddf |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/859f41d933f0dae3cd99d8cce4b56e028b4dc2ce |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d3d4c6bfd71789a1780e3688d6b6682b44764346 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/10520c3e82920793695490878f321060fcf53b4c |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b86eb2bc45ac3e6a78ca41e5b43807ee326c57b2 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fa5e18ba304d1e76696193a42afb32c4f9be3782 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/e3a0295e3fb187a4cc4d942c879bdb543c24292c | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0780c9de3fd2dd417a6da0e2d0059e83da0abbf2 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f9ab3a41298aa2ffb457a8a596b347029f85e3b3 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1a64dd7f89955d0f8a326bd7b52d0f76e363bc3e | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9f88a386c5a263f0a68a965599a48496b60af464 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/f8defc270be604fe51f3a21383aa2a8d8f59e9b1 | ORPH
  mips64el   |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/59e8da610f7fd3763a4becb08364be2cafbe50e8 |     
    sh4      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/a83f64b68ed4a91f66127946131d3c431264a6af |     
microblazeel |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/4a674419871f57cdae53dcb7e07244b4db3175cf |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/bf8b2e0a5c5fe29cad19ec59b095e75fe78d4d4b |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6fb3897b5bbbb6825121c8bb01bb2aec6114ab96 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/2426c49aee29c7906da0823fb7b12bf4b00b1a8d |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/0ab48c8ab92223e76a26a800917b8fc9a66bb6eb |     
    m68k     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/76de6e1987e643b94bf0a9dc83d055f8afb03608 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/380ea5b05a8ee91a43d6be4b536ec2f9c515d988 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/af911880c69a7675b99214553356430c1d3412bf |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/239f5069dfbdeebd0074c0143e343fc55a1cd5d1 |     
  riscv64    |         protobuf-3.9.1         | NOK | http://autobuild.buildroot.net/results/2cde47997c9a65043014e363a8819142495c098c |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/6d78374e138badda90fb5a0104671900cbc11f17 |     
  riscv64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/d36911a07e515651cf40d59f21565927b2be15e0 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/0d44d9c57b9136c3a887bc546255c776fc00d292 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/7a1b09ee08c2ea63a35e180bb920a0dd38c3b017 |     
   nios2     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/39d57bb926ca2572e6e2840b59cf8fe3c7732508 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/4a9db4dead33f01d60722ae9f204b08a9f914e35 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/e3b567b88bcd5e98fd26eafaba808b9b480fed43 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bc04a11866812c7cdb3408ce8da354adc6d55515 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c4e6ee2be87d055cab881f54c4ae8d82d9cb32ee |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e8c66518235cae7eab4acddcef01067741fbdd40 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c67cc8b4799e04e82a2f2496792e720edb934669 |     
 aarch64_be  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f4dc5f57671ffbb2ddac5763bfbb1174c5df689b |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0ea554ae2cbd47e9136868af41753c459ddf85cb |     
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ff676b42c93e295d297bb98aeb4ae075500ef932 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/708c4fd5039a440a96f345661941ddabca2bb001 |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4a648799b4eeab85815690f21a1d6be6cd785078 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d7ba36121283f8af3ae803be90ac5d0cd831d09a |     
    arm      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/b7c49525277ea1ccdd7011ab9295f6bf4050e4bb |     
 powerpc64   |          xxhash-0.7.1          | NOK | http://autobuild.buildroot.net/results/7db5369e72b072cb0b4e8f652153ec1cb71fa79c | ORPH
    or1k     |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/5ad00facd5ef0e64c636e49a2dd1f0838a874f82 |     
    m68k     |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/d124a4423c69358166dece62be22feac1714ae06 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 2 
                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
            host-mfgtools-0.02 | 1 
                   mimic-1.1.0 | 1 
                snort-2.9.14.1 | 1 
                       unknown | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/47f9913faec3f802e20666a6521c6af877da0865 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8093685527e1d9975ca88143cf86272e1582da54 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c8c1094817474d61201e2d1d85f7044ef54fcdbd |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ba80ca8b72d08dab01ad469d6bc200ec27fb2a5e | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/baaafea25c4b1e2c983081c4676acd146237e2a7 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c5a49eb222c462be937995aa922e9c3f5ddaaf65 |     
  powerpc    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/40d425fc6b06394c847d379a9d348eb554f7ade3 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/77d7928c54fb5fd4707bb2be2a08a0dc6de52953 |     
   mipsel    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/9669d51265b4d37ddb3af5b17e78cdf47e58b1a1 |     



-- 
http://autobuild.buildroot.net
