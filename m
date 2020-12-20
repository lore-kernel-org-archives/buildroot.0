From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Dec 2020 08:17:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-19
Message-ID: <20201220081726.73B4187597@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  0  |  0  |  8  |
  2020.08.x  |  8  |  2  |  0  | 10  |
  2020.11.x  | 13  |  1  |  0  | 14  |
    master   | 67  | 60  |  0  | 127 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 25
                   rhash-1.4.0 | 4 
        host-sentry-cli-1.57.0 | 3 
            quickjs-2020-11-08 | 3 
                       unknown | 3 
                    qemu-5.2.0 | 2 
             timescaledb-1.7.4 | 2 
              asterisk-16.14.1 | 1 
                  boost-1.74.0 | 1 
               capnproto-0.8.0 | 1 
              fetchmail-6.4.14 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-base-1.18.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                hiawatha-10.11 | 1 
             host-cairo-1.16.0 | 1 
                host-gdb-8.3.1 | 1 
                    htop-3.0.3 | 1 
              libostree-2020.8 | 1 
            lttng-tools-2.12.1 | 1 
                openblas-0.3.9 | 1 
                    quazip-1.1 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
               wireshark-3.4.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/6e276c061fb32f452d9f4b937f5bd76766115bbb |     
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/dda68f585cf5bb2b81c990b9aac32fc6cc8df87c | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/09d43f5fa9666d1cd75ba1da0af492461e6244fb | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cddc9992326d0706adce096b2aeedb1426e31d8c | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1dcfdc7716651661d81f54676780ae80463c9524 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a51ae3b8b44c012cbec9d48a256c318f443356eb | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/feec3fcd35dffcc3e06d58f85528f0496138885e | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b01cfc6e643e8763d870b878abb4d6f0a0da1449 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f6c57352f529da4a20b7746f16cb1436cad19663 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/99aaac4cc2911ed9b8d9b4b372dbb8cad7abdf3f | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/171fd2683ebefe1ee6e9f58d700de51eeff4865b | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/16e9cbbdb29812ab6d46c04952855dc16d7890f8 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2fb9c4fd6355c24b05a4c6abcdc0a14118dadba5 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8ef175d6981bce0f8624422f5cb460bd75ca39a9 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/20299914245ab83a80c13c76ebfc3eaf6610ff68 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b5abfabb6d25b1fd6a2b469a8dab25fafdecbb11 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d89e1e06620ebf9b582f635b08e8831295c3d50a | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/15fa6230414f9a62d688561010c3540d4f8478d5 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3b6a52ba2cb48ea34db919b4d606f35d745c86b0 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0ebdc2528326388260ebbc552fe79dcf0dd878bb | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/87182eb01f321115e62cc8c8977ebc31afcce32e | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7ac74e00416e54bb56499785aa50a9f6c552d871 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/223b27e824635b20034a0b4e61f73aba9f7c6345 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8e442064f10fd67a44bae8069c0418aaa9b25cba | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c0f1d51fb798638368c576c9670f59b7836bac93 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a8902ef3465b0e89ca44ab422a60d4fadee895ee | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/49c41c25d9aecd11ea673f46ea1cbb2219cbe17b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8cfdcf9696a2f88cfb6f2c62a84e35152e5f61a3 |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/8ec5f2b9c793e616554fcfcdb1328a149e1541aa |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/482b192b694f16d82e14adba65b453e8cff5b3b1 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/249bf8502d95f1033addf4e92447f8469f636030 | ORPH
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/f6fbe932831378ecdb75f630e5cea459e4c13cbe | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3d3f6b49f1787c3b44406ddedab09b1567d0c96d | ORPH
  aarch64    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/9cac31962d48245a5579da692dbc9488292a397e |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/75f2faabc02a1944f306029ebd249688a074baac |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/284348f09c180a5c284106c4e80ba1e5d50b72dd | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a36acb24f4f54eed98aac5515dd66490f560951b |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7bee31b50680012ebf7a804bccdaf6b8f9c08133 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fbfd8c97be9511db4909d77bfa77cafb0bc18a7 |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/9e673185f1f5622b60f99ec6e7abe73228339a04 | ORPH
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/cf2411c9da26e2035fccb08db951182f49dcc21d |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/7fa49980b9ce8d079d514dd219fbe54ff0dd62aa |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/dc44073abf77b8e76496864d2cd7ff965971c9b1 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/1255f99d2fbe80e917d836dcc514808da1180754 | ORPH
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/ae212e63e2115d64e7c92d32ad8d92891123d50b | ORPH
    mips     |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/df53b07e0a66936a50f05e3155a22ff20166079d |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/85fdf8df18df13e8064830edf3618ef3862c28fe |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/36f31136a7d1e3e4c0b22c5ba9b456671d418e10 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/39b4225aae0c303a2d7a008251bb58adbce3a35c |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/45ebfa141149efc09c2badda9a7f411c1c12b5dc | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/27055482997d85d0bd938ae28235273f1ee24230 | ORPH
    mips     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e249dd5f17533a4044c72b0ca049fb1f7b10e869 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3d09dbe291c1c426eddd49335988b7aa15f07c29 | ORPH
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/fa4ac27173bc2939e0d8bd9316b883745b0cdef2 |     
    sh4      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/654ea3a8d0d61b2983e4306ac3096e04d5b4eb86 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/9d8005d2c64f74ed1e2bce5ad5f1fb6bd598ca3c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/20ccb4a6149636b174ce4bc177fdd93bbefdd60d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e5fe8205eff11414c73ef366aca0554d754d1fa7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4437ced4248033b1bf65ceb658dd912eadef51ab |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/46fe9bd1e47b0f30b2a4a261caad6b693b460cb3 | ORPH


Classification of failures by reason for 2020.08.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d0960646eddcc914bed3a1b299fe5b6611b376a0 | ORPH
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/32f51c72887e9e6e2f49fc726ac505d6d4575cec |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              micropython-1.13 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/c7e665bdb08831dd9b4ffc4cbf9d5a2c2e424e28 |     



-- 
http://autobuild.buildroot.net
