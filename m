From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-19
Message-ID: <20181220070018.DB3AC2074E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.11.x |  17 |   0 |   0 |  17 |
   2018.08.x |  17 |   1 |   0 |  18 |
      master | 100 |  46 |   0 | 146 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          motion-release-4.1.1 | 1 


Detail of failures
------------------

         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/c0bf0e78603226826ef0cae1e4619a493bddd9e4 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                    efl-1.20.7 | 1 


Detail of failures
------------------

      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/71cc38029df3c55729fa933002f2c67b25f91156 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 20
                   netsurf-3.8 | 4 
   libtorrent-rasterbar-1.1.11 | 3 
                 dmalloc-5.5.2 | 2 
                  linuxptp-2.0 | 2 
                qt5base-5.11.3 | 2 
                 upower-0.99.4 | 2 
              xapp_xlogo-1.0.4 | 2 
                  ffmpeg-3.4.5 | 1 
                openobex-1.7.2 | 1 
                    php-7.2.13 | 1 
             stress-ng-0.09.47 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                xapp_xgc-1.0.5 | 1 
                xapp_xmh-1.0.3 | 1 
    xdata_xcursor-themes-1.0.5 | 1 
 xfont_font-adobe-100dpi-1.0.3 | 1 


Detail of failures
------------------

         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/4be290bc9a54abe1fbe1b3f03baeb03f9e2557de | ORPH
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/113608a3afdc323fbec9b68d30a04f7fddce901f | ORPH
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/04197ba412bea05712662dafc0dcc3b24c1f2f5e |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/21a5277bfd3edb9570bee7f68aba86cb1af925ec |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a9a215d79da55072584365e5258d7d8c16d7c8b1 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d63b31e1b5b102f5e378170ce33bbfb74f68fa32 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1372d2c477a31dc8161f71f27fa5438e130df739 |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1d38891d4a3e0db20c845668bb73d173c8bc5f39 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/83c96226a6d5655c499ba2c149cbdcc104a4b5fe |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9c6f22e3ebf8414814ce1fc0ce4128b02e384e7a |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8f5e750510ed6d878a1116842ca21682d528187d |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/37334dc0a54ec48beb4fcf148ab4d0d326214f48 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4993c1ea3bf9cff633eb75764667919bb09b79e3 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b1486ece55c64c1d0345375533b4a9830f2995ba |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8a2c7c3d7c81246c0a54fa496da35032f7165e8e |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e75291240cc81da46bde41c3b962672d91cd5848 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/67c172b2edb19b6e2d14d5e00b6a64adf28c6766 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/75d301d7d1d0f64a08ea4801dcfec88a93403d51 |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4513f4918dcaeb77f2cdeab832286bc3f9bc4f4c |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bd5352ffaf46a444a7b338c2b68ebe073bcb374a |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/504e0d50c15b1912ea1a572344ba1490808a8980 |     
         sh4 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f4884314bcfbc6f97f77637036c4bc14e6980832 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4dfbcb2782574a62491d71f77173f0310ec47123 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/dec6a5d79ba8f06e0fc04e5213200bc7b0f09c7e |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e29a278977942b55c26a63c08114cfa2016ef930 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/4fe352218eb965a6ca3fd93223f1473c3ff90dea |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/89c78bd49e127985d9dc7ae037fbbf3b25fd6f55 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/24109de995936ef093d3d91ed73f4f5e2a9a8680 |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5cf7b6ee3a4ff85a6263a0314e0c99e3814bf28e |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/947d6add355d27d94ad661f7b147b7b6ebcec010 |     
     sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/64b852f507870f6d4da52b7571dee32a0e491907 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b0eba419c81f3801ca5f96473e742aa4c784b828 |     
         arm |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/d76705116d38450697672bdbddc500e27c9eabf8 |     
        or1k |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/d059879f28dcabbe4ec0f3e71d1eda68824f0d55 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0d92e6d894c7c306e42697ab8cdf890c33f8f7bb |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/19b6fc56b0e4576902f9842c19f33b3533b73639 |     
       sparc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/add726c9642ed13951238c2a1a8a7c2a1307d42a |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/6ff749a81fb12dcbf840ca9ce6e7dc813c9f0aea | ORPH
     powerpc |                  upower-0.99.4 | NOK | http://autobuild.buildroot.net/results/6bc12389e908876924fca43c4e3dba0a861e3cc6 |     
     aarch64 |                  upower-0.99.4 | NOK | http://autobuild.buildroot.net/results/321535a6b1c1e3c597050dbbc654b93576cfa74c |     
         arm |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/732c5e129db735ea52356661f7ddfd7b634e1fe3 |     
     aarch64 |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/9b0b342574233f2d52ff0659efd79bd89abb85bb |     
      xtensa |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/c461e120dc556c928c9911bb91761ceec8e6abd2 |     
      xtensa |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/57ed51a6b25af4ad0200ee384a26e3f130864c89 |     
      x86_64 |     xdata_xcursor-themes-1.0.5 | NOK | http://autobuild.buildroot.net/results/062aa973fc565cd516e927d7a31fa99274d0eb5b |     
       nios2 |  xfont_font-adobe-100dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/bf2d79103a1187ac5125cd4b2249b153c86ea023 |     


-- 
http://autobuild.buildroot.net
