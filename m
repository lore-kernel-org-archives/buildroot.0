From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Feb 2021 09:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-01
Message-ID: <20210202091730.709AD8651C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 32  |  1  |  1  | 34  |
  2020.11.x  | 16  |  7  |  0  | 23  |
    master   | 155 | 92  |  3  | 250 |

Classification of failures by reason for master
-----------------------------------------------

                    mpd-0.22.3 | 14
              netopeer2-1.1.53 | 12
                 uclibc-1.0.37 | 9 
        host-sentry-cli-1.57.0 | 8 
                  perl-gd-2.73 | 8 
                libgpiod-1.6.2 | 6 
                  dhcpcd-9.4.0 | 5 
                rocksdb-6.13.3 | 4 
                     host-mono | 3 
                    brltty-6.3 | 2 
                 mesa3d-20.3.4 | 2 
                  ndisc6-1.0.4 | 2 
                       unknown | 2 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
glmark2-c493520253fbfe3676c... | 1 
          gstreamer1-mm-1.10.0 | 1 
              leptonica-1.80.0 | 1 
          leptonica-legal-info | 1 
              libostree-2020.8 | 1 
            lttng-tools-2.12.1 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                openblas-0.3.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
package/leptonica/leptonica... | 1 
            quickjs-2020-11-08 | 1 
              webkitgtk-2.30.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/0253d22a9a849f84e10881fdd2821c2ebd4e6bb5 |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/44b440d69965fd080510fa220798ce9d04e89416 |     
   x86_64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/742cb8e239f11a83d6c48872408d1c260fbaffa6 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4dd42fe9133590af7bb78b09ec1500af17cae268 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/496ec2661991c600798892ab532a67e56f9433d3 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/035d43488059116a49d9476336a07d7fcc3ec21b |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/efe6dd17fac04e5bc7d13fcfd6e64ac08da621ba |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d064f972c216c1a9d32dd4f2e1ba87b5f2cab6c8 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a2d1edb79bc884512765f61d1a6289c352edcd28 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5fd1628b80eb23aeece257d741dd97ef74096a7b |     
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/794908c61584b4a3c097026a7865be5995fb4ccd |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/01c3e5cba4d6a50ed3642af77c6aad405e8e9730 | ORPH
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/265df42cb7471cf386ea53853a877a541f48e117 |     
    i586     |           host-mono            | TIM | http://autobuild.buildroot.net/results/a5764d0db6c448b175dcb73e84ec8e01a37758c5 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/0b0b38ab0b4aad2854e770b726206dfdb718daa9 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9f4d13b234e561725f8e292c39cd23f00b623072 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68f71f8edbc559077dd536ca1c397fb386145158 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a90fbd013049b90bed019da47524acf202c38b3c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7988eb8562bdc104abb14d3bc3b418daad4e4f7a |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/22b4e3603202307d85ac44501c6e80ef1058885f |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b2a114d030b257c6e227f52b3bf7241e1bc091ff |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f7b7bc0e4263370376f2480f600b090b7a301694 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42178615fa045d1bbd8a3f34e977e048a99c77b0 |     
    mips     |        leptonica-1.80.0        | NOK | http://autobuild.buildroot.net/results/cc8f96a4fac933c06745d5205494a2a7b191b073 |     
    arc      |      leptonica-legal-info      | NOK | http://autobuild.buildroot.net/results/3061b00d7ed1c1a4d44528f72c8eb4e43bacfe30 |     
   nios2     |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/050ea56720343fb4bffd4b397ad39731ec5182cb |     
  riscv64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/42d2af58884652256a20c775a0dfbf9143cf039e |     
  aarch64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/7f68fe4f38b324586432fcdc8705667ec94c7b28 |     
    arm      |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/9e118709a5046b232996a26a0c7ae0de6edf85ba |     
   xtensa    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/9bfefac1996a5e23faeb9b03ff9820241ae08765 |     
   x86_64    |         libgpiod-1.6.2         | NOK | http://autobuild.buildroot.net/results/4184dd18fd74de8c8eb9add8af8d3796cacb2131 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/9cf083fbf64a86e8d86ed465c4c8694850bb2919 |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/5aeb107a8fa54eb1a380e2e1e35143836162d023 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/7b463151bff8fb5da7a3912967d96440dedbda84 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/5cf3f6d9d99d62c1906e9070d7c16afc3635f160 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/c918db08c5a39d88e838953796d228183afed01b |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/60deb7fa231a9a42b97a1b09f546eaa9e9f8052c | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a79cbd153fe6231420f19512f1048f42fea0c24f |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8a7b2ddf773327b54488f1cb30133ea517d492c1 |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/5b2db2036204ce52afe190272bcc722961f812dd |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3ea2a7d9119196b173101f1b466a3d267388ad8a |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f88a143beeccc3a3ec83b59567f04069f716faa7 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/cc29523bff5157dacc116d2ffcb7020db811485e |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/fc1a0dc9bdf4934fd09a54e0444ac5605e47fb19 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/65320806c19f11125acfba981fcc92c8d4fac027 |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/41be19e98cd1a8756ef704de2994044b6dee7991 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f33c7db1fbced51bf0246e8db63141bf3d5351a6 |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6b6397d919193ce8a1e15bd8cd1968b6ce2f1bfb |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1fc49faeac50baea791079af272ddc8fd14c76ba |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/80fa2e4d238870d294530635be506fe1be7ee8ce |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/549e9dce937a60013c53152c0745aa978581673c |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/c17cedac01bd5e280e01dddaa909edec10233e52 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/420e02e4f124dbae1045b74387f85f4f167d2871 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/dd9a10dbbd66886aa1fe432cead91ed5e3305c17 | ORPH
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4f3edfa3a587ba2951a102e8aa49bf0e5106647c |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/3083450445a2863d4b721ef2549ff272fdb561ce |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/49e3f9e91124642cfb6a4452bf8b48365c3c5164 |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/bc951e42a8cc71038cc3b4ad06b13f3832698c3e |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6fe6d2ac4e20053cf32dd958d3aa4f24bd36eaee |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/7475c6410d632e92d83022e8a71e628bb2e8dc75 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1f4a0a2de4d50b82519564788065c2ec0ee3c59e |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/16931501a7eaf83ee1ea0ff3f1bad39edd8681ad |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/6c1825edce6e5971c8016ad87c6bc373724b20a5 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e3daa3cbf86b6cc4b5f72ef3dacc90db546e29c2 |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/16f0c3963265faaa2284fd50619826c634e71123 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/ca90f059ae8faddfc8036684ad16b30d3fca62b2 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/41684dbce29e56f74241c7bce310215620693dfb | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/15b1c26f0d43720f8227a7873ccda0f860eb67b3 |     
  mips64el   | package/leptonica/leptonica... | NOK | http://autobuild.buildroot.net/results/215e90031dff7c2ae891693f5870255fd54f2eac |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6ffed9868a3e298cf32ceab57359e2ae37af3f59 |     
 powerpc64   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/66454fe28cc9553071fa47ff51fab6ac19b23297 |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/387e68e24e5e394f6b670c7896fc5c71dade219b |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/3ae6db38331f2d587fd1092f3ff80c038f88e39d |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2115647cfc2517f5a2ce88b30ab57a9592bd022f |     
    i686     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/4d0f1d5f12a76ee89565de7150000b56ea06a4c6 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/c73eb9975cea40923dc39de67f7b15e93c1c5fc1 |     
    sh4      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a67e24d02714c08b301f38ab742c693774fba4d8 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/a8e199eb9e5ac3e6125bd9bf4541eb1b5da0f2f8 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1398f68a28f589db66b9098fc250640693b03ff7 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1a62d18cd46c18888c9db29699e4e31e3945d885 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/dc47ffe898c6f7bae28b53b785d8092aff111fd7 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a26429285fe8d09bfee6b4cab5d9e05160ccb2d6 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8f0652944f72ce16deafb071171fbde05cbf89e2 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b8595107120f0eb3ef9fff1cc882d1d696403be4 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c9f08d26270942d92e95c4fcf4f4f93a44861893 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/284456bd973e6eedaeeb609fd8fd27747d9576eb |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6219ffc825e181e578b0945834e58b85e3817982 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/df23490a5a9e429295954b123c72dbff02e77830 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/dcb19c29ee7206702082a9dde357b73269292d3c |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3fcc8564133f172ed262165abe3eb9480d7fa859 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/038078a3dc9c91fe69bfe2a28f7bafdda455cfb9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/866dc879fdacd62efedc2a2d77b822cb7eac99cc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f528cd1a032d52403d4e1d6af8e99dab47d019c9 |     
   mipsel    |        webkitgtk-2.30.4        | NOK | http://autobuild.buildroot.net/results/c9cbf5521fef9cb115be20fc5aa00c2db6c4c341 |     
    arm      |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3c78a94a1c7966aa01c2466989a8115075425b66 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                     host-mono | 1 
            igd2-for-linux-2.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/2c884829985d1141b2cde4df7268b0b9c391199c |     
microblazeel |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/39ec544c9435ae0ba66cf7f804375eb425e13abe |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               capnproto-0.8.0 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.10.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b8496d8d9d58c934ef04b657c4d000e3de24d61b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e75c5403a8a957da3f45a572d6e4a4adf22e25ae |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ada3b0ab0e56c163dcadb400f80c6347345d97c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a30a8e0f28d353fefa34897e6249353dff4b3e77 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/cf31c98be31e3691cedbca03c9ceb49353857ee8 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f718e3481a4f4e7caeadc0425d09bbefdc4fb674 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/03695c80259485461e319a67ba70e3cc92c2a6c2 |     



-- 
http://autobuild.buildroot.net
