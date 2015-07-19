From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-18
Message-ID: <20150719063019.D4E9010183A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-18
===============================

        success : 231
       failures : 120
       timeouts : 2  
          TOTAL : 353

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 23
                libtirpc-0.3.1 | 9 
             qpid-proton-0.9.1 | 6 
libsigrok-fe473123ba836445d... | 6 
                  zeromq-4.0.5 | 4 
                  boost-1.58.0 | 4 
                 setools-3.3.8 | 4 
           host-heimdal-1.6rc2 | 3 
             btrfs-progs-4.1.2 | 3 
                busybox-1.23.2 | 3 
             expect-2014-05-02 | 3 
                  ffmpeg-2.6.3 | 3 
                  cc-tool-0.26 | 2 
       host-erlang-rebar-2.5.1 | 2 
               libsigsegv-2.10 | 2 
filemq-482797b8aa30fcc9ea13... | 2 
                 mesa3d-10.6.1 | 2 
               libglib2-2.44.1 | 2 
          c-icap-modules-0.3.2 | 2 
          usb_modeswitch-2.2.5 | 2 
                      icu-55.1 | 2 
             lttng-tools-2.6.0 | 2 
                   audit-2.4.1 | 2 
  toolchain-external-undefined | 1 
               ipmitool-1.8.14 | 1 
                  mysql-5.1.73 | 1 
                 netsnmp-5.7.3 | 1 
                 jsoncpp-1.6.1 | 1 
                 qt5base-5.4.1 | 1 
                    ustr-1.0.4 | 1 
           modem-manager-1.4.8 | 1 
                  cppcms-1.0.4 | 1 
               upmpdcli-0.11.0 | 1 
                   dhrystone-2 | 1 
                  bcusdk-0.0.5 | 1 
               harfbuzz-0.9.41 | 1 
                 clapack-3.2.1 | 1 
znc-b396cafdb249544164ed029... | 1 
                netatalk-3.1.7 | 1 
             dosfstools-3.0.28 | 1 
                iproute2-4.1.1 | 1 
                 libebml-1.3.1 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
             util-linux-2.26.2 | 1 
              strongswan-5.3.2 | 1 
             libselinux-2.1.13 | 1 
                directfb-1.6.3 | 1 
                minidlna-1.1.4 | 1 
               audiofile-0.3.6 | 1 
              lbreakout2-2.6.4 | 1 
            c-periphery-v1.0.3 | 1 
           libfreeimage-3.17.0 | 1 

Detail of failures
===================

         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3e4faf554fe445bac49e0999604efe5d70d13d16/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/895e2d9dc35eddeafe70db9351de29d4589a6b75/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/964f3dce5840b753737e1169061d1efed19a4a84/
         arc |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/e1382789bafc2fb90d4b2073c4f69e829025c482/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/f31131a2108103b42fab5bb6b35110231a2bb508/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/a1779788bfd9bb07795ec112b4e3cac208ff39dd/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/164a06bd42f62eefd7f0e7a48bb82d46225e55e8/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/fcb6fd84414dc32e6830ed6feff020c396f0dafc/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/a0102ce6c41b3cc3dfefb531ce687b58a53f4bdc/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/c52cc95c9fb77e1ece5ebd106abf2453a997f923/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/a12025376ef3f1d769dea2e3d1d561ebbbe26e93/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/de628d84b0ed49be8f5d021c789357b2e66f2b02/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0d3a66978be387aee78f5c70100cbc947f6f9adc/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/486c19be9acfea3c17ab1f8a410ee607feca37e9/
      x86_64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/e85a9d1fe2ac9c384356c0df67d1c63680c1477e/
         arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/fa310898615df2e428121025e694109e5ff3c69d/
       sparc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/6d2cc07e9c2fffd81b4bb29d94d68056ef01eb0f/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6bcb6e3211491617bf54af22b198d9d032ae5106/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1e6430a4eee10f2929d2b03ec5e97bfa35bb73b1/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/3e102716a972b99bc14ad4f44405fd2689874e37/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/178c98c96b8babcfbb73a04a34a2f1cdaae12ac9/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/716cb495ef586732e7b6fcecc8a646674ba398b4/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/8e45f8bdf57b74b54dfe59415b18636fc8ae1fe9/
         arm |              dosfstools-3.0.28 | NOK | http://autobuild.buildroot.net/results/e808e692220ced315d30d8ee9c93bdf4a5e32a03/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/975f042ef1662481e4b4636de535cc8c29ebf96b/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/63874b69eb4e1fe7a45c72d370db1e381e8e64a5/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f0b603094581c1dfc89e7e0a60398d3ed8307c19/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/69eb0e10c06983681fd65cb094c9731b9f117047/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a284aed304ad12b0ea6367e472024ae538655f00/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6e1d8669e417882fe7931c88aba18affb984282e/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d026ee5e09fc3677b19f66ffd21373eafe19c9ce/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c26559ecb80cd5ce6488b7434dba480dc1bc4ed1/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0c12c6094b43c9f567f34e04276df9fb8722781c/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9c6313f6345444b2b00439db5f991a2f1af7fd9e/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/aa4ab36592a162eca2021ccf4f81c1fa57dc688c/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/41bdd9ffabc91333bfc33889faa6a90091bbc61d/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/36ee70f76aa6f1cd7aee06f14421111528e961e8/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/36bdce23b28d8a7557c4391f19e2212ac911e9f2/
        sh4a |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/839b432205d6dc399e41152f2da03d18d979a08c/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c14a3a9ecba6e549b0bd363b133f0a2f5b67653d/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/11251ebbefbb8ff73ce35305ff2f074d0357aa0a/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/59ea9327f67c2cedeac90208499bb3dee8411909/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/df0b78ddc60b999fad2643eeed90736860313aaf/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5f97183a0008d773724592e0a6da11b83971dd14/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6db480877a6d5ac67d42f28c77f1841103d905bd/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ee72a04b61188051dc72ef19ab87ceee1ace4106/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a82f2910b3ce95f557885e59b05aade62bacf325/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9665ff8ba864f1390c3c70d3ad2833c9d135ef7e/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c27ca3dd399374821e44ec20809c7d2068bcf620/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ea15379561cbc1a346d71e8717be47245251c5a3/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/3057b16357023866e88def323e4c748d376e23da/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/e85da6dffb116a69905969a86d84e2168b9a6e30/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/ad146a852c35c32a14b0bddd187e5a46ff9e7660/
         sh4 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/906aeba040900a54f9aed7f8dd5199daa5190491/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/dfb12e4cc124ae42595ba1419fbf73643bca4c81/
      xtensa |                harfbuzz-0.9.41 | NOK | http://autobuild.buildroot.net/results/80e413e601eeb169c6ca1240a7eb682a34de6183/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/9d7faceac6c7218cfb9a5b6348894a058847cf33/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/de7db1c12485570e2cc68757d9d81f7bdef6d402/
        sh4a |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/a03edce55239a689ddde98ac4b8eb27a8a7242ed/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/89bfd133fe1f115b7a1e5742b9d01e32cbe5ba3a/
     powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/735958de7371106fd61eccd4b1d0e5ad2e71369b/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/9b11856207dbe70c1463cfacffaf52cb81022aaa/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/e31d5869d13ca9df16d9797ab98bce1287201981/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/d200fe7dbeaa9554c8df925bc37b78ce4e959926/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/4537daf935258a04c01015db87c46c843a6cf42d/
         arc |                  jsoncpp-1.6.1 | NOK | http://autobuild.buildroot.net/results/edc20d7bec610b378e7dfa9a50c84ab6be296df1/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/10d89e41458133563f6ba8cc5772b552d7bc16c2/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/162925a1eb34ca6a415d76f6aeb6c75f6212bb0a/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4d09fd208f0d953f797f66b8b45e181c21d3ae74/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/26dfaa3bf6b68fda7d12ea3ac60abade3f21bb55/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/444a9a9704e1645e078bdbbd95b3e957f3771633/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0bb2da20621a41e29d0887b663ae36bbb9355ae0/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/8670f70ad2a67856aa46f9dcc6fe37b3d24db03a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/72a04eef6d42bb66cba5ad07dec47b4e681ecc69/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/a19575a689c44243bf14a232633fab533d512127/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/bdd517c6361c6135ad69bda84ab56d1c8664d1fb/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/465b3219e7c1c81ca8e559229e9594225df283c9/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/5a12b421fcc3d833c578c50feb73e1bc9fd72e24/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b535b46405159cb06f043ae1c245126bc01f07f5/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9512fa7261db209abd21de1202829a4b1894426d/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/8f8e4af8fc4b3b67c44c2ee205a00823061f596c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d8640c03fe138887ec29ea3b21824229ee4396c3/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/2d7167b57b1dc49e6574814ad313ffbc6702df00/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/1a82a1f97d96bd0556a9d3ec6db6d683c54bd55c/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/e68d61a22e3ff88351f879609b331e92f9fc8208/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/3b0ec3e24bbaec5259e4e5a77f81437dc36d59bd/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/e8be858c9049a7ac4f09208e4612644c63d65902/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/91438f09fc9abfb339a55262ee8165e6e6d9831a/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/782d6e2068b7fdadaa733892f5bbd85af1ea7bd5/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/f3df9f4ce2b9dd01fe9ee12cdb3f8985160388f6/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/335171541dacf413b7b2417d2ab279259c7b78ff/
      mipsel |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/7b05ca4a952030ef5695d9f0faad2aa9eae90c00/
      x86_64 |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/c6c1d01d55c748ce3b12d4c04f01ada8e0fcf608/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/c9272e764aa55ac58a5fc11169e0a8084d050d20/
         arm |            modem-manager-1.4.8 | NOK | http://autobuild.buildroot.net/results/47c7a979fcc46b96483555807de90b4167a78d00/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/83c2481cc5e79560b3f65c9c3229b5c2bab44242/
     powerpc |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/2c24e27ca6c8a6101df62c157840c59d40d842ac/
      xtensa |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/7829e74f83c3c4a1f45e049ec9f9d6b00e002c1c/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/5f924c9b65b9690770882a83d3005f7857b3841f/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/3a8f88085dbf0a253dff21dd29244d6bfd0ac6c5/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/97e292150b2512f00f2efdfd886035936429d613/
      x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/130ca4eff1b337987bbed7a3882fce7674e95c6e/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/440ed9bfa6927c1c97d48b1fffdf5f45077c8834/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/b8252ccdcfb1cfcf0b8ec8c770ca5bf74286ec9c/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/94d78a18f78223a9c95527b4e67d2b9ffbf0e66c/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/cf8953a1c183419334451f6f3ad5ec950366d4af/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2746822f106f74e7c3cbe55e3ccf2d629c1f0d74/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/13082a15e0db46c92311cfb45e06723254fd44d9/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e689ce936290c0a6f2a18d0acdd7734b331240d2/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/78723a54895b18de54acd2bfa4fc9c95cb7373c1/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6661b351d7c6ee8fbf827c348fa4942cefbf1429/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/a9ff655cc5438fdfc84334c0b0c559f9fbb60716/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/552701d18e4a1072adb6c8b3e99c94500cea97d9/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/d53350d8c0079c077b775854cd81910ec9108550/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2e136e63141a13059bda3d5c9b3e582aaaef783f/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/d00daf76463763e34f44cb2e5d661112c0bb0195/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/60f0eeb4cd3f7fc6a744553ddbfb9c88e063c7e6/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/744578f51ab61eb9d3e0ee9b864ae3c3f7df888a/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/879b90dd2c085d04d02d6c23da3b2583b3c3531a/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/eeacb86cbad5cbe3e50e7d79cb878fa9808734ec/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/32862961a0d9278e50c04c5e3cfd96c8b249bae7/
         arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/3985e72ef3966152ddb71c2b347c3c0cc31e4902/


-- 
http://autobuild.buildroot.net
