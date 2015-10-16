From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-15
Message-ID: <20151016063019.E3466101619@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-15
===============================

        success : 177
       failures : 87 
       timeouts : 0  
          TOTAL : 264

Classification of failures by reason
====================================

                busybox-1.24.0 | 14
                   mplayer-1.2 | 9 
              swupdate-2015.07 | 4 
              sqlcipher-v3.2.0 | 3 
             python-spidev-3.0 | 3 
liquid-dsp-df5a459fa05dba41... | 3 
                 mesa3d-11.0.3 | 3 
                  ffmpeg-2.8.1 | 3 
sconeserver-3b886c3dda6eda3... | 3 
               alsa-lib-1.0.29 | 2 
                directfb-1.7.7 | 2 
                pulseaudio-7.0 | 2 
                 mpg123-1.22.4 | 2 
                   attr-2.4.47 | 2 
               libbluray-0.8.1 | 2 
           qt5multimedia-5.5.0 | 2 
              gst1-libav-1.6.0 | 2 
                    glibc-2.21 | 1 
                   bdwgc-7.4.2 | 1 
                  aespipe-2.4c | 1 
                  autossh-1.4e | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    ustr-1.0.4 | 1 
                 cdrkit-1.1.11 | 1 
                  libtasn1-4.6 | 1 
                openntpd-5.7p4 | 1 
                  mono-4.0.2.5 | 1 
             core-dependencies | 1 
                   ushare-1.1a | 1 
                  libv4l-1.8.0 | 1 
                  connman-1.30 | 1 
                   ntp-4.2.8p3 | 1 
                   gvfs-1.16.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                libevas-1.7.10 | 1 
          sane-backends-1.0.25 | 1 
              strongswan-5.3.3 | 1 
                 sudo-1.8.14p3 | 1 
                  apitrace-7.0 | 1 
                moarvm-2015.05 | 1 
               util-linux-2.27 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                   erlang-17.5 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/3e546c163d2c03daa8f691c79d7a662eba713f0e/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/bb4ac3f5f146a2afe114197ce56ddf346d447caa/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/5c3b96340c7cc69bd21bbd37bd7311059c71cd23/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/2016c3ad0f862dc0e6b47a7c3c9353bcdac0337e/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/bc3557358ea409961b5441d1245a1795dd188415/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b6927a71f1926f713823fa8ec4bc19793d4c1281/
       nios2 |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/1b961e17d4f7240bc25e37874c844b98ca2cd545/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/39c1908a68cabf6413097093043794ed8a6306bf/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/8dea5085de8002a1a23b23461de5641b5e4288dd/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/5140b2bb6e8e6bf8dae79f7d22d66cf733088e19/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/86e87d2e618309a1d34b6847ba80c6f19db404ea/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/2570836dedef7241036c04651d70dce6cb860d29/
      xtensa |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/b1fc177099c76ba114349c4b401674e1990ae902/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/379291e66ebe19679482b582d5384bfd48a21319/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/1b5acab0f10dc3b51b4622ca38911297537e89e6/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/78869dfee4bca5129fabf3649c6ecf8b173345a2/
      xtensa |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/97dd95e89430ee06fe3c91193dbb8e354ef4d193/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/c049572a350e60e3802ed6f9e1e313c147b2e3cb/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d2c749cbe8d5ac429092f709ed0277c60240fbf4/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/2d9f658d392381acae81c96cb90bc908819646de/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/9403e91d4b3294ca874c3a6f547fa6211342a56b/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/26ff05fed5641d3af73e72d2f740811982e8246a/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/125d6f2ecac131798805fb4a49ac872f075cf8bb/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/13c693d4e3251eab7aa17dafad8df877a91e188b/
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/bdee65aa3942ad8de3bf05684aba92d1260eb24d/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c49d550b4fa2e249bdc8cb183b3813e6e925567f/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/aa6277a437293863cfeed6478c183f71956539c4/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/38216e03cb01f72162ef4d8f9ef2aa2b221fe53d/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/
        sh4a |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/45dd9adbac449ce0ed66af5b4655b4d9b37faa62/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9b0242acdd1e811e178327b7495133fe3070a795/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/2faa92c8597e6322de60e5f5063515c4e202c873/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/5cc2857ad36d147dd4d4adce625692a448a760ad/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/429edd2d33179a90d31acffc629b557ec1672ddf/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/6790d2b90c2a28068fdca15732096edf4d429ed2/
         arm |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/1ebc57e5f69e2c2cb0cda7d5ab48af206d01f31b/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ec5b96578fb2edeee9678a4fc7101145e9b02763/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/1d52b727d6a79087f85e4f31b9c6f2959f9ee887/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/5a215e59d45a1793453a0f85c8e6c9f9be521034/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/7cba1abac33069c482b4f7e27688c763a5c32446/
      x86_64 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/4de164fc6ece3408854bee98b413b2323238489b/
      xtensa |                   libtasn1-4.6 | NOK | http://autobuild.buildroot.net/results/da92bfe7e06846885d5d0009bb40bf6036400b6c/
         arm |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/6867713b65b7804e0485cbd9ac5f35c70f7138c0/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/c1c87bf8f98048611ae31def7e2ad27717dc3ac2/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/1981d59795ad302497eb74da2215310774aa1782/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/3a3082f979cfe4a4a249fc1dc51df673674303a0/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/33b98f61e833ff381cfa2c7759f2961204c947ba/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/5fdf21977e981ab52f89998bd4fb560887ede369/
         arc |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/d0d707b45317028b15ccf592b30f048c80323326/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/c9a3a502976c10d4b7c8acdfd3fb220da340207d/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/23c704882fb06553db48cff57eefefe31ab9fcab/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/1236eef80563ac9d39d0a3ed9654ab8daa86535f/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/8e174d65b7c4bcd2b1a0d74efae61061a8dea560/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9bf33e73b7c10f495c550bd8121ba98d8d73b334/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4ef2ebccd1c791bec8dc9b46bdde135c58c2e31c/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/af550261407aa698d6ef25b8a13534fca3d89c19/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/abe4dd0b44f6860583a5e8d9cf3eaddb44b54c50/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ecf895df118073865c437b4c9cac6448742288c8/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c69dbd6e8871fbd3f65dc1606d1be6e238a7e7f0/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f3e836ae8b4a38a9603ae4ebbe81f1f1a1b2f8e/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/745615faf4f6e8a4a29af2dece647a6de35b3396/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/71f66419ab01d384a45d57f47b2e5559cc95e0d5/
        bfin |                    ntp-4.2.8p3 | NOK | http://autobuild.buildroot.net/results/1417eaf95a6d34c77993894380c8f16f4663c2f2/
      xtensa |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/a085d8dd7029a0d38658b1ea40ee5871d033fce0/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/6699b398822956a65a4dea95529a12be19a26e02/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/030ca5173332938d32b585cf37243d119a71c2ec/
      x86_64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/67ec04403065a86fbf249cf69c9e21c122970095/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/5d74c4be7ad5bd89499be0462a783ae328d308e2/
    mips64el |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/ab133bd4d476af074cd59a1f9c98246654fb4e36/
    mips64el |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/23f4cca4da98e3723f51d50a9e41ce1a56ea15ec/
         arc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/7c8ebfc93a5b11e40251495715d742520b3b8291/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/c381c316907964787ebe1a0807399022f15d8158/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/37705926f3023395c54af0532ff95f0125fbaa66/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/982aadb841ec916d63d2049c8ecd6fd037eab215/
     powerpc | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/cb91aa597cbc1f7ef3e13bb16ffa1d035aadc7c8/
         arc |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/fc0528de7fed2f34f503fe8dd8b4c21ded0d6dff/
     aarch64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/8858cb95cc0f2f996136d6137260146abec5ac3e/
         arm |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/effc9412c2cbe35bb5601601107c5547c66dea67/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/6a864fff600f80bb9122dda128147492373f3b7b/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/778e6309ba834cc70f8243a4f6c664c0bcaeb7c5/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/aaad892a487affe9f62ce4e54ff8bc897f4b99a3/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/d9e8298898da6355f6b46a032f951b4ca196d103/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/de3c39640ca972bd3a07e66859f348421342666e/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/d1e446d2c552efd8eb9b34bdc7f50fe7ecccf31c/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/e07d326ff5384a25f14ecba7c8558a3f954e39da/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/133da522195fa69b995583d2df9801bcb7995c94/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/fa2799eb24e212cf0abefa4cb6077f263e7e0fc8/


-- 
http://autobuild.buildroot.net
