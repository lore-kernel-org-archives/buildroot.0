From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 08 Jun 2021 05:49:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-07
Message-ID: <20210608054954.220C483B64@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  8  |  0  | 42  |
  2021.05.x  |  7  |  2  |  0  |  9  |
    master   | 127 | 72  |  0  | 199 |

Classification of failures by reason for master
-----------------------------------------------

                    ffmpeg-4.4 | 8 
               host-qemu-6.0.0 | 6 
                bitcoin-0.21.1 | 4 
                libsoup-2.72.0 | 4 
                  gnutls-3.7.1 | 3 
        host-sentry-cli-1.57.0 | 3 
                 mesa3d-21.0.3 | 3 
                   rhash-1.4.1 | 3 
                  botan-2.17.3 | 2 
           heirloom-mailx-12.5 | 2 
                mono-6.12.0.90 | 2 
                    mpd-0.22.6 | 2 
                 openal-1.20.1 | 2 
                qt5base-5.15.2 | 2 
                       unknown | 2 
                apparmor-3.0.1 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                  daemon-0.7.1 | 1 
filemq-8940f34e0f1c8f25c1c6... | 1 
                    libbpf-0.2 | 1 
                libkrb5-1.18.3 | 1 
                 libpsl-0.21.1 | 1 
                libselinux-3.2 | 1 
             libsndfile-1.0.31 | 1 
             libtorrent-0.13.8 | 1 
           libvncserver-0.9.13 | 1 
               memcached-1.6.9 | 1 
                     mtd-2.1.2 | 1 
              netopeer2-1.1.70 | 1 
                      pdbg-3.2 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
          perl-dbd-mysql-4.046 | 1 
                 pixman-0.40.0 | 1 
            qt5location-5.15.2 | 1 
            resiprocate-1.12.0 | 1 
                 samba4-4.14.4 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                    vtun-3.0.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/f5c4a1fb4d7ce9d5c3019df0d5c7b1c8f92ae168 |     
   mipsel    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/fcc7a4882baba7ff661fbb184d7c0e7ac74556f8 |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/6ed952dbc348c6524deb91bf7e32fabed41b02fa |     
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/bd33f556e9075c03a0c321692e63d544d132abb5 |     
   mipsel    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/419c907764fe800c22b7d442bd57d84afa6d7820 |     
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/3dc5bb599f5e1add574bc9b91ae3a59dcd367680 | ORPH
    sh4      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/5f19c33c956aa35cb2856950f12852443f3391a5 | ORPH
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/41a7643356cb860deb150c92236b9b6270a9613d |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/cc49c2b59274c5af53ac98c9d165756db05fccc1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/739fd7c6fef657b41f91b60b2872854424da4ac4 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b30ee745bf8f57f22962c76d74e77146501f3c42 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3fabb4dcbc168aa2a0fb1850bab1d713d2124dd8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c0e5499efeccacda9a16179e7cdd94b03637b433 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f22dc39efac225a36f7d281536246f957c5391b8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/34ed2bc4476ee0ebcdb597b40500cdf65b9edbfd |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1386b7d4571778e69f9bd8bdf18b27ba7fd86ac8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f30620d11a534a21c8f2885c48c4e4fb13cf3918 |     
  sparc64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/c7f00fde81f0536f78444aff9de0963600a58d6d |     
  riscv32    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/5dfa4fa7229519434aeacd879d80fa30089275e4 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/bbf122b76372c39c29c068e2fe481ffc754134d1 |     
  riscv64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/4b084655309e261e17cb6fe4edf3025871e6079b |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/25159f974f9853e0345c0a16b897302bf9ed3a55 |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/38698bd864bf893ad068f683d3835fde327d9ec7 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b951a6f78efc55ebc961658e40d3136acf9c3aa0 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c917d1b1cee53e8ada1437b3b02bfb22b4b2e00b |     
powerpc64le  |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/82f45e7898e51624fe8c5be017c4cb237cca074a |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/549ffa7d0ef13cf38b9659f3919ce58b8b9b6a90 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/de2dc57c8f804d219a3047b7b8f042aaf65ab619 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/525f6d7aadcb1e0866f537077efe4f536097c9ba |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f65b02259434d5f8c2ef7d7707bc398528fe9159 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aacab8a06af05dccf712145f78fad16bd8c1f3a7 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c6d94080c486bce12ba9124359ebc891cc9f427c |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/77131d5332a4c98f68f08da496e1b449fbbff989 |     
microblazeel |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/97ccc3f2e4808b22a09e560904d4bafb51b951f5 |     
    arm      |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/92d009bd4eaed57322f3444a1b956099c9681d1f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/1410ab2f92223cb0a3e62d0daf76303a4f016ba5 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/81a3a96fdf75a2dc2548b2aab827edae357aaf29 |     
    or1k     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/36225a3d88add401012a10739885ddec8c1f0307 |     
    i586     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/dce133c62815ae26d3e68e45a3b4a24ccc5f7ff1 |     
    arc      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/9d23ac8aff2301b3a93f968550d69ddfc16442d2 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/4332cc2cfe3b919d366b0320789692e1c73fb612 |     
    i686     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/9a07035ce1540725df54953bdd391c0aa73e93fc | ORPH
microblazeel |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/5186385dd6d4961a69d170b5862102a651735c9c | ORPH
    i586     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/1ee2b9d678992b90d76337deaa68e746a7b2292c | ORPH
    mips     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/046adec881bb0b357fead9c8b22498f95209d8e0 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/ad38af2a66b804d035b8efc2d6abf7ca7e670ca6 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/474aad41378d3c11fb936493062f96aed4d80437 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/925da135f592cc56accb2da2cd42e53b6d24f3ed |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/60406d1c91ea985af35d669561d569ae75505a95 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/f7049e7a226ad249334ca99c2868862b6430f0ec |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/bc3cba6220fae7dc9ff81684b3bc254a8057e2e3 |     
   x86_64    |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/edb612233927229d15ab040d0fc39d04ab5441ba |     
  riscv64    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/db4227e06926be992caa876cfcdb0bcb8222cbac |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/8d4987324c6a9fb405cc0ef72cab10ab9a0b8abd |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d1116b03556d0c1c18d95cda768e761aa56be3b6 |     
   xtensa    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/fa9eb745b0449ea233fdab77762c0efff28bb6d1 |     
   s390x     |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/b3b1d655f32c77053a45d4c941b214d456d87359 |     
powerpc64le  |      perl-dbd-mysql-4.046      | NOK | http://autobuild.buildroot.net/results/8da77e400799fd9fa6cd0e26d382e1a0308c0db9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1e31e1bdc597f5276d0cb1b173021c16f2f0d9b4 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7dd3b0950cab5e9f96347dbd354704e39be36bb5 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cac33f1a19b502c951849de2caf8700b89b5a57a |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/da67abb9d2621e81cdcac80805cec3060c32b7a0 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/3885dc1522424f32f1d3e6b54710633625b72cd8 |     
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/240829cb19d34469d2a91b14f3b34ae8f77dea8a | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/98d91ecb97a5882affbad902e61abc7deb30c6bb | ORPH
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/51a796ea629ec1e4cce1370d216dda10cc136c56 | ORPH
    or1k     |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/2d26c35264454732e1ecc78f5ccfefcbfcac5206 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/412d15e76b4329048b5be020ec8b8751ce37c4d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2a6baac6e6daf2ba29d922a2fe2822d45e7cbe1d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d786352206688f5543badd22e821a8c5b222c92 |     
    i586     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/f6448ce64170308693719ddb58112f61c6bad668 | ORPH
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1833bd6173884fdf901be69d3b131b7bebb16fae |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

           host-libcutl-1.10.0 | 1 
               host-llvm-9.0.1 | 1 
        host-sentry-cli-1.57.0 | 1 
libcamera-ab72e6641c56e876f... | 1 
monkey-f54856ce250c4e257354... | 1 
                 pixman-0.40.0 | 1 
            qt5location-5.15.2 | 1 
                    vlc-3.0.14 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/ff744f600c3fdcab76060b4601d2759bee90e84c | ORPH
   x86_64    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/d9cf462d6a1d9e119db4f04b4534f6d28cf65c81 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f3604e3b5f66c35d864fbd68122b63fece540831 |     
    arm      | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/ee4f8202c88868bc8c06064f75a8cf1346c361eb |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d417d068872e9cc6b37cccded6060133ef52d029 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2cc23e1ff2441ecb01cd5a03b0d667b9e32c99a3 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e28e63e898909cd109edc4f242c8c55e2fe1d29f |     
   x86_64    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/3740b86be94c1aa4455537391f6c664570e3e336 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    ffmpeg-4.4 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b4d4be2cac44f12dff4b166d547b9fa12480d7aa |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/822c370809b17b7692c8cdf10918bef9457cf29c |     



-- 
http://autobuild.buildroot.net
