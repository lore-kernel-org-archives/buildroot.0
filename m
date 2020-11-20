From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Nov 2020 08:10:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-19
Message-ID: <20201120081047.403C686DE6@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  1  |  0  | 20  |
  2020.08.x  | 13  |  6  |  0  | 19  |
    master   | 101 | 21  |  0  | 122 |
     next    | 13  | 23  |  0  | 36  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 9 
                xfsprogs-5.8.0 | 3 
  gobject-introspection-1.64.1 | 2 
                  boost-1.74.0 | 1 
                    links-2.21 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                rocksdb-6.10.1 | 1 
                   slang-2.3.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4b38c4b716142a07e7f782826e5b2f37ce9d1fcc |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c88aee76f3888d034f4277fbf048a80dac51d9c3 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3c86e2a7e6ddd40432e780b683eb93a355cbfd81 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/21ed0f736a1c8edeeb945a4fcfc8bdef5903d68d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dea47bac8cb611f4bd7720e507fd9cf5c2a24bce |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99d50d3912cc5009d9ff6b533f88c7ea0c10c324 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ddc3e5d66582df99c2de632743330f72e0c1ff88 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4d0bc46e585d4c3ccd010c17c1781deaff228bfe |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e0e408d8e57e31239680b1e6474b366d574ccce |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17d980164c589a11f98580ecefa4519f656ca7fb |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/76760cdf93b80b6cc76321f3c51cacb207a94a58 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f939c062426a90fc4fbfb690a68df2f42bd6ec6b |     
    arc      |           links-2.21           | NOK | http://autobuild.buildroot.net/results/54629270067dac6ee53bbd44d5893fe979488aa6 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0b723937ca048228082d040100f6e6324ac8300b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f56b9955d3122403c11e144d30501a343b915264 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4a3b80732135edcaedf6363968af95e880f03811 |     
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/9490a58d9d5043b82ed0fdeb6526f1fe926f9728 | ORPH
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/4bb46976665bea99ac62c86d3953ad025f7f0a96 |     
    arc      |         xfsprogs-5.8.0         | NOK | http://autobuild.buildroot.net/results/86ed4f825d1b866d337bb6462ad105bce45d7eda | ORPH
    arc      |         xfsprogs-5.8.0         | NOK | http://autobuild.buildroot.net/results/135e74723fcb491b7c74cf91cab6239e41675a2c | ORPH
    arc      |         xfsprogs-5.8.0         | NOK | http://autobuild.buildroot.net/results/210a81604b1c0b81744c53db1a7668c026f86bad | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

         mono-gtksharp3-2.99.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/e3e2b4fb8de15abc896c6bcf8d570e9b787f0674 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              micropython-1.12 | 2 
                     efivar-37 | 1 
             kismet-2016-07-R1 | 1 
             qt5wayland-5.15.0 | 1 
       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/c29d65e4434b6683320a3d405e6bf763777ebb2e |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/78fdc19d3bda6c6db2a0690f3229a631b669e276 | ORPH
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/96c417368bb7c3c10d325a3d240a7ec838fac862 |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/0205490fc4462aa16bf6d2e65bf0d87601240a92 |     
  riscv32    |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/887efca79cc37b5fe2ac963fb8fd707a31068f18 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/40fc68bea2fce2d1cd3784bacf694508d98285a4 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 9 
         jpeg-turbo-legal-info | 4 
              libeXosip2-5.1.1 | 2 
        host-sentry-cli-1.57.0 | 1 
package/jpeg-turbo/jpeg-tur... | 1 
                    quazip-1.1 | 1 
                    radvd-2.19 | 1 
            resiprocate-1.12.0 | 1 
                rocksdb-6.13.3 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bd5ceb4a30a7a9ed4f3a33f9e9b04754161fe01a | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7e71860dbc2ac14993a6f9342bc319916aae6b76 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/dde6ce63dabf58766bd9a3c0aa48f695c9ca43e7 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/df8a07a6d8ce8dcd78c9aa4e773ad187411346a5 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5e65f6252ce588d6de99cacbb1cf8e75acd7d5fa | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fa1a1023e5c8143a1f0cdfeec7395f6a181fe06d | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4c53b14819bb8e7d5f5d64c6c2722d2b9e988dca | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/56527f6f3ce19e93292d73873752c011932b1b20 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2a63e1049213ba995006710d0e1656a0a17627b7 | ORPH
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/251f9115ed224becc0a798e393ef4d4e135fe29d |     
    arm      |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/72575e92621ba5a899230684a2f1c4708522033d |     
 aarch64_be  |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/f617838907d1326021a8d11d5a30ba0a15561463 |     
    i586     |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/a284d6070b47c13167464bc444e7a3270a077930 |     
  aarch64    |     jpeg-turbo-legal-info      | NOK | http://autobuild.buildroot.net/results/50128234a22678efba8ccfc78f3173b4ec35496e |     
    arc      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/fdd0e0c744b5d4db73571f2258c42158ca904522 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/aa52fa32a4de45f9c155b57d52d2136a375100c8 |     
  aarch64    | package/jpeg-turbo/jpeg-tur... | NOK | http://autobuild.buildroot.net/results/7700ea4f9d2b003f622eca4a8f71b82b0938ce34 |     
    arm      |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/2c8b3f1867d588b3f6a5f7c1f5f282dd9bc29624 |     
    i686     |           radvd-2.19           | NOK | http://autobuild.buildroot.net/results/e778df96f0a382a5b119724ee69f956ad455c452 | ORPH
  aarch64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/b9d38d90573b08bf39a53d4a715d57e9d43179f0 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/82968f266a1731acf20878d4f72244c8ef9f909c |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/01acb3b402c59527e3252a6e2bf26b23ed49cd63 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/962ca9880c5ad9339a70253c339f455f254b0f35 |     



-- 
http://autobuild.buildroot.net
