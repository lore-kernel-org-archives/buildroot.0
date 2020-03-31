From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Mar 2020 06:25:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-30
Message-ID: <20200331062552.A239688461@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  3  |  0  | 20  |
  2019.11.x  | 17  |  3  |  0  | 20  |
  2020.02.x  | 23  |  6  |  0  | 29  |
    master   | 111 | 53  |  1  | 165 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   cegui-0-8-7 | 8 
psplash-fd33a9b3d68c89fa22f... | 5 
               libglib2-2.64.1 | 4 
                       unknown | 4 
                  ffmpeg-4.2.2 | 3 
           host-nodejs-12.16.1 | 3 
                   gupnp-1.2.2 | 2 
              host-grpc-1.25.0 | 2 
                libtirpc-1.2.5 | 2 
                  rygel-0.36.2 | 2 
               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
          gstreamer1-mm-1.10.0 | 1 
                     host-llvm | 1 
             host-pango-1.44.6 | 1 
                   libnss-3.51 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                netdata-1.20.0 | 1 
       network-manager-1.22.10 | 1 
                    proj-6.3.0 | 1 
         python-markdown-3.2.1 | 1 
                rng-tools-6.10 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.5 | 1 
              tinyproxy-1.10.0 | 1 
                     vlc-3.0.8 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d71294b1ab86ba398cfaf490803995469c11c76c |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/d24ebb999215a23e0743c29ca137745417316bc4 |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/37b46d25a98a17ead9133cba9fd6c8ebe8996d60 |     
microblazeel |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/c7a785eb2e0607c9700dc2a2f0d55e4c1d38a996 |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/bba1a98ce5ae7c83337330b90e13ecd65f55ebe1 |     
    m68k     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/af126c18992a03c219093424acad8f746e8c634d |     
    arc      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/93aec332ab4d0870c3843c3c1306092f39803db1 |     
   mipsel    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/f3e7e740de2c08b0eb7a6df187bbecf5897022ff |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a76e88d1805c836bf095b9b6ed5fb52aa0fcdc0a |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/3a97323598109250ce429a73110270ac9e6bdcb6 | ORPH
    i586     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/c7024307d36fd4e78c979d587a2dc2596c8e82dd |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f55d32a470b4d538a635dc66f3993f0ede6f44d2 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/6590764762bb65e9007d266d3047e68dace04c46 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/625f0f43373d5e93f28856ac455860578d881f71 |     
   mipsel    |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/723730328ed4873c82274fbddc039e5450f2aef4 |     
  sparc64    |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/be576e702189aff43f2e8d5604d48aa28a638b86 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c691e40a314f5e9fe3b7b07cbe77ac56bdc0e0d7 |     
    sh4      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7c8353eb5b15b026a8220118acb9e07c04a11a30 |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/fc15d39fd135efca75a95df7a4270eef90f6babc |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/1abe2a84b6ab1c179705e715ab3283c52b5b3bd8 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/596cae4c0de1d39570f45caad6501ef179339be6 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/093e4611c0256d6dd3a96ec657d162b942f9da6d |     
    i586     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/678f181d82bc2fc93f16a4acf505e54db1cdea74 | ORPH
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9e3d99ab5a89811fb34dd6a76e86608d8444dd09 |     
   mipsel    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/10a5892d7530c262223cf13e04bae5786e92f645 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/8abf0fc7ee6edcdfaf30bb740c019666dbd04323 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/de845f3de92c891b6136e6633e1f37a54524030e |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ff0518638b3519d95779d3747d9cf95dafb6bb0c |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/788482211dc1a4ee27369f345060ab92e09caf05 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5786be5f01ba4c875f88c8c1c8cf3e11d2aa11f1 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/78cdbf6ce4e6e374e59a897699c139981d8ccd24 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/17589786a07d8cdcccc4d726f3d1b29653c09e38 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6a92e1f27db733ee7656a1ef31859e85b184fce6 |     
  riscv64    |         netdata-1.20.0         | NOK | http://autobuild.buildroot.net/results/1eb033ba7bf85ba3e25572a106f08faf49cd05b2 |     
  aarch64    |    network-manager-1.22.10     | NOK | http://autobuild.buildroot.net/results/1af251045d66e4796be0a03a57e128f912f7742e | ORPH
    arm      |           proj-6.3.0           | NOK | http://autobuild.buildroot.net/results/20c442a1f78910cd1c5cdf289b71397a794075c0 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6d1bec8d3dc8c37acc1c69aab2524bc845e3dbb3 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a86546fa0d6877eb776129c2c7513a25c4cbd788 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7913942a985de2429d37771e9fe5638b4a8dd65d |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d9022e2ff8394ba6761c4f0a99b2903a1b6b1ee6 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/28280c532dbceb33c779a7156ddace026f612141 |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/6e100f2d6c702911983892ec0568ac176268b93f |     
  mips64el   |         rng-tools-6.10         | NOK | http://autobuild.buildroot.net/results/a7affc8cdfb8457e24e3486fc9be9b2fa9f12357 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6535fdf923d64980d73a01b0e9b4e357a4d1c5ba |     
   xtensa    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/474420f567c3311df1d82b0073c158f407a483b1 |     
    arm      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/72a576a4db4130cf1646e28627f656e1b0b4f8f2 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/8955064173182116b9384f8c8ad7441c58e3699e |     
microblazeel |        tinyproxy-1.10.0        | NOK | http://autobuild.buildroot.net/results/fbd81c05f37a3db6df1cbc3495a89957c6587d25 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f5665b61cd89f7cfcbea63b46b3fd897cd7f5c6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/05ec332d2c4d6c22ae35e3d942a3316972dcab8b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c0a01751745baf4f0ac7007f330107ceddf36265 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5acde32ebb90a64bcee98568ec5f4e86d953ed17 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6118336b0868b2033bdccd61c3fd5c581e619391 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ac3fd51ad1fbb5dd32ad992a7ac535895952d153 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 3 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/7c414b6a4b9c3faa0a258d96b179d11deb5a317a |     
  riscv64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/fe359b6c0ebe16cf8346f67f301d0307c008f644 |     
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/8a5c49dd31e331dee1864d7046f06ac3145970c9 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                 host-icu-64-2 | 1 
                 ripgrep-0.8.1 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/a5fb24a42dcb650a147dffba8291b500d12f7ecb | ORPH
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/605c27187cfd27648ad277a4983e35e64733fab8 |     
  aarch64    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/92dc90c87af513d741d65a4059583b84bc53ddbc |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 augeas-1.12.0 | 1 
             fontconfig-2.13.1 | 1 
                 haproxy-2.1.2 | 1 
               libglib2-2.62.4 | 1 
                 opencv3-3.4.9 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/93dce2370a393138e395a6eeede2ae599b2014e7 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/19884dc50a6049449fae65396697df0d063471c6 | ORPH
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/5d580d591316844615ab243f1b7af81d89e0df2a |     
    or1k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/d65108a1b63d38da49266c9410814ad1c447e4c3 |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4326f7bae1cf0972cb3b02f0dd2aad8037568668 |     
    mips     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6eae5e88297cde4c2b023c7535d30eebe1ec48b8 |     



-- 
http://autobuild.buildroot.net
