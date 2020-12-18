From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Dec 2020 08:14:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-17
Message-ID: <20201218081426.4D55C86D20@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  0  |  0  |  7  |
  2020.08.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 15  |  2  |  0  | 17  |
    master   | 66  | 49  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 26
                   rhash-1.4.0 | 6 
            erlang-jiffy-1.0.6 | 1 
              fetchmail-6.4.14 | 1 
        host-sentry-cli-1.57.0 | 1 
                 libusb-1.0.24 | 1 
                lmbench-3.0-a9 | 1 
                  ndisc6-1.0.4 | 1 
           python-pybind-2.6.1 | 1 
            quickjs-2020-11-08 | 1 
                 systemd-246.5 | 1 
             timescaledb-1.7.4 | 1 
                tinycbor-0.5.3 | 1 
                       unknown | 1 
                upmpdcli-1.5.5 | 1 
                    vlc-3.0.11 | 1 
                    xen-4.14.0 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3d141d5481a09c8b981f22dfd54ea66e2bc342de | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/33c84772004aa98c4371006392d4cddbfeb76a45 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/49ca08e75580c9e7956ddeb78e73408da2f3f5a9 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/38dd36de7e903726941e130cbe50f9a1ec9fe74d | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/09d864d4f284449a95154eb1648edf5e5a23667a | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0cb4652da5e3d23549ad0b6ec22567d6c8d0b242 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/30fe060458b75434ce9ef44289928ab9e35d7668 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9924e1b42f2edb25c0f3d9331684a8f2e178cdc0 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bf56f2d516c121352b4bd01d4d4b24824cb636d3 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0814ede78d7c9238ddbd1a152e981494ffb01e7e | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ba29f593918b31c5f9cae57d7f7924da6585f54c | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8bb3df9b12c86fc2a8ab413afe5cb84e2e39f128 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/812c1174cf412aece2bb0a7926e04a4812e9c950 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3ca7d99e71be714440a933952b75ff8f7e352cbe | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/34e627cfb008d82a19324c194a248a80251383f6 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c8deeae9a4eceb6c1fa301a534222418107d2b39 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/14d7fc8ce229f433bec775669092515c5c51f626 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fd438ef264e5133a538a39b103427db5926c7767 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e7b22baa9df490cd24c9070ef1cca8d0fd03fc9d | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3963e0b965c62fa85b2ac065311b3fcd8aefe682 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e5f96191d42822685a48380350832c3b8b6f0098 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bf99e250f7911070e217ecb4cb328c8690d49c15 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bf5a7b2b6ef527df327248e61acc6da054930add | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0db777e4b48f55c15dd5eb40e499bcdd111a3887 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0e79e51457581364fc7db85be2d3a9dd32edf681 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/919007ab732d8c66fa63cec4db03bbd732265b62 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a5513c2e96e6998d6bce74b99245e10ac9debf4e |     
    sh4      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/31dd208fc1f4e9ee41d2db7fb85060f44002221c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3184e7635f5686aad6676ce7dfa22656fae91b5 |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/670c7989ee62e95cb8dd6a21f20c9ffc27c6edae |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/3d78fbe5cf0cc79723ce6a36ac19701bb7e59fc9 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/512085a41248ef0580360bfe353fd6681bce5c20 | ORPH
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/fbbfb5192331d3ef3e8344c0c1b0f809a46568e4 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6cd45f11e8db99cfa5d74a857eb8c56109676f00 |     
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/5662e9e9ff1bd6716c91193d6f61aa1d2fc8068b | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/93e4a93627eb0f1b5dd02bcce23ca9a4d7287233 | ORPH
   xtensa    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/354f81f7fc179bf2a589d9d750b73ee09feea6c6 | ORPH
   xtensa    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d0a4f08d7d5bf42e7ebdc1b2297bdbba09e80482 | ORPH
  powerpc    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/1fe55aa64465fd91b07fcef38bef35da0588966e | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/73d586ad485c8d2438ec96a03e8b0a3f1f4d9cdf | ORPH
    arc      |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/3031afcc5a49323d13bf5d9893316de15222aed3 |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/a720c9a6a2152c8af35ad33caf34bdd2e4c3cdf8 |     
    arm      |         tinycbor-0.5.3         | NOK | http://autobuild.buildroot.net/results/c23b694442e7f86cbdd14d8789b12e6a8fd26a70 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae228984c2ce58f0c61381ff7817971063019c11 |     
  mips64el   |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/dfcf2c425fff0261551ea9a635865fc4f0d6b9cf |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/8ac89003c8218aa90a8f1135e60f8141a50f4da5 |     
    arm      |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/3bdf08692f1af5de8bb6aa4db6ffe5922b024bd6 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7b50a04e2102a1a35b932f067c23711c2898f70b |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a320d650f825195e80beba97509940876878b9d5 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                    php-7.4.13 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/a373138c9008c95720ed9898a0f68984628f1306 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/99a98abcd4c16a8a6f4ee4042927816f6a8b20b5 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  zeromq-4.3.3 | 2 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/7091beec2d63a4535a10b1a80c2750d77ce9b04a |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/8fd13836ea222db78b4248acde2fb5a360bf2d87 |     



-- 
http://autobuild.buildroot.net
