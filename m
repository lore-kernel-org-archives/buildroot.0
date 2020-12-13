From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 08:15:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-12
Message-ID: <20201213081529.33B7B873D0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  0  |  0  | 17  |
  2020.08.x  | 15  |  2  |  0  | 17  |
  2020.11.x  | 13  |  2  |  0  | 15  |
    master   | 72  | 59  |  0  | 131 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 28
        host-sentry-cli-1.57.0 | 4 
               nmap-legal-info | 4 
                   rhash-1.4.0 | 4 
                       unknown | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.3.1 | 1 
                  boost-1.74.0 | 1 
              fetchmail-6.4.14 | 1 
                     fmt-7.1.3 | 1 
  gobject-introspection-1.64.1 | 1 
             kismet-2020-09-R4 | 1 
                       kmod-27 | 1 
                 mesa3d-20.3.0 | 1 
              micropython-1.13 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                opencv3-3.4.12 | 1 
package/nmap/nmap.mk:89: nm... | 1 
                 qt5knx-5.15.2 | 1 
             timescaledb-1.7.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/059175accff7b2b0de986ac632cd75d69940b48e |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/29da89416a70fea0a6a85c48be17217ed47346b8 |     
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3ac8b14f35ad4e640f303258f4149f1df0358bb0 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/77ba4e894d16f8e78a2084f57d25e05e010e9c26 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8432ca1435392b5a14c18095f548c83d336559ab | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a704a090d4cf9376dd9238ae148d4773ab780713 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c3cd4611b3244244ffa8ee12935f67614a8b21a0 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4ff6ce60e52ddb12abb8792b1083ca625e2f2c0f | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1bb4788980e3ab44ed212662ecae70ddbe9a0b13 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bc61b07591188d49d41a7914b4dd1e985c4a3b4b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/44c5f471190b373683aab63f16dc4d76723efb51 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/29df343f7cc19d4b86c328141234f3c8ebf0e0c9 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/31916673b6676c2cba57e112859945dc183834ca | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/22aabdba57e923cfe4ca84c15465fee731d889c2 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4814fae1536a4857ca50fe6059417e8beed49d3b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a2298b0d5aeeb543856c276d9671c0cc7c26e344 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0ce2535e942860f53fde6717cba2abe97e1f7192 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cb89f6aabb14638ea8bd0351ac8a99984e3586e2 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/afd574ef61d44b94496ae7f0e98c92fe0773f9aa | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/202f266aa5c3e47028e086e832cfb3b74e02453b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b9d635e54535b2b310498e722481471143af3a2d | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e261616695c3d833f262b490099b95f17ffd9b25 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/786fd838f37bbba1fd32d5aedd73a2dd8f4b524e | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/701c3e2546a30c21eb4736268831795a2667385f | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e667d21dfc87b3ea144aacc6f8dafdf392871773 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ce6bfa034adc7828c176c8d9c4ed1f8d1525464d | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1d74e67a8852f2a5a6c73ff1da29d05f62259a44 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2b790b822c70eb03e00ebc8bc46b84c28f50e67e | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/860e92e2346d343e42c83847b8e0d2f02c125619 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5a524ecd0c592b92f9e27af1d0ada01f8ac15124 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/8bbeb9a82eccc80458436aec8ad2ab366c9c6356 |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/02e324e9f4b07be862424c40bf60e9ecb0dd6a32 |     
  powerpc    |           fmt-7.1.3            | NOK | http://autobuild.buildroot.net/results/814b0f9c3df0076791ca73579b844ef4d56f13c3 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2a153485d3d9e008e098077583acb58d1b771518 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d6b5729459157e03ad598319e97d0693576957c9 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0b28969ef8e4a7c2a41cd213bef887f5b15424e9 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/06f565ab7780d199d0b26194a8787e61846bf826 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f5e8b359557d1abbbed71ad114b1295ce019b2cd |     
    arc      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/6e1f8c0de791493b23f91f054c0ece975c77cae9 | ORPH
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/3ee37ccbd97b21537a1beb57ab47d47b94e61de9 |     
    arm      |         mesa3d-20.3.0          | NOK | http://autobuild.buildroot.net/results/7bc054d4f3c0217086179be1533d3c427351eaa0 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/4237a868ec0cf3995cdd2356990c301cd562bf99 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/a6ad7da9fd4f2efe22b697ab6c64f1afdaa416ad |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1e9c3ae799cd9f9dce77586df11344004904882b | ORPH
    mips     |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/5bd10e5fb6dbc89c386ca18aa90167d9a8882c42 | ORPH
    arc      |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/7b8f4773127a956fb1b12e8edda659f84c694848 | ORPH
   x86_64    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/8abcd7a3cb7eac6587409b6323a4e3614ac73864 | ORPH
  riscv64    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/2ff6b0f02a22c9c5b4b15ffed35358b1194997e7 | ORPH
    arm      |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/7b4d34d3bf30562503dd0ed589357c657f41f878 | ORPH
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/a89533682c77e825db0772a7476b10b0a3d11b23 |     
  powerpc    | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/8ba4bd9840a573e1b0f500cb60c20725da8557aa |     
    i686     |         qt5knx-5.15.2          | NOK | http://autobuild.buildroot.net/results/a043bb991a827880d6c743e63f070fc6a3b72a2f |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d01d45de4d83ef4fbb275276f333ae17aae2ab9e | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/b6307bb353c1969da8b6a9f4d0adb315118332a8 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/2bf92b9cb32077d58bec89a1ec1de662d5a0304c | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/9ade2a1e943f59e87b0aaba03d6d1c9c9220048d | ORPH
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/6d7de7c8418d80e2e6c4bc585d9d270dc9cda957 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/0e0a3666d6909eb3b4e28b910750e3b19486d185 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cdb043a87fa0262b474edbe7f2562c99de92c3e7 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  zeromq-4.3.3 | 2 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/600e302c417ee45af670d64a63702e8061c07469 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e2f930e14401a9f6c218205c3ec7e773d5743c8b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                opencv3-3.4.12 | 1 
       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/08548dd0da4ffbeb17e709aec77dd7f61a7a5c25 |     
microblazeel |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/cba660d72d27cd57e29726121bdba6c8695eb622 |     


Gitlab CI results for 2020-12-12
================================


-- 
http://autobuild.buildroot.net
