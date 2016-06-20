From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-19
Message-ID: <20160620063029.9F891102C76@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-19
===============================

        success : 169
       failures : 148
       timeouts : 0  
          TOTAL : 317

Classification of failures by reason
====================================

                   efivar-0.23 | 13
                  boost-1.61.0 | 10
              e2fsprogs-1.43.1 | 7 
     python-pathvalidate-0.4.1 | 7 
              host-libxcb-1.12 | 6 
             bluez_utils-4.101 | 5 
                 gflags-v2.1.2 | 5 
          libmicrohttpd-0.9.50 | 4 
                    xxhash-r40 | 4 
                   libxcb-1.12 | 4 
ti-utils-06dbdb2727354b5f3a... | 4 
python-libconfig-b271c3d9da... | 3 
                    gdb-7.10.1 | 3 
                flannel-v0.5.5 | 3 
snowball-hdmiservice-f75c99... | 3 
                  autofs-5.1.2 | 3 
          xinetd-xinetd-2-3-15 | 3 
                blktrace-1.1.0 | 3 
host-gdb-6be65fb56ea6694a92... | 2 
            python-crc16-0.1.1 | 2 
                 lvm2-2.02.156 | 2 
               libsigsegv-2.10 | 2 
                 jack2-v1.9.10 | 2 
                mono-4.4.0.182 | 2 
qjson-ba273682a9d33a7b3090e... | 2 
                   fwup-v0.7.0 | 2 
           python-dpkt-1.8.r98 | 2 
host-omap-u-boot-utils-3f07... | 1 
sunxi-mali-prop-1c5063f43cd... | 1 
                    cups-2.1.2 | 1 
                     xen-4.6.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
              sqlcipher-v3.2.0 | 1 
                 mesa3d-11.2.2 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
               openipmi-2.0.21 | 1 
python-configshell-fb-v1.1.... | 1 
                beecrypt-4.2.1 | 1 
               libcap-ng-0.7.7 | 1 
             iprutils-2.4.10.1 | 1 
    python-rtslib-fb-v2.1.fb57 | 1 
                pinentry-0.9.4 | 1 
               trousers-0.3.13 | 1 
host-imx-usb-loader-f96aee2... | 1 
                    mpv-0.17.0 | 1 
     openvmtools-stable-9.10.2 | 1 
               libupnpp-0.14.1 | 1 
           libfastjson-v0.99.2 | 1 
               linux-pam-1.2.1 | 1 
android-tools-4.2.2+git2013... | 1 
          sane-backends-1.0.25 | 1 
           linux-zigbee-v0.3.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                 mplayer-1.3.0 | 1 
           python-docopt-0.6.2 | 1 
          python-pyusb-1.0.0b2 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
             rabbitmq-c-v0.8.0 | 1 
libump-ec0680628744f30b8fac... | 1 
           host-heimdal-1.6rc2 | 1 
              micropython-v1.6 | 1 
                mongrel2-1.9.2 | 1 
           python-pydal-v15.07 | 1 
                directfb-1.7.7 | 1 
                  openjpeg-2.1 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                  xl2tp-v1.3.6 | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/481735017cd0dee755257ecf94400f9ce3943bf8/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/eae1112991b02da68a0e4ec5b50b2214cc2fbc6a/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/04aefb489ce49c131d19f6b315c11ae9df20a808/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/cfcbdc53bc8970d3da968612753076c8aec3f5e2/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8cb64b60835d9765b4e30da0dabb777152389183/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6679315208b2794cb11279f1f6bd28472f34db42/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/16846044b3b91336a2bc822d643bee2b87b5314e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9f2d54fa29a0589a1443b552409053bf417db7bb/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/73ad34d4ef1202fca1558322a52fa1996a0e16f9/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/936ef6ca9e42e6bcb9eb816b04d37107e929ada9/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b49f29b2c8eef67b5a88297a0fae609dd84defa0/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0ece599c60b2c488e3140d2a61459dba31b03cbd/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7b2e2657c64c85843774cd1938093f2997d0fbfa/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/2b3baf6a8e7f8b9dd22fde4c45ab2f3f951fdb26/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/037f2fea371ff5bc87753fbe7eaa6421a99ca8c2/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3e9ea7f6b9f796d40f46cd3e2e9d4e9841e1e907/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f7103292892d8d35e8ef2ba61a1b8a6479d761fa/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/73cd2b21c2a44151cffe2d938fa8558ba05d3ec1/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/38bd9d53c637713f97899fda5809b7075abd46e9/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/11080cac84d54308d0756f0bf775489d2fcb4981/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/db21789b1f242a20614c70ff3c27e59469a23223/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/508c439b632f0f9c167cff140d271cb3c47bab16/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/02f98a50340ecae01f723ad48c2d54d9e28388f8/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/5914bf6f7dc3e0cd5cedf0f3ccfb5e50b1e76278/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/db7dfdfdc66495d19e27bb34e74d617dc7737a68/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8402b47493282b5ded5c57874125b6c06a7ab6b2/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/92a175988c4d278ee570911f1bb94dbef1caec16/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/64d36e6a31e58155e6989cc07ac10cdc4541818d/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6f629ed0fbcf040358b3d11c1b39628eec2d031d/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/d5a416a6a91c1e0919f6620d0ed7eae6bb0e8921/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/41e6d4a6d8be9e5eb744c42b996732448b4d1121/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9de914ef4fdce44bed45f977cb840c2aecc8367c/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/40595c148f026f7d076bc6c0dc4fe642c2e59a3f/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c7719c196be41d36d52279410fe7d3593168c23f/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0b606389b8f8e15df94b1590d2cadb4129ec26be/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6687294e6a810bfceab507ab006acf821da8c730/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4edfd5541f0f3825dad61882b9c0694eb1c4717c/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/81e4a65b027eb973c53cc9af8053731ed5128c11/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/23c675f2dac3f8cbcd4204c2cc7e35f2316eccc9/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/97876f8d1fd01ac3e3711009a6ff56bc74b262a2/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/65482edf8f72d8975eaeffd0756edc9ff733e592/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b82581b8030fa15442c0d44771103e27c04f7ca8/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c7aaf1599f7dd3a5e932bbdd4fe220964792af3d/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/421e03b9573a1971e0da080c8d42dd39b8f9400c/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/283b501091890b77adcf6f030fb4955244a187df/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d0b2452fa211ac5528dbd3357d50a6c66a99aa4a/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/083f679f65c31aae80d65684f4c39e517eaec234/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/dbe7777b8e70feec6102b74f30e215e8479ff710/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/30ad12bf0fe451aefb21cf59a76b059758746c2e/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/a1503e0a053bfd724f9085908d2df51db798d068/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f98a643d1b9a6495e23fe8e4c802cacba10b8655/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e7d1fed9576b2644a19dd8bcd0a61519a8fafe81/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/8356e0759970e6a21903facf3decc593e364018b/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/915b99458e7831a5a8e0fb723ce7816c08500987/
      x86_64 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/b2db2eaa5177680e5f1ccc58cb760dd4c89e74d8/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/393f11afbd141d38948ba37dd4e9ba58ed23c9e2/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/87d465c839b71a55aa1ea6586e0000ad329d1b42/
         arc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/8f910c280bd073f344d2b5b4d319364a6e6a4b99/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e7daaeb5e04506a98aa0022c1e35a666fe7515d8/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/177a4a6ff4a40ab620a643a10d94ca265ae7686c/
    mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/2d4b9dc1eb04221e2e507faf18807de5e21628b4/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/a5b6ca50624ca788d7457e45e8e04fd3c5d57132/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/9e0a7908fa927139c7cd92e0e528cfc76387a659/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/8ce657d9779c9d84bd43f1341c31ef9804341e7f/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/0f0a40c484a648fba108d72e45beee27d494813f/
      mipsel |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b09db1ba44882edfea91106fe01c5a0648304d62/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/536486f0169109bedb4a291cfa1488538b59a4e7/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/af20d892ec06967dacb2003d1da7b44d738cfa53/
         arm | host-omap-u-boot-utils-3f07... | NOK | http://autobuild.buildroot.net/results/59ecc832eecd7e90fcb269e691f810076e22580c/
         arm |              iprutils-2.4.10.1 | NOK | http://autobuild.buildroot.net/results/0c8b35448844b3e091f5bfd550ee6d21db320728/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/74b9383e129e503d5bcba5901e0e1bab495bd96f/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bfe69495bcb306c7af3bcb9d6ae679d0b1140b9a/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/81a4d98fd36180a01931014b1d5c092676cdf66b/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/184ffc14abadccbb8255b726d16540f14c6a4779/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/7e3df8a5f6a5ed20f84b27db10ae0982ea4b1e1a/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/5b9265d5c10bfe53608bc6caa1e7bc02cfa95328/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/b46db20d15c538f3b3a4158fa8be1b6007026cb8/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/a3a8cba780eff90ad58b757157765a8e6fbcb32f/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/d363d6a72522311f92ff5288e6fdabdf3fb8e06e/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/4a6184295826af26d043217709792778f75eae7c/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b3fe6b5fda08d6cd03214e36cc3368c831232880/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3a6a104e521e098499882c19e5c776bfe41eefae/
         arm | libump-ec0680628744f30b8fac... | NOK | http://autobuild.buildroot.net/results/b8b32bc4199f0e57444ccba00ec77afec1b96a7b/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/1794557cde63b532a6139eceaaa3455507059a49/
         arm |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/a8da5516951299bb0d933952ef6c99624bb76ea1/
         arc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d3d234b11463d2a8d174b0b58b898947f7854a41/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/db5a6f1564225351a305b579555a44f29516f377/
     powerpc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/1293937142375f0f5a48da314e6021ced5d88542/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/fc63ccd6406cb71801249a30eb7b86ad94f0e159/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a705a9cdafa003cb1544f45f77157ab55723805d/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/0933583bfa9b1e7cf346002af4d145bce5e9800a/
      x86_64 |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/5a4d2f287c28a6e0054f41f3ca61c19a1dc484b4/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/cc316583f798c663ae675b08460cd3d6728bf731/
         arm |               micropython-v1.6 | NOK | http://autobuild.buildroot.net/results/c9e33f9d72180ce6339f90e72369ca4fbe75c9b0/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/cac970a4e86f5cbfc8c288daf363005c3c14b025/
         arm |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/1d22370918eb90543148be6f783b7e0ef93f5e79/
         arm |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/5a739b30559c78092b1f825491d2fcf5706ad77c/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/89960bd908c0250625daba78aab49bcb15e0747d/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/888139519b6ff805d3ed923cedd8ad376260cca3/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/05a1b5a45325be0f338eca3eccf92a0022c15d8c/
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/119fb3babc4beb909f796120ee0fa59e5538fbf9/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/be371432ae2aed022aeeacd1491884a445f5bb2b/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/fe521b7715d9607eb15dee331a0d8a938dd35c3c/
    mips64el | python-configshell-fb-v1.1.... | NOK | http://autobuild.buildroot.net/results/6401d8366b2a1c15054653fe4266b06a0ccb8f2b/
     powerpc |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/bda3fe910d053ffa18dd77454246c92a06ccb604/
      xtensa |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/0d9402049d1b62492334ada85a180a8374fde02a/
         arm |            python-docopt-0.6.2 | NOK | http://autobuild.buildroot.net/results/97bac73f15f0ce2f9b2222de7fd6aa00812167db/
      xtensa |            python-dpkt-1.8.r98 | NOK | http://autobuild.buildroot.net/results/6b41f90b3ce09072a8229448ab144c2ef323b0fb/
    mips64el |            python-dpkt-1.8.r98 | NOK | http://autobuild.buildroot.net/results/6ea9da0f0dc36ca2a72e4bec51eba0126d6ce958/
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/08df8fb197835970a4c206117f8191659196fd79/
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/ede55556ef4e24f51d8be7a1f248152888ca9c29/
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3c424818648b6d2c019b5dc0059b3d28f1bc42dc/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/0b6984c84cb10856a0cf8b063d61782da8895ca8/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/8927f8ce3aaea5f88da09c4541241901e7867584/
    mips64el |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/6b218ed9c12ed5f90a1488f9649dd796177cad0d/
    mips64el |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/5efb8d392c13901a46288590e73070d45e4e13bf/
microblazeel |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/e5195b96a7be915034c755469ec273c1f7d9e4d1/
      mipsel |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/f81a39dd2bae6b30766109f020cb4e3f1b1996ea/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/71248379935dbd17c94f5e1cdc8f043f366992a7/
        i686 |            python-pydal-v15.07 | NOK | http://autobuild.buildroot.net/results/6b142927d752fee8ce5ae201ab4bf354ab1937f2/
      mipsel |           python-pyusb-1.0.0b2 | NOK | http://autobuild.buildroot.net/results/af8eae0d075d8d0d4a05ebcaa02ed55d1a91688f/
     sparc64 |     python-rtslib-fb-v2.1.fb57 | NOK | http://autobuild.buildroot.net/results/708eca3705c26bf6c510511df4efc1d93331ef50/
     sparc64 | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/a0aa5ba68e496c78c0f409c349a052559edc7262/
    mips64el | qjson-ba273682a9d33a7b3090e... | NOK | http://autobuild.buildroot.net/results/29be21dc51cc546abcad97af98670ea9dafb0c3c/
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bfc3b5d613a5e9e96bbc272a2b3915e7ed6eddeb/
      xtensa |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/21dafb454250f41d8a41d1be7dda1fc1bb490d0e/
         arm | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/07af4e81125adf5ab587afe46c9d1fce2381cfd0/
         arm | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/5cf73e509631811fb737a928a311748077d97797/
     aarch64 | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/3749ed13b9ce72d11b7f6de489458009df1f76ab/
     powerpc |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/bbfdb88d24479d652125a03e9875fabf841e5708/
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/8e866939ce9d5ef2453eeee2fa5a1c024689b578/
         arm | sunxi-mali-prop-1c5063f43cd... | NOK | http://autobuild.buildroot.net/results/62e17155f6a209edf7cdfc447c578521db486a46/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/ef9f01cbc353087ec3a9c7c87043dc133eff7a49/
        m68k | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/2480393abe6d3c002a18f8094936b9514d65993b/
         arm | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/8a452b879132c256b19f9b343c95b6392c154e1e/
     powerpc | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/13277cc9ff48634815ac0d043ca3ef44a70110cf/
         arc | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/c4fb996f68bd55a5162f2416e43ea5ea6f5bf0ad/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/082a30ed94191477d384c2790932f7991fab5988/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/cd14fd44d6211e6de528241f941f87dc5d6a0577/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/58d81bb581d83afee48c6c3248fae6aee9265a99/
     powerpc |           xinetd-xinetd-2-3-15 | NOK | http://autobuild.buildroot.net/results/7a295b9006f3390a0d6ac36d7fabdfad1bf418f1/
         arm |           xinetd-xinetd-2-3-15 | NOK | http://autobuild.buildroot.net/results/2a401e734121058fe3bfd77cdda21f3f3cb35b62/
         arm |           xinetd-xinetd-2-3-15 | NOK | http://autobuild.buildroot.net/results/aa364347d8c368dbfd17e4d91071e50784d38879/
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/169673c857760e39500876e9d603eca418c7aadc/
        bfin |                     xxhash-r40 | NOK | http://autobuild.buildroot.net/results/3a824c18c8e7536be827daf6c624cd11179c34e6/
         arm |                     xxhash-r40 | NOK | http://autobuild.buildroot.net/results/39213eb26b13a1de332a62dc8ad504c6a9341c16/
       nios2 |                     xxhash-r40 | NOK | http://autobuild.buildroot.net/results/2cb71964b8b25d04d8cf474519e8a28e59c566df/
      xtensa |                     xxhash-r40 | NOK | http://autobuild.buildroot.net/results/8be86fc4fc74dcde93dfa729b3c1608cfaa5b03d/


-- 
http://autobuild.buildroot.net
