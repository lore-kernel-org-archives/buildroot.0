From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-14
Message-ID: <20140115073008.E9BA4100EF2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-14
===============================

        success : 72 
       failures : 63 
       timeouts : 3  
          TOTAL : 138

Classification of failures by reason
====================================

            luasocket-3.0rc1-1 | 17
               tcpreplay-4.0.0 | 5 
                     vlc-2.1.2 | 4 
                  ffmpeg-1.2.4 | 4 
            gst-ffmpeg-0.10.13 | 3 
                     php-5.5.7 | 3 
                       unknown | 3 
            live555-2014.01.11 | 3 
         luafilesystem-1.6.2-1 | 3 
                aiccu-20070115 | 3 
                      icu-51.2 | 2 
              luabitop-1.0.2-1 | 2 
            lbase64-20120820-1 | 2 
                  libpng-1.6.8 | 2 
               alsa-lib-1.0.26 | 1 
                    mpd-0.18.7 | 1 
         host-elf2flt-20130904 | 1 
               w_scan-20130331 | 1 
           imagemagick-6.8.8-2 | 1 
            libvncserver-0.9.9 | 1 
              luaexpat-1.2.0-1 | 1 
                 cairo-1.12.10 | 1 
make: *** No rule to make t... | 1 
               arptables-0.0.4 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/1c459357a25215ab6c5644a89c57669922249e61/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f0ff745d5872768219195aa38985642b0571311b/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/057c167c92138dcd6f80221475d1f0752a433abc/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7a4d7d4fd32c796dfcd96e58b39091cf48297d6a/
       arc |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/5f1966f1a7c8800846a8405b7e74f4893f3fcd14/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d7197dc3ab8dda8da1034a23cede4248c5251217/
  mips64el |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/a35b86458efbfa97a561a6d6c267c8bef5340ed6/
  mips64el |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/88396583acd356873f1e5c610898a50e6725d14c/
      mips |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/926c3b868e6b181ce5cea2733cd089cb6486831f/
  mips64el |                   ffmpeg-1.2.4 | NOK | http://autobuild.buildroot.net/results/44f6e2aacfd48f70541709de28edc1604f34990b/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/05638cbb83e7201fa2fe4daa33023fb44b6ec1ba/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/c876796983ef4334d175e26248aaae0c5760edbb/
   powerpc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/70b752b5d5665f4137d2254a2ebbe440310fae12/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/0f02f066cf5ec9391b7dfff07914ab612dd2a876/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b76a0ddab048eeaec0d81033fc12da538c326539/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2f382e4985ebf31b82146d45d5ece1c233e75a0f/
   powerpc |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/ed00a0c0b2926b127c5b2685be083e3958d6d2d8/
    x86_64 |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/f28a624f89f4de249a1b7a718f5ae31109ba9171/
    x86_64 |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/6ef8737a3c1fb769205d0a62b5c883d9813c7be3/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/8290b489120a239708d3220bbdf4cbbcbd62803e/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/5dadf45508ee45ac6b0f4d53c4b6096a240e3610/
      sh4a |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/4710205ff887ed0119a1e40732d69c32384214ee/
       arm |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/ce714feee7186e317382a3334f4004f277e1def2/
       arm |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/87784f93a6d4558f748395a5db5d05a45fbbec81/
    x86_64 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/3612f637207502232ded0f3c94f7e2523a0b7883/
    x86_64 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/262f73898fcb700daeb8b4cc7dac53e41c9c5f8e/
    x86_64 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/1ead0a162a251d3e7bf8598036fa06c4befeb3d9/
    x86_64 |               luaexpat-1.2.0-1 | NOK | http://autobuild.buildroot.net/results/0544cead086ba51b45dfa1df114787a8f22eaf8d/
   aarch64 |          luafilesystem-1.6.2-1 | NOK | http://autobuild.buildroot.net/results/9582cda792e207165968aa718b1d55d4db1e6a91/
    x86_64 |          luafilesystem-1.6.2-1 | NOK | http://autobuild.buildroot.net/results/60161d13d596d41dd4059977eb947d72c172f0d5/
    mipsel |          luafilesystem-1.6.2-1 | NOK | http://autobuild.buildroot.net/results/e7ea6946552f72dc27f23ae1aff1665a6aa097c7/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/40e2311d6ac3a6e505770f515940e6c911083a4c/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/0fe5387b219419b7781e0c0283927ff2c1f62bdb/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/82eb6df6579f82004f5b9aa0cd278fd24d95ed6a/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/56c66b8dcdb5b731c2dd364366e35e10d25cf501/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/6bfe3db6627ed5ea8fcb778ad2eca448303f6b68/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/600fa82192ea4c4271e8b4d1a63e04c917227a2b/
       arm |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/9f399be5829892480df847dd183bad9a1c30755e/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/bedfb7040cd51aba7c363ada0f38ce7356cf676a/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/cc272982ca08ea09f6371875c3334ad965bce489/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a41cb7075b6f3b93bdf8567515aee8dccc063f25/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a6bdb8f4ebe2bb83c3734d9ccb8e5d0c37c7f9ed/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/ed9573e316e5fad173960db50d7f30012a15509b/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/b391b9e6cc3e703da0305b3a37f18b65c36e03d5/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/009147b124b225a2679441fae9b427bbcced2137/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/a67b532de9b9b17c3b26cb1f9cac214c42d0966e/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/6a2fe9453886d51e5241e3d894d043a553f5927d/
      i686 |             luasocket-3.0rc1-1 | NOK | http://autobuild.buildroot.net/results/7dcce7ac0681cb05615c2ca7f616614159f25ea3/
    x86_64 | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/7b5387fa4e50036b7db407bf6ce866156bafcfdd/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/2622917537fa02eb0bf8e2bab8f69c8036fdd56d/
   powerpc |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/cfe88e3cbe9a3101b0c2abc48d8524eb878b6e60/
       sh4 |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/1ff7db3fb0d8cb52a3cafded7fc9fe0abf1175c6/
    xtensa |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/14c9777c86fdbfc93e50281b1e21e87267b1635e/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/bdce95d64ded7c510d2454c4e9efad69dcf3ea85/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4393aab3568bdd21d4192217373bb851c3390e3a/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/d0983f084931154629dcbefb52cc0eb61ee52fe2/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/73706a539538db1269615980dc43bf8b0a5276e7/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/25e77dc5b67ac61acd79ef6dc190171c349fdfca/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/9707cf761aa8f14afa415b62ac51342d393cd35f/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/8b04b6282e268aeb5ca2b01ed8b4219c93576c68/
   aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/f1bd0fb4797c97f7360b03dd98b32e2a27a95438/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/9bbfdde6996dbeb8a41df729b5dce3275ae7129d/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/2e98a4f6d59120bd839dfee043304e15f1bcb138/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/1ef4875453d0fdff68ea516df33ccdfa666fb122/
      i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/e355dfec735a630ac627e118ee455efe305c99d6/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/d98eb1266547c390318a510dd663499bd1cf64e6/


-- 
http://autobuild.buildroot.net
