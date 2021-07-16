From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 05:48:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-15
Message-ID: <20210716054831.DF77660787@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Autobuild statistics for 2021-07-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 11  |  5  |  0  | 16  |
  2021.05.x  |  9  |  4  |  0  | 13  |
    master   | 35  | 49  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

                  exiv2-0.27.4 | 4 
         host-gcc-final-11.1.0 | 4 
             libsndfile-1.0.31 | 4 
cegui-00b4e1fe174da53b7ed72... | 3 
         host-gcc-final-10.3.0 | 2 
               host-qemu-6.0.0 | 2 
                   libqb-2.0.2 | 2 
                libsoup-2.72.0 | 2 
                  polkit-0.116 | 2 
                   seatd-0.5.0 | 2 
                  zeromq-4.3.4 | 2 
                    daq3-3.0.3 | 1 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                   gconf-3.2.6 | 1 
                    gcr-3.34.0 | 1 
                   gssdp-1.2.3 | 1 
                harfbuzz-2.8.1 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
              keepalived-2.1.4 | 1 
                librsvg-2.50.5 | 1 
          lua-lunix-20170920-1 | 1 
                      poke-1.2 | 1 
                    qemu-6.0.0 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-6.0.2 | 1 
              syslog-ng-3.32.1 | 1 
              tpm2-tools-4.3.2 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/00211a33dc8d5e87ab49ddbd19caf4a80d70efd5 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/187fe136f7b8e3420285bcd70670d74fb23cf70b |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/491da6132013856e69fb5f7df67737d647d342d8 |     
    arm      |           daq3-3.0.3           | NOK | http://autobuild.buildroot.net/results/e2cec2fb348a1916fce86c873e08dff1a88ddf33 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/fcd1a8e18ddfa18e0e75fb6cfb16c55e406e29fd | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/97fee5c29f007262a1d046a1b6621221ac6870e5 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/23335b6a9e374650bae21835189a48b0513bf2a8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7b1915ecb3263b8ef975f6c5e99808c03752146c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2745c2fc4c32a7002bb58263d566b4881f9a5b1f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/241bd32a4daa8c245ed7b8dd355bfc8cab2e644d |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/2e5b175536082524e090270015caf5ce6657d8cb |     
powerpc64le  |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/34afff39ff1c759539f818a91aa57b5e1b7818f3 | ORPH
 powerpc64   |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/a13f68837e46af748bcd5556752754c718e6b2ff |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/b114760786434ad0997b7d288817751d643dd6b0 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/08044f62191b93c53fd6b82024d397769f00f2ca |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5adf53f07b85de389bdb550d0509e0d65db466c7 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2befbb13e58f216f97cacdbd78d45583e34d047d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5748f8d2532d9029ed8e60cf68098c6e71a5f090 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c19810d79e8c9d6ce6f0b69ce5fc767a3a029367 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/7e288ab620f86407a69d228e544f95b8190f2021 |     
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/085fd94bc0c72130b57ba9e7d862fefb03469135 | ORPH
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/28ef8ebc0b48ebca14deb1b358c413a9c8d91196 |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/73acd74c384ff6acce19cd4eeab11a5f5e183cfa |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d4a468ca5467aa03ea82be2545eaf1c6cf6955a |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/35c914d58e59cf0f6732e1078c1e9e88647b2c47 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/c4dafbdec934d2ef3a802540506f0354602dfa33 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/5c60515817706d8e16b14408c928b768c59d2b92 |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/dc6756ff67948d9d527281c9bacf7f85583a741d |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/22ce25ceafa95f9c3bcc1200a3b450167c8baedf |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3e3e3e166fbaeaecc5181bb7259de496d661413a |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/8182defa4dd5ff3bef8b4b1fde28915a720facdc |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/26d250ecb92152f9a52059a3f458a572c832f591 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/e9374c85b07fcb35bd1788fef33b3e07111fc156 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/bba6ab1205a01e878508e379498fb3da998a6386 |     
    i586     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/7d192a0a1d58d258b77906cf936949b2f47373cd |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/287b9f2b5037fc8e492f00e26f0edce3896b5981 |     
  riscv32    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/4072ee2550cee35093530999f5f62d81f1b2509e |     
powerpc64le  |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/e609810786d992574fabb27406ed647631c24392 |     
 powerpc64   |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/5b37c41b2d0b265bb5332bcc83eddac55b13a4c1 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/44128a56e360cf5be3f37e92e2e33891a0b3a3e6 |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/d32f420abded0303c0d64cf65cc316ef12b7bd59 |     
  riscv64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/aeff4e98c4499043baa02e0f09e483cbc8239773 |     
  mips64el   |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/27aeaf4b46e225024963c33640a340cdd2e72bf3 |     
   nios2     |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/e51dc8b8293b29319f098e664664d84ade2b9df5 |     
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b6343bbc0fb3ef37ac249cd0501e4587978f2b3a | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/7df1bd48018f2d8302eb4ca2a901565a4ae1a360 | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/cd7a067e5ac4c25c78b53cefb4da43338e045c00 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d7fba8941f2670d451bb17a01de22fe85a478be4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6f47ef35fefcde1d7e735f3ba09a6b5fb7ea8582 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   eigen-3.3.7 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-20.3.5 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/299744198fec36b7ffb9ea136d22ca2b25ffc610 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/479473b6e66217af7867292f1f816edc187f6cac | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/698fe3c66cc77b687ce91087d0c1493b5d3e968f |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/c784d0e2bb001e270ff6fb3ca4d8d0f56da00b63 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/aa16f767b3e1dbd63c5868fab7cf6a72b1835e15 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
                host-go-1.16.5 | 1 
        host-sentry-cli-1.57.0 | 1 
                    qemu-5.2.0 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9c5ba54adbfcfd49d211365442bcce8eaa8cc743 | ORPH
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/81062d56178efc4b013648cf928ce78e3d289d50 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab9927b604160098c185c8c0a7c79bd56e7ea4cc |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/a94de07626fc97823063ca9ebcfe3d64113f4679 |     



-- 
http://autobuild.buildroot.net
