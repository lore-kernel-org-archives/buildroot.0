From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-17
Message-ID: <20150718063019.2EBDF101099@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-17
===============================

        success : 249
       failures : 125
       timeouts : 3  
          TOTAL : 377

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 17
               libpthsem-2.0.8 | 9 
             qpid-proton-0.9.1 | 8 
                  zeromq-4.0.5 | 7 
                  boost-1.58.0 | 5 
                  ffmpeg-2.6.3 | 4 
               libglib2-2.44.1 | 4 
             btrfs-progs-4.1.2 | 4 
                   audit-2.4.1 | 4 
               libsigsegv-2.10 | 4 
       host-erlang-rebar-2.5.1 | 3 
             expect-2014-05-02 | 3 
               upmpdcli-0.11.0 | 3 
          c-icap-modules-0.3.2 | 3 
                 mesa3d-10.6.1 | 2 
           libfreeimage-3.17.0 | 2 
                libtirpc-0.3.1 | 2 
                  c-icap-0.3.5 | 2 
                busybox-1.23.2 | 2 
                   eudev-3.1.2 | 2 
                iproute2-4.1.1 | 2 
                  acpid-2.0.22 | 2 
                  cc-tool-0.26 | 2 
               qt5webkit-5.4.1 | 2 
x264-c8a773ebfca148ef04f5a6... | 2 
filemq-482797b8aa30fcc9ea13... | 2 
           host-heimdal-1.6rc2 | 2 
               arptables-0.0.4 | 1 
                beecrypt-4.2.1 | 1 
                 qt5base-5.4.1 | 1 
                      atf-0.21 | 1 
               libcap-ng-0.7.4 | 1 
libnfc-7b7f5061427b5456835d... | 1 
                 lrzsz-0.12.20 | 1 
                gnuradio-3.7.5 | 1 
                   bdwgc-7.4.2 | 1 
                  lshw-B.02.16 | 1 
                 setools-3.3.8 | 1 
                  midori-0.4.6 | 1 
             util-linux-2.26.2 | 1 
                elfutils-0.161 | 1 
               dvbsnoop-1.4.50 | 1 
                    bwm-ng-0.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 cdrkit-1.1.11 | 1 
                 libpfm4-4.3.0 | 1 
libatomic_ops-libatomic_ops... | 1 
                  opencv-3.0.0 | 1 
                  weston-1.8.0 | 1 
                libgsasl-1.8.0 | 1 
                 empty-0.6.19b | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/09e0703d8ca59a8b073f4c6523346eb11b7635c3/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/a628394709b9d5deb117933d115ff64ee94149d2/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/66745fde9f3b4cfe99e20fe2dfdd5371d69b0ec9/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/6a3f69e0b45a3a48c06a6d38372f1cc1ade23570/
     powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/7426c2a63f40ce02f23832e3fd8e49e98a16e0c1/
     powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/7fb688354694f77e030ed05f15862cdf303601b7/
        i686 |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/9b6befeb27d603075da1d8596b5abbfa62ad07ee/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/4c54482df90e04acdbc72929d9229d302a11322f/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/eef7196033b45b31013e19d8b4644e92118268f4/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0717e7e84101bc3c3f0ed78a99449f7fb43c413d/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/5df394371a3b92085418425af6dce776183483bf/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7a6c1e0f9a8b2f048bf2f944cdc627f16a442789/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/162798f54fa64d24f2eabcb68774ca7fd67ba797/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/eda64eea1e02e02dead0cde8e2a77f0846f88dbf/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/9995fffdcd802be39ffb9cef6a2471af20579e5c/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/4d5a98517f46d7be6e20eeb0ca73dedffab37b1d/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/110015f4a2adb26357a19d1ac69ca1b889ce32cf/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/4aea7af2e5d65ef5011f0d111ade84c346d6e047/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/0a2a2fc17de9780ef29f2e3b55604ea6722aca84/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/dfa2e7a269a7fc49e1b319ffac78c010324a7d9c/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ee99208d63974cacc6b32ce896a09591cb07caef/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/1450ced44f0c3e13956d3b43b15ddcd4dbd7f3b8/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/57335b38556aaa9d8cb5102f098ed7aefa7e6fd3/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/bf1f01980c0ce2e09d0f8d4befdc262480360e44/
        i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/d34fc3b57c106c00b47fae3f8f8021f5f8d1317f/
        i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/5f8d3b157f74656ac92a281a334a24c8eecb6e62/
microblazeel |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/a4687f9e2f43ff8ae759fca8f9207b1439342ee9/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/01616610889041b8b22b8f5e2aee00583f71452a/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/221ccc03164b2fe995adf3b48c6fbc6ba7a8903a/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e5d2e5c3b2a609bfba42a1dced67ce3342b9d9ad/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/c1252633c025ab68ad0d82ebbf0d7b9dea36a096/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/8e1cf8b68f4c0eb2f13995c32096de699b8c12a0/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/9ff307d4fa3f1e40f3a6cb13752d030c71c27fce/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/5be37ba87c88133e56867525b14d7493ddc36ac7/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/f1b1bc4cc555573f1fe0521ea3e6978dbca851c2/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/61b4dcb13737895141fa8c0f2b54e03ea5a7da88/
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/d642ff1aefb541993780b8e95745c2aa19d65ca0/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f1460b5bdee72e437d244dd81419f7518c473aef/
      mipsel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e08c726eb369fb8ac038689166fe047ff5396d42/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/346610b595561bd725ebf477f208c03f11a8bc62/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/37107f5188c73a88aaec0b1282fdb09315dfa141/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/06ab467f41f81ac8a611c9b495bf0bca2fc4ad19/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7d0d5b88ae33a4a50e13f3c2c2290f9f5e5c2aef/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/936b36c74353e533cdf8e8893ce637182257b1c0/
microblazeel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5ccc7e52b5d90232286ab547f1e4488c09a9474d/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/3da0c8bfea7705790111d3d853abbe98417bca15/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d5eaebae06b01e7a9e224fb57bfbac4d8407081e/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/b1c1aaa91ce07ffeb3bba649c274f84094416d58/
       nios2 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9b75fd1211d688826845d2e51321a1f8f1c53fdc/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/552deb1f9eb98d6ae9375fff41ed32a3c4e06d66/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6fcc7a01aff0eed439923627273f23a62a6ab8d6/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7cd13720f6cb3020393c7780fe06ac363f61d2ce/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4ec3c1e6d61f6149631ea34650de03f28365adcf/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/687d9de90dc8f5a45601da46f0ef1b4f9b17d628/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ec5c0f5749583e8e7e2e0e73b1c7a00fcffd48b0/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/d7a7eb49b9b2128bad2c8e0da7420dd7693afb0a/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/dacd0eaae2ec320830b51f4c7bb9e41c2351ba45/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/eb4977836fd393321720ac6562338f2630a24a3b/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/70701ce79468ec03573092e78657bdecf65eec34/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/cbc1b4e705651cc9b39329deda31067c16ecbc28/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/7e0a5844ff2cb4bd999da712c0a88a8cac4d7dfd/
         arm |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/99b0229b30012bb2a45a435e6ec64ee23aae9231/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/76ab3b50fa5f619a7740abe4446cef39e6bd9825/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/cea40149ead982c0dadca9d215c64cbf39fc8462/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/9198f3135de313f42a55be43b37021c15522913d/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/1005d7a55d037973905d4da892d552bb24a3b61a/
     powerpc |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/ed352fd42b2bb2f0ae8f1d0b1a2c311fc1b8dd78/
        mips |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/644f478868a92d42de7fccb0c91070ac764a8fec/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/312c55ceb50d0903bd82003864648e7daf7144aa/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/97a5b887ad5b02bfd079bb6732bf2ed20eae17ae/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/775b6b624a8cb5223d356ca2a18ed1e1ab14fc62/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2f0368d605219db8730a212e6d0991c49497287a/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/070fed5ea2eb492022900934e9e370589c18dbdd/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/791a6cc9bf5687f011066e98fcfea10fa5c2bfba/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/7c412d94c214bdd266fb69a800a1a57862c21c85/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/7d3ca58528b25c27193cab04c13395754e0207dc/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/fb081e57ac6ea50be3196d00eb9d6493256158de/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/c650c90612e9fd4cd5b0b0649da2ad9e95452f7b/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/232b3f7cd6ad511e289819c5325149f148d209d8/
      x86_64 | libnfc-7b7f5061427b5456835d... | NOK | http://autobuild.buildroot.net/results/d7eb43b584fabf3790a76f8e7d9d627b0c62d7a9/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/68e1d359679677abb6b1020a0fdbeb1cf35ab3fa/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/dde9998156f60310c5033c426443ac272036d777/
         sh4 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/3d63b604a94cea5b16cc6b26c626d5fa409f80e3/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/3d08652f8fd32d535148086223a0b82b2cd591fc/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/134930536c1272c412a0ad13e0b842f64243200a/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/8b676ee0e5c04ad7c9b48098b397c457e6933653/
      x86_64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e42b24e65f1941566695aae315f8a213013e60cc/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/60031437bc4044d4aeee7203c1ec3084f7a48fb7/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/7a37d408e51fc61899c400056f585a49992627c7/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/641c99e7a301426fbb575611bd26fbe6fe3b8b38/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2ae24780a85941513711c8ddb86f7ad5a9bc0c46/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e91d8a0bb01314dcf36a4ab801f5782b74c94ab9/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/44abf40db1794b9cab3812bba4699d67fa34128d/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ffa15083d681ac606660d9700d7d10a3f94f46d1/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/a361a14bc201a60434c5ab1eefedb5d2778f5998/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/8258086ced920b76730c0d834b52765bb9d4d8f6/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/fddbe7ddc4c96a7ef955fb35b386cc90976e09f6/
      x86_64 |                   lshw-B.02.16 | NOK | http://autobuild.buildroot.net/results/bc2a8b7cf8ab7e63853e05a4489ab28158e6929c/
        i686 |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/17c6ce17de8f9b70b2c9dc562b371ac5628f081d/
       nios2 |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/8be577dae511f82d45ab3b0a9bba370b81ad2ff9/
      x86_64 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/3e140ea4ecdb9c8eaf0fb86e609cd99c16cebfeb/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/eee0ae9ad778875d16d718a3a588f1e076495d22/
        i686 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/51d4955356e644ae7f1a60ba0e350b14be72f27b/
      x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/7fd68deb62cd83dd7e35eaf2452784a5c7704716/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/5000c219d864a859f468c9c51dbaf435fd971986/
         sh4 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/6b2efbeada14e64e6df7b5c00a6edae73d4f7fe2/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/fe4fbc25be44985fbfa8cadada48a8b004ee80cd/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/752e07899181205aa4e52cfe211593709caadf2a/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/3c5d1490a5bea61292c65071e40f365f4d5b4dd8/
     powerpc |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/e8c08c2794175fb9602e154e95fce7c3fe9846ca/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/ced80701ab1ee736a8e892cc0abeaced3852ba01/
      x86_64 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/26a7f0186891d2d2399033ef916cce797e0b6845/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/266dc7cdaf0ffa6fa8e73724d8827868fa81b566/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/9af72f1f3a90944d94e409b83110734ddf5c1e04/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/fc8835116f602f8dfeb52c35ea4b4275776d1b16/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/30e5aaeaa1dc6730148fe46be38e1a340d0f4fa2/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/9acc8b1ba6cab2d5ad1baf58fa6a5febecc90c58/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/29d519921bbcf02defa3242c5d2c8c3a019fa04d/
    mips64el |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/104fa29dab9794c014fa9c42cbb2816f538d4baf/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/b2aef8469a3276c2995ef20e0497d97874696713/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/490bd25e31785dac8c291e2eedd0c34be265f344/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/7ad5921bc7074648d1675ea3d5bc597456a8b17e/
     powerpc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/4fcaeb6c44554d4a919a11fa844620bd7772d3a9/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/f1ff3d2a31ab5dc51edac434fbabf894102c95fe/
       sparc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/5775a78f5a68012228f8f5a0fd75dc48080a7e40/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8c0b371916bdade981a64e72ae2570c2ec81b114/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8e089a4dd750a8c79b154ccec67dceeb1de2608e/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/9d67d20e8bbb90b71d968869f39e813ae3807126/


-- 
http://autobuild.buildroot.net
