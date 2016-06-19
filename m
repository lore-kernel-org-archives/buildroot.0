From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-18
Message-ID: <20160619063029.EE1481028F6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-18
===============================

        success : 154
       failures : 162
       timeouts : 1  
          TOTAL : 317

Classification of failures by reason
====================================

                   efivar-0.23 | 19
                flannel-v0.5.5 | 7 
                  boost-1.61.0 | 6 
snappy-1ff9be9b8fafc8528ca9... | 6 
                   libxcb-1.12 | 6 
            c-periphery-v1.0.3 | 5 
filemq-e59951489045825d6fc5... | 5 
                 linenoise-1.0 | 5 
                  autofs-5.1.2 | 5 
       liblog4c-localtime-v1.0 | 4 
              e2fsprogs-1.43.1 | 4 
snowball-hdmiservice-f75c99... | 4 
                 civetweb-v1.5 | 3 
host-gdb-6be65fb56ea6694a92... | 3 
     python-pathvalidate-0.4.1 | 3 
libcli-c63c9d35144939c8b4fa... | 3 
              host-libxcb-1.12 | 3 
      kismet-Kismet-2014-02-R1 | 2 
libwebsock-3c1615eeadb0b582... | 2 
              libstrophe-0.8.8 | 2 
tinyalsa-f2a7b6d3d81bd337a5... | 2 
   jquery-datetimepicker-2.4.5 | 2 
    erlang-p1-stringprep-1.0.0 | 2 
               linux-pam-1.2.1 | 2 
             bluez_utils-4.101 | 2 
                   lua-ev-v1.4 | 2 
                   libndp-v1.5 | 2 
                beecrypt-4.2.1 | 2 
                openmpi-1.10.2 | 2 
    bandwidthd-v2.0.1-auto-r11 | 2 
               libcap-ng-0.7.7 | 2 
              qdecoder-r12.0.5 | 2 
           python-pydal-v15.07 | 2 
          libmicrohttpd-0.9.50 | 2 
                    owfs-3.1p1 | 2 
                   fwup-v0.7.0 | 2 
          erlang-p1-yaml-1.0.0 | 1 
                mongrel2-1.9.2 | 1 
                 mplayer-1.3.0 | 1 
                 lvm2-2.02.156 | 1 
                socat-2.0.0-b9 | 1 
           python-dpkt-1.8.r98 | 1 
                    lftp-4.7.2 | 1 
            libopenh264-v1.4.0 | 1 
                    pppd-2.4.7 | 1 
                     gmp-6.1.0 | 1 
                  cairo-1.14.6 | 1 
                    libiio-0.6 | 1 
               opencv-2.4.12.3 | 1 
               netplug-1.2.9.2 | 1 
         erlang-p1-utils-1.0.3 | 1 
                     php-7.0.7 | 1 
       host-go-bootstrap-1.4.2 | 1 
                     vlc-2.2.4 | 1 
                   open2300-12 | 1 
         erlang-p1-iconv-0.9.0 | 1 
               libepoxy-v1.3.1 | 1 
                fcgiwrap-1.1.0 | 1 
                   ncurses-5.9 | 1 
                 leveldb-v1.18 | 1 
make[7]: *** wait: No child... | 1 
                    faifa-v0.1 | 1 
                    gdb-7.10.1 | 1 
                 lvm2-2.02.155 | 1 
           linux-zigbee-v0.3.1 | 1 
                cifs-utils-6.5 | 1 
           erlang-p1-xml-1.1.1 | 1 
                 opencv3-3.1.0 | 1 
                    cups-2.1.2 | 1 
python-libconfig-b271c3d9da... | 1 

Detail of failures
===================

      x86_64 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/0abd5476b39a6bd192b5e610006ed585ffb2e139/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/ee37ab51cd645e85693a72e2c43023fe4e730471/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/a3df61271cdaef0312f05455e5fb1157f8f49115/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/6a54711c22fe38b024b8fbca7c0a29787eb5c945/
        i686 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/98c0da93b510ff6c6fd0c4843e13d8fadec161f4/
         arm |     bandwidthd-v2.0.1-auto-r11 | NOK | http://autobuild.buildroot.net/results/592d18f2aba8a8cef4f6316b308ff90db0d1d401/
      xtensa |     bandwidthd-v2.0.1-auto-r11 | NOK | http://autobuild.buildroot.net/results/6c0fee6c451d9d095caedd77dd1024b1fc15bfd7/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e453cf68a001b3581459990a50a7fe5c6abe2380/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/227e3d78c5c9ae0182f9088fcbd4ff2c7398a6d4/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/111b019f490d0837a13b2bbd93bdb8e854759e91/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/54688f37d5d6238b652b20566df9806f87d98f10/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/24e5ed0a8411ef617ae292c9ceb3b65d8b9bdfd1/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ba370fd931d7ade2aa29617355c1ee7c62ae4d84/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ddd30bb0c754d907390d4f16f0f8c1a094377f33/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ba78f43474f330e5349afda146e3138e88a7e7e8/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c4f3c25bb0c21ae0c653a4b2ece9a7602a0c1a2a/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/bdd86bcb34ec798a715702567dbee549ed34e0b3/
        sh4a |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/9701a24e24a0281c0e51f50eaf6b7a4630f8fcca/
        bfin |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/daa25014c8caa2308ad5fdc73add4275411f9b51/
     powerpc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/c0fbd2ccf777a660c2e74f24ad8ac4ab0ba6f59a/
      mipsel |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/ddf630da3fb7adc8ca0e9bea40bccf170e19bb04/
         arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/e28d95d3da74cc592f107b501d90771b91497cbb/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/7ae2b0698ae43e28c95dca49c44533071c2dc078/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/dc3e4983fc816d07bf5a97a1d372a012b4f7efd2/
microblazeel |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/496ff110f222e367eac12e83bf43a7ce532d22e3/
      mipsel |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/fee6bf21401eca6748e8b1d60b2ef24ed775e042/
        mips |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/0278b545bb3738c20c5389e1c6dbcdbb9322e3d0/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/59679f4ea609775fc57de81c8c458c469bf43842/
       sparc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/169b4b3f53876149f63e16c0de9b1b5e9c32ceee/
         sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/38a3230c6f1386c139017b48c059180b7c6e4625/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/5487efc05b119609bf07c132b2b9c461e1919e76/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/2dd5e793c868cc4d542bdd512bb057bb67ed5774/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7b5f89543771efa79a5f0dcca6b4f0975bac495b/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/362bb7132fed475504ceda4a1b5d1e765900c762/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d092a762aa4625c60c61689117ca74d53b10e345/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/74490699bd6cbf7db5983864f3eb9e2a3be81ae7/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/994bb200ac71151d007c75429ced837c8b0bdc0c/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c42518be98da8280bc38534675efb4ccdd96865b/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9117fb32de09d57a0f45ea7bf56bbbd51760c6b7/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e73821c2271d337845836c211d556924475c59a8/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f4462034e20327e64dfed0c3a65ae88151d35210/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/be664f041bde3ce0d512764b63afd063f18c61f2/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d3fb02b7025ecde7bf1987a1fb282a7c0c6fba07/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6f2c7ea19b65d9fdf26f6be06ecbd3c151800191/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/994f2764fd69ae6990684dff652eb84fc24369e9/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/42fd567d530b2653e94f4da4a647a01faa19b70f/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4e23ede333d43d6bad8ca093f4a08a89d7494dfb/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b99cd837f6216f0a0f04f749aff444de9fc261ac/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/bdc62376bb189b6684e5155f82a43a463930c506/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a299e8304ae8b60b5e229afb8ccf11de7319fe1e/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f3108439ffab6e04ab0cb7debda0f678d8a39dd3/
         arm |          erlang-p1-iconv-0.9.0 | NOK | http://autobuild.buildroot.net/results/48640f593ed9966feb3b0c06240e34c17d73d165/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/662d2f115bcd98c63b00b5dcadb50086941b75da/
     powerpc |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/256253f7140c6e23c4dd33a1bbc7e115acd2ef89/
      x86_64 |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/b0d679bb89f06de2a459a83d51d17176a227b43b/
        i686 |            erlang-p1-xml-1.1.1 | NOK | http://autobuild.buildroot.net/results/82cad7ad9fe9054dab836179f03ad2475369b123/
         arm |           erlang-p1-yaml-1.0.0 | NOK | http://autobuild.buildroot.net/results/e1070e5d3d1f25b203584a5f8441719ffdcfcae5/
microblazeel |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/183720f99f4b3b2ddc4fb7f367abd2c4d504d164/
        mips |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/bba36edf20a490b468bebc9cf234aaa079a2ee44/
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/93ff4ec19c52185830f42c7f5ce0c47d9b0eb815/
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/b8016561f1ca17ad6772d7a15817869287cc1863/
         arc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/663e316a9610b2dee6a202e4031e93a337562e39/
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/dfb0bac020de3ef34b286d64f3e5d27c639a2e19/
        i686 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/8207e327cc0c4a74c271f08ea147378300f18f21/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6b86acb7981036df7d8b1f48f1aaa0cf2c310c55/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5dc6b832ae864fc1838406393584a6825e5ff96d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b8a6eebda4eeeee36e52e9a26fcc9077037c44f3/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d3cb5368cd3798a79ba06f9218bcd94d63a9cddb/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5420ab6f0aac8440571bb50b50839f8e5b439a33/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/54d169f65d9e080d560ee3e42b4a38a4f838676d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/16e69373b037d2adfb8f884626411ef753baf233/
       nios2 |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/316f317689c0cbbf2240107d29cc9006c74aa512/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/21c34621ebe5d29f8be25a57e70391bd8b31b242/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ff4e11b71c633f1a8dd7e0052d08bb1ddb12b250/
         arm |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/4deb73c3be7b904ee28d3ed7a854858afbeafafe/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/84d10885669cf4eba56b645322f0794016978f91/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1cd2729ab15427a8d81ec2ac55cc27e4c254d47a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9bac4152a168f61bee0e97f456aa4551dee6a679/
      x86_64 |        host-go-bootstrap-1.4.2 | NOK | http://autobuild.buildroot.net/results/790cb712ddae72eb7213b16e6bd08c3ecb51401d/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/9a20bb05ce463a4dc9fcb0dafe75a5f4cf7af7b4/
      mipsel |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/89fe252a476bbe606a97c25c41c51383dfffdd1f/
        mips |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/2b6b9dacbaaf5482909011d693c437a31e0411fd/
         arm |    jquery-datetimepicker-2.4.5 | NOK | http://autobuild.buildroot.net/results/ca254efa8ecfd2ee61617d610d10ee492ac2f1e0/
         arm |    jquery-datetimepicker-2.4.5 | NOK | http://autobuild.buildroot.net/results/2d47d707c1ace7f55a08fbe26162c110375c7d32/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/d5a0aafe6cb1f3ccc1030961793e95634c0e9605/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/31480c6c88dfc9080204f950bafe5349d0faa1e6/
         sh4 |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/fc475b4696e2c08c4640d451f8afdf8c5820e4a8/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/13aa303bdc7032e2656933588daa148dbeb18eb0/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3661a49143bdbbf283a9f1f4be982e190544b32d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b59f4fba5376d86f1dcf80419b5606ec7669653f/
microblazeel | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/483073e60ab4d320d2dc1048221acc17b6a4d4fd/
    mips64el | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/f5ac8a67ae52827db1e89252eff7fdea270b764b/
         arm | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/9a2378a2c623451686496f7a76d661282949dcec/
     powerpc |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e199c6a0764f9c1314795c2d4699cbae3a98a8b0/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/9eddb9e97066e1660a3e0e8afe3d92c27de046af/
        i686 |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/28ff1603d7f9ee8bed81e2eb713d5def058b9c59/
      mipsel |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/64c6b4aa36e36004eba2022cd6df0c9456021e59/
         arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/81436e29f246be8b784fb9c8ff8eb12ad783e0ce/
    mips64el |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/e57da53c15f4844b34353154720820aacc9e437a/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/3ffbbbab2fb5ead5c1a426480b59c4547c4e42cc/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/a046b89c9bc17ea228105ebd386cf3159b66549c/
        mips |                    libndp-v1.5 | NOK | http://autobuild.buildroot.net/results/f55ff744e1fdc44d2a7b77ab7c2274f4c54dee6e/
         sh4 |                    libndp-v1.5 | NOK | http://autobuild.buildroot.net/results/9bf67bb1ab1ae721706ae2b8f4c384071fc0bd94/
      x86_64 |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/beba724f8716f6d4541adc0412885780bdb3d777/
         arm |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/b420d52c49ab228f9599f9e03bb55ad3e4dd0fda/
        i686 |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/847813211e29bdf8b986696ba5fd5d561e66ca2c/
         arc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/c165bfa46f14d959eaeaff1e755443b5e01100b4/
        i686 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/4ae565b927a7f417eb7e26aa3bd3b02e680d4fe2/
         arc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/daa787c2fc29551aa4a09c63090f80e138904aa8/
       nios2 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d33a482362e1a8db603515691f96c8dc637bccce/
        sh4a |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/7ff396049cb113a144bdfb6ec062a7b804c18f2c/
      xtensa |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/746f4865c9fc6c978bd5ff10268a37f618a84461/
        i686 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/a104a2927259c1cfd4e954d0a5c606763c20bec3/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/405dbdf899e2917a64030903699a6c020d608e9f/
         arm |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/8cf28d1eba4e21cb30690a5775eb90a1b93a1fe6/
    mips64el |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/b98fd1a928a2f621e0ce3bc2e632d6a32f07d498/
      x86_64 |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/ff9c296b558f1e548e600a3d888fe5b323046442/
         arc |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/421ca34e9c8adc61251596d2421aef96f2bfacb1/
     powerpc |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/4a549d249ff9170c4fae694ad125b424eeca57fa/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2a1fc80d56126b10e2d89587c86056645685dbca/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/93a3f7ccb120bd712c2792af6090fae6fc480370/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/828f186c1d0f6cbfbba6bf54c4d77ae4143d35a5/
    mips64el |                    lua-ev-v1.4 | NOK | http://autobuild.buildroot.net/results/1b5c35f41f517151dcac0eab36600037dc8b4479/
     powerpc |                    lua-ev-v1.4 | NOK | http://autobuild.buildroot.net/results/998d55b7a325b6d239ac54ff5562eb1f404ac384/
        m68k |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/5dba7f2c3647b22b145ba6d0c73745d2b10c4472/
         arm |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/f97cc762ed6bd9d1096fc4e0b4decb6de36d4acb/
microblazeel | make[7]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/83fe2d5a37263f4ee63264abe27fe44b2275537d/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/5ebcece8f2aa96ba8aa5db77cdc89de826384dea/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1145f75c0cde4379ceed0cf0a4c221e3d1be88ea/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/6cec74be017f5ba44cd024ec7eee5eed261eb59f/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/681997ec9e38365b5a89c290328d60ad99827d96/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/b928679e219b67b5b6289781019c126f0e005429/
microblazeel |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/a39f3f085c2d02f6ef28a1f9a6f7ff0da699de79/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/d2ab44f7c6bd4851288199a8bdffe16791576bb3/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/fa0cce35958efbc5995057c79603ce5ab5b2c296/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/5d2eaeb728190883d3e45be7f46042bbe83950ba/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3619f47ccc333467b74138e85f73aaa206a25e19/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cfa17ce79287dd4a80ba4dca4bf936b82015d3c6/
         arm |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/e9cd97e0517f8f83fc6d17ce5594acb94753e4e5/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/008bc60351810c48f97524875d33236177f27b29/
      xtensa |            python-dpkt-1.8.r98 | NOK | http://autobuild.buildroot.net/results/1e22d7638e53debe12d0c85e1296cb9899feb98f/
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e622ac0b55e734b6211e6b3a6f1296ccd653fe27/
      mipsel |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/1bffb7ccff7cb200b8f391d7a678350868c1cfdc/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/d0deaed98acdd48f22d47a439387025c01d5ba31/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/5ff94ccd2e6280a56e8cef2c0276c35ad58e5cf4/
         arm |            python-pydal-v15.07 | NOK | http://autobuild.buildroot.net/results/f061380277e11ff303d00d682ba7bd31288f4ec3/
     powerpc |            python-pydal-v15.07 | NOK | http://autobuild.buildroot.net/results/2c92f291171dc84f7da618d7228d0a89c648009e/
        bfin |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/6d550d972eb393312b2ab7fda5c640ae9faa1290/
         arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/52cc2c7f82240b18abe604e627de406eaa4b0cc6/
        bfin | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/c2ee9f2a27b2e73e27cf0d60fe64fd59bda5dde2/
     powerpc | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/a0366d6a43a32338d7862e95fa45784ae7b4c096/
        i686 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/414cae27731af3149dfca94c1e6ae0851362480c/
      mipsel | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/d27e62f9639ae48f0f247edc54fdca8816d96cce/
      x86_64 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/d7a2a95d1e09569f207f42ab42c867531be865dc/
      x86_64 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/6a1e71dade8d95adc90671d79c68f0afd0fef1a0/
    mips64el | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/7ace486c6973c43b3cf76144e845e2436574f09c/
    mips64el | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/01f2c7c33e914990c76d726f1afa8caa46193be6/
       sparc | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/cfedda49bc13e053bf96e1d39f119a40fcf3816c/
         sh4 | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/aa2053c850107daea209106b31d4df20e9e6de0e/
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/8712f454787f751d6f71d72644352f5e1b1aad01/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/0ecac6498440b0e13c43d314ae7020a69f516c24/
        mips | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/a59bfbc7db8f69cce0acf844e94cab8bd01f6592/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4621c7710eb74c5190f40941e63502375b927b4c/


-- 
http://autobuild.buildroot.net
