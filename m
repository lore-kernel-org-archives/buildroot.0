From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-15
Message-ID: <20130916063005.0F31A52C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-15
===============================

        success : 61 
       failures : 91 
       timeouts : 0  
          TOTAL : 152

Classification of failures by reason
====================================

                    orc-0.4.18 | 11
    trace-cmd-trace-cmd-v2.2.1 | 10
                   squid-3.3.9 | 9 
               libglib2-2.36.3 | 3 
               binutils-2.21.1 | 3 
                      pv-1.4.6 | 2 
                 binutils-2.21 | 2 
                 qt5base-5.0.2 | 2 
                 webkit-1.11.5 | 2 
                 libnspr-4.9.6 | 2 
               ruby-1.9.3-p429 | 2 
                   cvs-1.12.13 | 2 
              e2fsprogs-1.42.8 | 2 
                  zeromq-3.2.3 | 2 
               alsa-lib-1.0.26 | 2 
              liblockfile-1.08 | 2 
                 ffmpeg-0.8.12 | 2 
               qt5webkit-5.0.2 | 2 
                  connman-1.12 | 2 
                      icu-51.2 | 2 
             gstreamer-0.10.36 | 1 
                sqlite-3071700 | 1 
                      qt-4.8.5 | 1 
                 libffi-3.0.13 | 1 
                 libpfm4-4.3.0 | 1 
                  ltrace-0.7.2 | 1 
                valgrind-3.8.1 | 1 
                  libnl-3.2.21 | 1 
                 cairo-1.12.10 | 1 
                setserial-2.17 | 1 
                 libevas-1.7.7 | 1 
                  nettle-2.7.1 | 1 
                aiccu-20070115 | 1 
                 dropwatch-1.4 | 1 
                libiscsi-1.6.0 | 1 
               libcap-ng-0.7.3 | 1 
                lmbench-3.0-a9 | 1 
make: *** [core-dependencie... | 1 
               audiofile-0.3.6 | 1 
                 fdk-aac-0.1.1 | 1 
              cryptsetup-1.6.2 | 1 
                bellagio-0.9.3 | 1 
                openssl-1.0.1e | 1 
             tvheadend-5956233 | 1 
                  tstools-1_11 | 1 

Detail of failures
===================

      bfin |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8a56290bba09843b8d73cbb804620e3602fe52a8/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8914fa33b23776cd997b2d01b6c987a34566b34c/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ba0860c394a2d30d576abec4ce6a3f57c26a2311/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f6e2432dce0534dedcf64cf1e93d6557d95aa3dd/
      bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/76ebe0b9e963367427e23ba963f1bce6fd2725c4/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/bfd538d902771efec82a7b08c76091dcf87d0c34/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fea7e48fc77520f9de650eb8af1d1e08d29fc2b8/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/244ff44c24ab193734ced8c8031184a73b4ca615/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/9196cf3c981b2ffe1045f8eaa0a38adead602ddd/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/13eeb5011da88f5c321d87374740fa9921099bf2/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1e6ee47f67362d5c869165ae1b7230995a314182/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/6ed54275a4f067c25fd5b23da77e2bd7cd3e793a/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/aa6de901964cb89f8bc15e84c092858609ed0563/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/238a600b96a9c4da739b1cf114dad922bc5e944f/
   powerpc |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/04097b08c7732ebbf2abff3f8fce7e1428083081/
    x86_64 |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/ba597e5d3419073b85b6361964533f0e3087d9c3/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b23f9632e4cb50e2e970cc017f8ef40604d09e03/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/73f5fc12c1150435110864faa8a94e70a2e50735/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/dcc44df6ad46d6e4074d0581ab5edf51ebfb0925/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/a7e24ecd7289daa9cf255fbf67379bba9aeb76eb/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/f837abf2ea934d499589e27a332c1ab92481c915/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/003ac594493f953b74da4a9070babd85f28c7537/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/7e2ea8029e847def4d94bd6543ffe1d59b297f36/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e87670c775bc87887a9eeafb0818b19857dc0324/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/004f94e9b402c34331b6ee299da00dccf1dac497/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/f424a76afaf132d47af32577c81177d66cc7d985/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/132e99b01fa12cb72413c3ca9456e6b8f79e754e/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5e18b16432da5192c433e98a2996116d24d27fd9/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/141d20727e6ce12fbaf9401c8a09dbd56c8ff9da/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/bc082e926c08781253f099598e455442349d02b5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/27dbf03072880ccfe5af71468f39225012a5c7be/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/304a194fb35288eb4ccf1d55f6430d97c5aa2bfc/
    x86_64 |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/b5d071e081a0fea70b8eca63944268502322645c/
   powerpc |               liblockfile-1.08 | NOK | http://autobuild.buildroot.net/results/0f21fe2585aa4bbcca6bb2e372df889937e0a2cb/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/7617a38281b1273b48b381a00b6aba9a7ce4f59e/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1673c5b4a8dede1723f4c9e938084caf1ef880c0/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/14bb21a686984a48dce297ae43d5872ab9b0fdbf/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/55461a5166de2b3b6a3fddc01b90dd25fb6493a7/
       arm |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/6d81faffb8b71e43bd9d138a39969ee13b7fb7b9/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/15f4b0f86ca06f2870e8dff805710975d24ef9b5/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/f8764583dc6dc543d174e170210379388ee264a6/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/852095c5a948fab685c9ce1cfe9d76a7489f78e6/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/905ca862d2eab6918b7de90cb63e840ba86e7c9d/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/651a70378f937e7c37a13bf3448b8c13fec29a4c/
      mips |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/780be3d762022d3daec7b5be668877bbcc1e1d47/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/9b39e146b5471cc7330173f9653404eeaeeaa129/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/afd1f7b17ef0512a27f8fd5a457764cacfaf3b7d/
      i686 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/a5fa4fbec9782cda66d9b42e317a4decfe7e8c7f/
    x86_64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/b0d506f01720605cfeebab85e906e050974fc037/
      mips |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/ee6b90d514e90d36228b5d41b908327013d4a198/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/7a7c0034fe1a4f6e5c438919617c2782b836befb/
      sh4a |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/2347457f10a1cbea32548d9246d6ca90853d4376/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/c603e397becc3a45e30c162cd4bb0a10207421d9/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/fef482c15784290ea93d424a2efa0e0d6a3ca76b/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/09942da555b8fde65bad3da39b64395ea5db801e/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/2e41f1e2513e7ee5eb58fa7dbbf7e3f785f9e402/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/6bcfd99cbd5626b5b8143b9e91724dde76893f22/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/242001bf6196a9bf56b737b8846cedf3b60266a7/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8c7eaf99e365ecff28c097475b235dbe8d614294/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/fe35d041b0db062bc4bb708e81d36599d1d54822/
      mips |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/e11ec8bb5bb2c514ca20e696152da8f09303f554/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/8e31eb885bc0608a4f3406c43130f724ba3ce000/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/0de1ef7974ae9f5376cc0a8d0a5ad77c8f5dbd2f/
       arm |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/1f6f26184946b1913e6edcfeeac495bce76e3130/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/83e1c24fe9419752ec94a9f989b04eaa5f4bdb7c/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/4adbe6ada9a2d98597376c0e5c71882727a34b37/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/3ee5ca1e514c9e522affcd01fbf2573571f7ea84/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/772c36d1d9a9b5b7cb3274a32f485ded82b258a0/
      mips |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/978d5a2ad02bf170279fd58885c95005b06603c3/
   powerpc |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/f79f07d34f7a11692848249a865acf78003b4d5f/
      i686 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/e64f510713cab393a572ab9a877a4fe5e79c6c26/
    x86_64 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/01dbe36c0a2cff7602873370c238615df7bb5e6e/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/5b3726435901e0016733d4d9c8f42b2973d80b70/
     avr32 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/82d9fdbe4875ffafebc8b5b7fce4c3b8c07a5bc3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f3e6fbe7de26b903c974835aac4883890fa40b53/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a4e5712525df4f8e7d9452bdefe25288cebdb181/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/62317d2d9e4fcd74d2b6b55f73b66875a13e1d37/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7d75d7afbc97aa50d65b4a357861cab36e7def64/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eecbd29d0eb158c9f7d9342ea6142fa2768b0bba/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b1748db2f279d991aba398ff2c4b6a286e2d2b8b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f67f245a0c4a7e0c68c56b999fea99fe58920f78/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/13a56f1ba0afb0111913114f2963ffd24101c304/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ee46f7b7001624f66dba311648050a2b20782001/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cc0cce2942a60296e2cc966e36892d55a6adfece/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/c16db39462776f3f01edab6b4640d9821dfa3f1a/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/26627886843d49d3cc095ecfa402f55bfba25127/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/27851896b19ff2db9d17436dd062a6564bfe3167/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/332783fb6705d9ad7d3067b5b5a2bf1f19b9777d/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a85657816ee471f5b23b83c361cd6f19d6a5c6b1/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/b9f0d4dea62682db2146f078810855dec01200f3/
   powerpc |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/5943e251856932a303bd68f02ac81debc94aecd9/


-- 
http://autobuild.buildroot.net
