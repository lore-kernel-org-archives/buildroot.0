From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 06:17:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-28
Message-ID: <20190929061737.3832520472@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  1  |  0  | 20  |
  2019.05.x  | 16  |  1  |  1  | 18  |
  2019.08.x  | 17  |  1  |  0  | 18  |
    master   | 176 | 62  |  1  | 239 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             xxhash-legal-info | 15
                  ffmpeg-4.2.1 | 5 
                    flac-1.3.3 | 5 
                      icu-64-2 | 4 
                     apr-1.7.0 | 2 
                  cmocka-1.1.5 | 2 
                libgdiplus-5.6 | 2 
                 mesa3d-19.2.0 | 2 
package/xxhash/xxhash.mk:22... | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                    bird-2.0.6 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
                     gzip-1.10 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.16.3 | 1 
                 libdrm-2.4.99 | 1 
             libopenssl-1.1.1d | 1 
               libupnpp-0.17.1 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
        network-manager-1.20.2 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.4 | 1 
             qt5location-5.6.3 | 1 
             qt5wayland-5.12.4 | 1 
                        stella | 1 
                    strace-5.2 | 1 
                suricata-4.1.3 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/809db938d58fc0ec7092c790784117f0b5dc1cf5 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4f606c4f209cc667f404df0a0e2e0ee3e9a70620 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e913b454c0e200d9928ebc2e1b01f1afda936b8c |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/08a21b22e9e1ba291303cdc8f820f6db669d2ead |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8b728dd54c3d846ef613338bdebc8f960f7079bc |     
    arm      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/f270d32c00791bcc1e18a79c8a5336f49d28f0f5 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/68967a320838e3326780138709ae7975fda9fe8e |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/9273a8528c24a40990adb268bf1788ef9645322a |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/e66de93054fda0f09bc52e7af4578dbc64f3a583 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/70c237a11fbe47a7b37f5b8f2b8b463509171517 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/82be30b0147ccaf1f7892fe9ad906e9c7af35d81 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/53950406b48f194cfb2ab0d84153c72b6e08a95f |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/3ef5ee5cec6e25be382b542ac77be78189a9f4a7 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/4561c8bb78d978c2f5da5da536aa9d6a05c1d48c |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/8b1938cd867732d2a7ff7c25c478e57cab23ffa2 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/d48c055b20bd2163df059e672f5529099369b2b8 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/9cf8915b0f5231decbf4d2e49189172f7cf41e6d |     
    arc      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/01b7374a5b7e66f2c369c7f93dae68353a3ffe81 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/fe158860b5df459a91efb11d30bc83ad4920e495 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b41f5ca2f6be239fe858694be548f5f338526e21 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/a039625a221e00965ca0483bca4a826b0b6feeaf | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/a546b171a6d25e47b321a78ef0484fe9d5b0769d |     
    arm      |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/cde259271ec3f9cc925583611fdc254ecc910805 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bc4c21f74716130429be9763f09e0128ec921356 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/6444bfe50cf25596b5ea418d382c36812911b14f | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/915441abd7ad98afbf68985f80ec89772c333926 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/b4d098e3ebf42250da34cb27b832cdc43f865410 | ORPH
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/63a8a2c2cf4af7f946aa0683b2383da7be95e08f |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/075f3579583debde2473aebd48640450c11a7764 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/8a32056850d43f805844d4334f5e595dfa4e77f2 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/fa7986425d098328b408c9aaadd03d40bee80cd2 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/42027d2c8bd94f7cf7c1c56fd88d2bf54f735e86 |     
  mips64el   |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/a402e5c9bae7ab20de194529862201e7486bb2f4 |     
    mips     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/37fce69751aa31ae467d502e660d7db513333d4d |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/bf3b6f9f6ef39b99842b3c92495b7bf359c68158 |     
   nios2     |     network-manager-1.20.2     | NOK | http://autobuild.buildroot.net/results/abe2522a26dc194f0b28374226080d7fdb518e7d | ORPH
    arm      | package/xxhash/xxhash.mk:22... | NOK | http://autobuild.buildroot.net/results/feb48275dc90f599b5e6d5e09651eaa5a86a5806 |     
powerpc64le  | package/xxhash/xxhash.mk:22... | NOK | http://autobuild.buildroot.net/results/1b4b4e35d3df888a7cd4765e29b44cca14285b70 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/4a045296375aa488dfabc48b24d2ca2060d50607 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/b71b0d180b1c0822dfcab58e82800e85dababbaa |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/adaa9b4bcc6f9d2b5e82c479859a07e8abf5cf13 |     
  aarch64    |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/c5ef2fde31fe330e60554180291b5996ca26f22d |     
   xtensa    |             stella             | TIM | http://autobuild.buildroot.net/results/c7aa4aae6bf68c7878b10c5b839c18d1a31e1b06 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/973f36b3fd78cdabb7e29aad3aa721d1df2bcb16 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/fb06dec86efbba901d1075533265050ab734b1ba |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/24a101d74f2ed5ba591c4a58c25c9ab6d53d6248 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/8bd01146dcd568111df0e40c3abdbca46400de96 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/171e5ef034c33feee0f239cb1c79e6ff34ff7350 |     
  mips64el   |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/6e892ebdeadcae801d8f9c1082ca48411ec3add9 | ORPH
powerpc64le  |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/95d06ff81b17452a1aed4ad7c0ccd64cb8f07ed4 | ORPH
    m68k     |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/cc352d60871b6345c0ed875b4ce22ed67eece8a9 | ORPH
   sparc     |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/b3279718116e4e87c6a1c62730116a49cbabfc7e | ORPH
    arm      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/7dfb7c7a9a6121a088311f295f6ae8a545b58b97 | ORPH
    arc      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/c73c187c8e2dc8d1177f4f5abc20e5b8bca15bd1 | ORPH
    arc      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/2a8d46ba2c14a15db63aee0f38fca2d54ccca574 | ORPH
    arc      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/f8d934c3bda479f9a83da78ed2610d9d408f5d3a | ORPH
  aarch64    |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/c071ae8b29075137f1c1358dc3c01c117634d00f | ORPH
    arc      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/49549bc8a305554e28f2382847778ea6f5357648 | ORPH
   nios2     |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/3b15369ab9fb33bd53f5951f1693bdd3a195b446 | ORPH
    arm      |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/d02257682648c32240db09810b1b9ac4e3cf655e | ORPH
   sparc     |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/6346098dda8b2d14b345762ab017768e7d349887 | ORPH
powerpc64le  |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/25533b4e5b2f9cc7b1a5ad09c1bb2c0e87b1721a | ORPH
  riscv64    |       xxhash-legal-info        | NOK | http://autobuild.buildroot.net/results/11ceee792ce193162fc5140c7f77340dcda14ced | ORPH




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              wireshark-2.6.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        wireshark-2.6.11        | NOK | http://autobuild.buildroot.net/results/90c40814272440fabd121a857ce147f5b091862c | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

          libtorrent-rasterbar | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      libtorrent-rasterbar      | TIM | http://autobuild.buildroot.net/results/e10f4d28702292c4656c1c2b02ca64c39f84b50a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2aefb998c2830417209eaec1994e3b2a1eb8b67a |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgphoto2-2.5.17 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/88b2bde8cf056dd453feaf3cafb095f82b8dce82 | ORPH



-- 
http://autobuild.buildroot.net
