From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-30
Message-ID: <20151031073020.3AE541013BB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-30
===============================

        success : 109
       failures : 85 
       timeouts : 0  
          TOTAL : 194

Classification of failures by reason
====================================

              host-perl-5.22.0 | 16
                   mplayer-1.2 | 5 
                  ffmpeg-2.8.1 | 5 
                 sudo-1.8.14p3 | 5 
                   dvblast-3.0 | 4 
                 libpcap-1.7.4 | 4 
                  vsftpd-3.0.3 | 3 
              swupdate-2015.07 | 3 
                    ruby-2.2.3 | 2 
                  qemu-2.4.0.1 | 2 
                directfb-1.7.7 | 2 
                      x265-1.8 | 2 
                 python3-3.4.3 | 2 
                     lsof-4.89 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
           bcache-tools-v1.0.7 | 1 
                    sdl-1.2.15 | 1 
               libsigsegv-2.10 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                collectd-5.5.0 | 1 
                   bdwgc-7.4.2 | 1 
                  mono-4.0.2.5 | 1 
                  libv4l-1.8.1 | 1 
                      pv-1.5.7 | 1 
                busybox-1.24.1 | 1 
              wireshark-1.12.8 | 1 
                  connman-1.30 | 1 
                elfutils-0.161 | 1 
               util-linux-2.27 | 1 
           libfreeimage-3.17.0 | 1 
             host-nodejs-4.1.2 | 1 
       openpgm-release-5-2-122 | 1 
                 fio-fio-2.1.4 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
canfestival-7740ac6fdedc23e... | 1 
            shairport-sync-2.6 | 1 
               libnspr-4.10.10 | 1 
                  c-icap-0.3.5 | 1 
                moarvm-2015.05 | 1 
               lighttpd-1.4.37 | 1 
                pulseaudio-7.0 | 1 

Detail of failures
===================

         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/9827f3aac819e0fed73daa294399c162607e4dd2/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/0368b5d3f095d7021143f1d8e29bd2d58394d03b/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/b3d6a63d60833f9a7930b84e299b1d6b420514d3/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/5be47e70c55259909cf63c5b48c7b011f01b3888/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f596fe541f6438e21cf636d25885e8b72f0b3610/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/e92275be1e7c0f8de83ea4cf3cb0e81325d16b22/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/31eee0718d93e3a8f36a3bfe2441588d30cd86bb/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ed18ee6ce20cfd37f9574e46cdfc9d328ca54748/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/884a00dac0104759a9cce587cc0ecc9766fec83e/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/0d2f108dfdba64574a573ac618931fb03f77b0f2/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/83f880da335bb443ca33d8ea21f50075c79a394e/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/c80514d14e49ef898e34b6de72fe9e0c306d3ddc/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/03fe6dc17d7f36d9b8c7ced402850def95d8feb3/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/31358be13b6d90d3f91ecc345be7e58c0438227a/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a1e56defe0b8a4a9103035addfb362d3ea9bfd59/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/428ef3d5c60fa459056af0d0133e355e20402564/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8e267d1928e0d49e5bf3e3edff62a01c40c10f13/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/f0adc6cc1d953c7d7b67d6e5e428b3883a991d67/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ce8b313c6e3faf21d804d5b8337c312ecdf88bd5/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/409333151c417554380290f975e2df61fdfe34e2/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/003379f017ea8f8842905104fd3c26c3858f278c/
         arm |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/ff97f452b875d8b1fb78561609742a233b80e0d3/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d0be9298df47a4188bbfa82aa5c590db4fa882c0/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d9e05b62a2ecbc658fa8cbc1b0cd7df10858f824/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/0e82b31d0d7e6e2c0335248943f539c76d068e95/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/34125c56bf181157be855d09cecbf5e0226bbc15/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9b13ab2987419bcf434db60f10c14d5d09544df7/
      x86_64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/945eaca85179eb133ff40a8686df1b9047d647ca/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/a8161eee8000cfb6642d971a318e153331b51fc4/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/42fb0e35de4b339b3b8733a45034663ad8832a86/
         sh4 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c3902cc6aaa3e2286908e83f3ba2be922342098a/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c68b68c0909a948f5885afbba68ebf5915151fdd/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/cc094a1f269a5264a9ac1483baf0dd5174086576/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/abb22bf00508156398aaa0fa5ea20f4c9e9119a0/
         arc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9b729ffd06442b127197c87a588ab1f825881f19/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/2fb841dd91f485a0e28dd56266c5218edcf2a063/
         sh4 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/5db58d808e2565ef65af7e107a501df5430700c9/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/1ba5ad0f6e55de3093ce9e9cc31d3e7b0555f87d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/edc4cc1fdf776e9f1b5f2ff0cc667b38627e6663/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/28cbdfea80fa6b9209ed894549550d482d7ce3cc/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/e1c84ebc3f37b04c7dab3b5c65ea3767335dc560/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/71c6db0035b503273b7b378e63697453976bd4c7/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/982e416b6eb1fa75376b95740637ae098a31953c/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/6490c165769d1a20efcb1ed7b672cf51fdfe44a8/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/28f59c009a9693c7431631f3c4224b7635179aff/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b89247b8c776157092b91915a97d75cc6e3bd103/
      x86_64 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/95fedacef6e46fe8b0114f98a6996b7dbdb20b6f/
         arm |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/e97919f06e94d697358faafc4ed6c023d359cea6/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/76fcfaa3f59e07f7572bc55fb72ea25f70e5cd00/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ab102548708bae98534799f2bd8331cd76beac9c/
      xtensa |                      lsof-4.89 | NOK | http://autobuild.buildroot.net/results/1c8179c91ee4abc0cbcb003e368f2cb070546101/
      xtensa |                      lsof-4.89 | NOK | http://autobuild.buildroot.net/results/757cf59447f513e0d4c69d8b86bbc01d8ae3d710/
     powerpc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/e3af74cdf91ccb0b8bf25856d2e7d215616c9b6f/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/fb8433d065055e8fd576ab1f4ccb55b7bee1e91d/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/143809213c5bdc9e82399e33a7e73c8e503094ce/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/292a0335e77cfdf688e167efb1abcd6686018932/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/584b3c2d411c93c8dec9b25909316c36397f4f18/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fb29ffaaaef9d1c646e302294863e7a20561bcea/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3e194d06a609de95fdb6f76e1786e394a952265d/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/c53bc4bc21b75992e5aecb43d371f91879dde940/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/a8eb4adf09f41611aedb0416aff7f95927bac94a/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/2fa3af09e1ba9f4b7ae7bf965858ece03f4851f5/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/5d3d34845e7f942dc901d373381c6e5130e2da58/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/be66a5566e7e0b2fb7dbf616e78e50b1c9d4f0de/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/05376cb0c33ebb0501656ef5d1e3569b97aeb688/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/7a23b457c7150138fef4ccd3fec7d10bc84cfeec/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/f97ba5e0ab1335085f61182a6bdc056adaa2929a/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a288e8e79f04c2929b7a8e9ce9e9dd370803a91b/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e25fa5cc27f7bb95650fcc8186f794d1e18682f8/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/f843e210da563e6eacc5b548a346a1d077bf5da3/
        i686 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/f6959a999276470d63734258d49a863644df909b/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a351d4980ad0d85be6b9c38ca92c890d5e0a1361/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/9aa08dbf086cd9bebb7a7bb2bec237437b6e5700/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/53ae194a99ef282c2865623dbddad4291caa79f5/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0d57f15ab3a6e187d286d947b17670d951a64c9d/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/fb88257d0a3f487b792be810d9e7b2b350b08657/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/9bc36f16e241c9777c2486d232c69ad2de312b5c/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/b48516e0e31a56fe982d6f2d46a8d0ed7a9ae668/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/f2e7f5303542f0fbf70017ddfb3b47dd7275053c/
         arm |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/399ac7fe56e47717802028b2d15a8362c0641ba6/
         arm |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/9e0a4da9ab2abeaf7d462cd3f3980c37c085682b/
         arm |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/7c978d2da7399a2248f6f3591c72e85634173b24/
         arm |               wireshark-1.12.8 | NOK | http://autobuild.buildroot.net/results/b354ba668ca9476c143f5f7ef1b727b0b5672b04/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/56302ad8d2caec176d349e29fa6ca8e0f34f3f58/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/26134a234be5a67914cde0fb81601f6860d943d2/


-- 
http://autobuild.buildroot.net
