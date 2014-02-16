From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Feb 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-15
Message-ID: <20140216073009.13ED01014FA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-15
===============================

        success : 93 
       failures : 35 
       timeouts : 0  
          TOTAL : 128

Classification of failures by reason
====================================

                     vlc-2.1.2 | 4 
                 cairo-1.12.10 | 3 
                    mpd-0.18.7 | 2 
                      icu-51.2 | 2 
                aiccu-20070115 | 2 
                      qt-4.8.5 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                 libxml2-2.9.1 | 1 
              gst1-libav-1.2.2 | 1 
                 libiconv-1.14 | 1 
lua-ev-458165bdfe0c6eadc788... | 1 
                    gpm-1.20.7 | 1 
                cegui06-0.6.2b | 1 
               qt5script-5.2.0 | 1 
                  libv4l-0.8.9 | 1 
           imagemagick-6.8.8-4 | 1 
               alsa-lib-1.0.26 | 1 
         dvb-apps-be76da69f250 | 1 
                 webkit-1.11.5 | 1 
                 rt-tests-0.83 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  pango-1.28.4 | 1 
        ltp-testsuite-20130904 | 1 
                 dropwatch-1.4 | 1 
                 pixman-0.30.0 | 1 
                libsepol-2.1.9 | 1 
                     feh-2.9.3 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e9a733d4992efa129923b45e558f6296966b1de4/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/5144d9b7afffce70f9c83c2175a6ec8c353bc1f8/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4bfddc19c24534a642c332dabed9b31ed565eaa9/
       arc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/fadfaa9916724d310d0dda555a1db31bee1601d0/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ce53582baecff16086712a180e845f1f44176741/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/4cd3e5b2b6bcbaaf3dc878918ca268a5a3214c43/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/36d58940131b15eb6b4d2c8f409f5d6a46366d03/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/be199b97dcdaf28a8fef9d90953115a005baa173/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/a7786dffa28e5472fbc9c8fe4ab302c84d7a3cb9/
      bfin |                      feh-2.9.3 | NOK | http://autobuild.buildroot.net/results/8f447412460e404aa723242dd8281b40317a017b/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/2ae96429e893b936fe10930f7cda5fc2a6404a80/
    x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/235f225bd3a8b272be91f5ea9bb499d39df9684b/
    x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/b2700d7005bde2c940fb38e38bde65732dedaa6a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f0828b0320fc5277ea15c61323ee95365191d560/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/444c9e5e2a5cd96e7ed92924603a9600f045e4a3/
   powerpc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/612f2b258114cbb2c60359f19a9797c5ce8852ae/
   powerpc |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/8a150e2b2548e6833e0466e7d8289ee66c31c9c4/
      bfin |                 libsepol-2.1.9 | NOK | http://autobuild.buildroot.net/results/11a7dfb6713a4fff9f1e2bfb051bdc53383e532b/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/80257519d70391558e1ae3b63b14476f7910f7c5/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/ee492fe582830b268611bf0c42995dd62ea71150/
     nios2 |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/1e87bb99a02eafed3a2ade226894a9f84b89b40c/
    x86_64 | lua-ev-458165bdfe0c6eadc788... | NOK | http://autobuild.buildroot.net/results/7303fffa6075d02289b6fdb12a1debdf0dd7d6f1/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/7052f182547ed6206c5eb726dc7b894564bb40c7/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/f524d267531356950f1738c128545be2d695ab87/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/48bcb0c21e3d2e0728307d373c95572c57069a42/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/7898366d30c07c881917e15cd7eeaafb841e81b9/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/0ac41abc06d8514848f8683dca1ba75f992aca31/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/df1b282df36a39becc787957cf7cc0de45f4f26f/
       arm |                qt5script-5.2.0 | NOK | http://autobuild.buildroot.net/results/583c5191b3699320664a698e2412d5701c57e2db/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/92c1f844735c36ac99d94232a93103d6fb320e3d/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/1761a7b21a0e0724153817cc264c243a1cd72668/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a79b055da09e4d8ede263251df8461bc8a64569a/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/1c77591a56e6318eb5b873c7fad7218d6459c599/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/aa24a8503433c867d3736ddcab3f50ed3590f266/
      sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/4e2aaa6b521d03498276da05ec616b3684c26a5e/


-- 
http://autobuild.buildroot.net
