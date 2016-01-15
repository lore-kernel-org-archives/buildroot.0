From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-14
Message-ID: <20160115073021.DAA6410303A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-14
===============================

        success : 183
       failures : 120
       timeouts : 3  
          TOTAL : 306

Classification of failures by reason
====================================

                   assimp-v3.2 | 17
                  libffi-3.2.1 | 15
         python-can-legal-info | 11
                  boost-1.60.0 | 9 
host-vboot-utils-bbdd62f9b0... | 7 
              luabitop-1.0.2-1 | 6 
           uboot-tools-2015.10 | 4 
                python-nfc-212 | 4 
                   libnss-3.21 | 3 
               libcap-ng-0.7.4 | 3 
zbar-854a5d97059e395807091a... | 3 
               trousers-0.3.13 | 3 
                   mplayer-1.2 | 2 
             host-nodejs-5.3.0 | 2 
              cryptsetup-1.7.0 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                     vlc-2.2.1 | 2 
                pinentry-0.9.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
                     rpm-5.2.0 | 1 
                    iperf3-3.1 | 1 
        ltp-testsuite-20150903 | 1 
                 x11vnc-0.9.13 | 1 
                   erlang-17.5 | 1 
make[1]: *** Waiting for un... | 1 
               nfs-utils-1.3.3 | 1 
                    kbd-1.15.5 | 1 
    host-xfont_encodings-1.0.4 | 1 
             lttng-tools-2.7.1 | 1 
 make[2]: *** [all] Terminated | 1 
                   glog-v0.3.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              alsa-utils-1.1.0 | 1 
                rtorrent-0.9.6 | 1 
                collectd-5.5.0 | 1 
             bluez5_utils-5.37 | 1 
             webkitgtk24-2.4.9 | 1 
                   ntp-4.2.8p5 | 1 
                 dropwatch-1.4 | 1 
                 mesa3d-11.1.0 | 1 
                libgpgme-1.5.5 | 1 
                    ofono-1.17 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
              lbreakout2-2.6.4 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/48ea95f355e622da17b58c04c67f5ef96ec1fb64/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/3c60185300710fb103bcd0bdb8eb1bd61a3d86f2/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/91f6e865709f8763e4fed1fe5c1e82e102344430/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e60ca57cec23dac123449c673c1570142bb7a38d/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/675b0bcf574cce66ffeea48b287edd2fd44f38e6/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c07f8a9c6bf4abfcf335e4a6b72d3d7ceed85da2/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/91b0fcdbcda8f5ca40ad381a85937ae911a201e9/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0c9a37ac65667a5b3ead74097b99c0f1db5f6e81/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bc0c2da930b3a6fa5e879f8c6b7ed9d20589467a/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d5725770a3cbeb211654be7f50e20111cbeb3e1e/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b4dbd3da36ed2c1e8eb7aa9e17a22090a8fd4f4f/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e1dc63f6ecb815f0648fd5856330e6cf2052216d/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f6698f642d8abb4dd403fdceb506d7ed0a9cd2cf/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ea860afa9d714de5e79865651ac995fea9d2ef2f/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a2c3dfb8988a3b933224f2ffedc00a6bedad37f4/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/6acb8e6aea1cb13793027948904f9fcd1ee31f0e/
       sparc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/95f0a2650b0fd64d1ad78ef18680ce5bf9773c87/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/133dfdbf9812c467d81f181b3f3981686255bc8b/
         arc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/13629ba409d4840821cfd6d48877595fcf6bb9cf/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/122e21b61f399551c069216abd45bba0fbffc9ac/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/add6505cf84723b1885a45b6c35ad2a20300611e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/504c9f68a5ec197f0b457fa798e7f6934f1868cd/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3715850f2fb75e51ad3fbd1c1833e2692c258650/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bd204eab285aa5501e8e590f9fe9135cdce4702b/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7d67f5955215d7cb39dccb810e3c12d74dddcc0c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a391bc6db28c84aaf76f9b99a3145121a158cfd1/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1dea25d779869922f2e2e6e5bbe5d096602793f8/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/95f7824c93a71220babd87f4cffcf1b0ccb1d29e/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7824adf15b776af992f311f31d8f2ef97f99a46a/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/31a823ebbe4defbae28d62c8a32aec2e5dd89f58/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/4af5c30198df15aa853109d5ed50d2efb33a9f9d/
         arm |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/3418549ea1dd09ec0075dc6ca98c0860834f4d03/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/cd10868d695051a80459613f35b383a8143c328f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0794fbc33e2e2cd42e961a8897aa99e083560292/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/98cf9608437ce7888943a33af710768e7c7fe296/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/f18f5b1a86ebf9ddba819bf930464d4813662969/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/8a7dac868e12fb542dfe958b164608d6e95c8a33/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/009083311ff0ab79b6a75b8d47456c3ccc8e2225/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/7ebb56e5fdf267900b14de81ddffc707646548fc/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/2c3b75b70025d38631a552eaf1a9960815a111a9/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6fc5b80972703706ca6619a007e7a73424ead61b/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ce9c927b5f93e8c5af356deb223f96ad5e30e07b/
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a7104dfbffc0049a015e6cccbf0c2acc1d032dfc/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/298813730154de5f3ebabca77c722b3d917dd51d/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/70feefe2de11f6a2b0bdfd957cab7bae8bafe5db/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4534425ed28b77b89687425ea9b3f6fc1b7d7cf9/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/db5ded1ff49ee18dc2767360a822f3caf41f5c03/
      x86_64 |     host-xfont_encodings-1.0.4 | TIM | http://autobuild.buildroot.net/results/977c050c64f9007ef009c313f0c5ebf2052e72a7/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/efd241ecfcece28b4541ce19851418a1a4172425/
         arm |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/5357953e763a1ac4f17332abac54ce2946629a41/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/8549ef60b366d3c60413e5776aba48e34bbd1eb8/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2c6cc56b8d103c661b7ec66f5216ff6dc72ff02a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b2c0b150a575a91cb6f3baaa8adf37336a6c2a5a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/f860c8faaa085fd2f447f12637ad9a7aefc6bb53/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ebca63b83fe047c302f1d00f0f0a3bce7049b58e/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/15e9d04929651868fb861d4ace9892bc1fecfc0a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a7f489cc8cf1220ada230729a503067c4b45f16f/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0a20f00b987c306d5a12ec1d8d1791981838846a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cfdaf5fefb14970ec6f003cf97485551ea8e87ce/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/eb5a5fa29b1fcb27ad28e79cbb4de9619ca0105c/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dfa06de4fc620c87e6d5f2ec7399676ead95295d/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7239df9994611a0ed2298ffdd7056a81ff25af62/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/cb208e51c501015d818e35c1aa1618370eca78bc/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a84a26a9eed0e780b8b80f26eb74f863d387d40b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/19da6c42b7e2c7322454af6b6cc8e06f13bb1d9d/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/7f0b6c21ff0df810982a2554dafb8259ee126e28/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4d8a5f91e1ef473d6f2af76f7cae86e058ccd95b/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/082e8fac4520c119c7fc02f9bcb61eb0da76616f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bfc1f0fd13e7fe65037a754feefa21e6e1f28200/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/606d947edc1b5fdbf8fc5dd58d09ce86de2ebddf/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/1c518627ae0d02bc6affa2efdf23fba2c7ca0d74/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/45a05555b0b09639878c01199bf4895d60a0795c/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/d188ba5d2d4458f957899de5c115d6b2b1569b76/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/06b042bf2318cffa7d8978b9bd5e3b97de321ff1/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/62145b456821a9c8fef329bf19ba4dcb41c0ef68/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/d63b3cc99f85668db51ba7b37e708e2253742695/
     powerpc |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/8ceb01cd8605fa64763ef88b6b5bec958076da5c/
         arm |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/4a8553666a696c82f7075530ef6bfa7ee9ee695e/
      xtensa |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/6b3ec9ba22c510ff60ef9df077db4734379fb695/
    mips64el |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/5024b4e2a203eb9c204660ca60ae830ff927fd50/
       nios2 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/c51f55897eaadbbfe38a9d3a07fdb9ca5cae7636/
        bfin |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/7e77f0e8428ae0a603d7af78a7083930d4e0f656/
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/2b692c5ce34e0b6696e1eceb3a5359af0ac20729/
microblazeel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/20556ea4a0289a3215b713ce7b6a21fd658b4cb0/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/c81d47cfdfb3e95e0d334246fd376b39aaa87baa/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0641b362ffa25ae99be72c5c30d56102e04685b5/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/41e7776202d0cbdec92bdba716c5887b99f61028/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/2790b24212f8560059f13d118cc683db14f9471c/
        bfin |                    ntp-4.2.8p5 | NOK | http://autobuild.buildroot.net/results/eb82c65d589bda864dc898da7f11ae6466aab6ef/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/566ad6b458fe942dc09eaf2c71529ff7587a01f1/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e5b1deccc32a68176e3d75a4c4c9f317c83101cb/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f5db94379eb8e706b7ff5b7628325b1f3052fa6d/
         arm |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/089fc242f7ad1a30d56250adad18332c9bbc4735/
        sh4a |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/ed39d26ba092efbb0c4d8eb8961843dd919b431c/
      mipsel |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/04c39b79823c279e259ad32273bb03c5ed1bb7f4/
         arm |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/d9354d6be2c1e44e2ece67bb259ed36197b7480a/
      mipsel |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/81eef666b2135e63595044f5fb57048c298f0ccd/
         arm |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/a60f4252691bcf7a22af3027c15cb61259767fe4/
        i686 |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/d930623b3013c1e2eabf390d2b00c07bb4b2516f/
         arm |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/d35844d95c58b45c2a29a0b051bac42134a04a71/
      mipsel |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/087b85d9c3e0184be2261912138c1957fe61fae2/
         arm |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/94857ab5fbeb6c8544d31b931ca5f127caaeab66/
      mipsel |          python-can-legal-info | NOK | http://autobuild.buildroot.net/results/3162ae78c27e174740012851e4a57fcab58ad421/
         arc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/553fda51f9fe184a800edd4e924e63de0c023f39/
      xtensa |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/d654a26673a9650d5d92957fb05ac6e9fe8c213a/
         arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/81c929f23d7c685c01c21419184ee216e58b4faf/
     powerpc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/4b7ac08861ec9be76908d39d1ca69e0ebf948589/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/6df3fcdc26c05f91b0b9f3afbdfc5c805862cc34/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/fe5554d11854645dcbe9e2c5e412e926466c8132/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ac1e6e871a0b614473a368862df072aef83f065c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d0daf5d85b8b1ea852e691e349f594a2556f571b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8bcf8cb69b823f2975c26e17e67c151cc2eb28db/
         arm |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/cfb06d936e080f1b221d2802fe0820f1ce175670/
      xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/ff8937484a84255248a2f8aa26cf16dc2c162421/
     powerpc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/064c523d31c48094486daa34d831c76717274589/
microblazeel |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/1438e6f6046bd10e67cb403c93f0dca24d7e789c/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/c23e842784a55be26dfe7a93a70214ef78c83e9e/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/ccf11cd35a46cb2d7a9a1e7f312ba7603aa56c2c/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/0adac1322af203b57773a1414d6e05d1daeab17b/
       nios2 |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/1039e6ec8dcb7afc16851e914c4e15c13625fc24/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cb0b0abf51dd74ffd52699ceb067946cd5314fc3/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/688aaaf63932babb986675a2cce1a483fbfef880/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/dc35095aee2ec28a722876cfd07623cee39a66b8/


-- 
http://autobuild.buildroot.net
