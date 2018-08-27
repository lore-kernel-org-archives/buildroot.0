From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-26
Message-ID: <20180827060019.5834E20789@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   2 |   0 |  25 |
   2018.05.x |  19 |   2 |   0 |  21 |
      master | 260 |  18 |   1 | 279 |
        next |  44 |  33 |   0 |  77 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
linuxptp-303b08cbf55096aba5... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/7a135275cc52d52bf36cffba0322d205fd1d3abe |     
microblazeel | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/3048be0bc31334f488d7766149c295e385b8f611 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 2 


Detail of failures
------------------

     aarch64 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6da8ac87c89191b0f109032b7a9076f6905f1a55 | ORPH
       sparc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/869059a015ca8d059bcb70e4af400294fc0af59c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 5 
                  boost-1.67.0 | 4 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                    links-2.14 | 1 
          mediastreamer-2.14.0 | 1 
                  mender-1.4.0 | 1 
               mono-5.12.0.226 | 1 
          openpowerlink-V2.7.0 | 1 
             qt5location-5.6.3 | 1 
                  screen-4.6.2 | 1 
          shairport-sync-3.2.1 | 1 


Detail of failures
------------------

        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/60402c1f27d08dc0a1d5aea05f777c46c206d5a4 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/441dad4a7fb5d86e30ade3a12453c8e096e46282 |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/aeedc994f6a451e441b389375dc47e637d16e3b3 |     
         sh4 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a0484f8d65a5d3afda3130579aae407ade965a55 |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/def57d35aeb075d7a14f4d5464371ef5adbeb13d |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/211fe45d724e2f5344295fd25c8ec68917b36eec | ORPH
         arc |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/f0248b3bf4a73210f210f422c8df067a6ea28aa1 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/576c7d71313c45753848462717200b2b8ff5bb0e | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/32df5ed375fa2aebf9d794a6c461eadac27bc4c5 |     
         arm |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b26ed49cc2a842f14483f0e4f15c4901bc7054f6 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/ff8188b67124905a3ae7f0342d4530398a96151d |     
microblazeel |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/3288b742cee650ee47a41c5b4d6aaef1fe67bff1 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/c092d22d948cf8f37b14ea6c3b5fedec6c316f55 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/b4435f32612cecd1f1ecaca46528035f5175b825 | ORPH
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/129abda4c74f961c22632f1afcf1efb26e5aefde | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6fb651c3ddd31e3b9b5638884937a0b3ef959a97 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/5d4105604017bfb8479f35b26c86f8d6dfd5e981 |     
         arm |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/a62bea1fd32246526d59f029df3dca60f1cd710f | ORPH
     powerpc |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/14a818d5a33d008f029e8260b230fdf76dc8e0a4 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

         host-e2fsprogs-1.44.2 | 7 
             python-lxml-4.0.0 | 4 
                   botan-2.7.0 | 3 
            python-pyyaml-3.12 | 3 
                rtorrent-0.9.6 | 3 
                  boost-1.68.0 | 2 
               target-finalize | 2 
                    brltty-5.5 | 1 
              glibc-glibc-2.28 | 1 
        host-python-lxml-4.0.0 | 1 
              jpeg-turbo-2.0.0 | 1 
                libmpeg2-0.5.1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                qt5base-5.11.1 | 1 
                     vlc-3.0.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

       nios2 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/5487757990bfcbc9a2a866d43d325ce914e7cc70 |     
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/fe4580e7aec287230b5db5d2f983ffe99f4b44fa |     
   powerpc64 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3187afa3eea77e5de0e0fe14717bfc080da08117 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d1624541e71fa6f489893db8230f190a0fc7d9e0 |     
      mipsel |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/44993ed5a045d38514409378379c63e2f4e1cf8b |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5caa5d5d5592562cb13b757ef1ccae940f732d10 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/a53bf446f1175949e4524132d334bd912c539fb3 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/79281304f26d94eecb06435479f4c9694c0c72a7 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/beb7d28ea0c9cbe85abf3da0116e6baf077f2281 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/db0b03912cb4130dccc22dc9461df4ac487bda24 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/b29b91ff7640aba2ed40ce3ebaa87e8eefb02ff6 | ORPH
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/266d8c62e0ec3ea845b1b83216d365f286212a07 | ORPH
     powerpc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/1b18662e56a88a9573c3716d7ad350948730cd6f | ORPH
    mips64el |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/762dfdb3a0cd562a0052e2725fd0e79b7ffc6b72 | ORPH
         arm |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/9ef107a10011b59e715c7f01466f2a0aa8a86215 |     
      x86_64 |               jpeg-turbo-2.0.0 | NOK | http://autobuild.buildroot.net/results/7e1500405a0f102dd6a48ef9337ffe4d7de73df3 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e787f02cd93da2430c12c0baf1b2fbbe277a0ce2 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9b41c513500c63a9890973a0f17ffdb84d44d580 | ORPH
      x86_64 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/01416dd7d7ba16993cfd72c286df8483e742cca6 |     
         arm |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/be9f5fa0cb7e6a8690abdc3eb8706e30bc555298 |     
      x86_64 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/152066cbf5468d5a832fcda0f9a7e907eb62bebb |     
      xtensa |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/71f1c36c24627a1d6e2510b88f797f338052b9d5 |     
      mipsel |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/38296a9444c9ab94075bb5875d4e075d090366de |     
         arc |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/561d2e93fb90965f45f4f95f9e98eaaa78c2096c |     
    mips64el |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/a7db11e7f376d4d7f6bffdc78e7a5adfa93995f8 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a0ed31ac84374d080a751dc7086f0a6b81078233 |     
         arc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/dbd9d380b9e760da93df475de562a007dceda8bb | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/250863c94c66fb9c3d64df225ab6f4cef467b121 | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/08021e99dedd8492c8d35673648e8d753395d8f7 | ORPH
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8544aa06d7e70be45cdd312718a73328c5fcaadc |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fe1d36e88d8f3530928de52bd1d94c81cc8a76b5 |     
      mipsel |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/a6b5e5677efc2b46af85837637f2832eefdfed1d |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8bba90247f8355cb9b957f6895503161298cd612 |     


-- 
http://autobuild.buildroot.net
