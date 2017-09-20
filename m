From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Sep 2017 08:31:01 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-19
Message-ID: <20170920063101.39351208DC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-19
================================

      successes : 158
       failures : 31 
       timeouts : 0  
          TOTAL : 189

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 9 
                libmbim-1.14.2 | 3 
               librsync-v2.0.0 | 3 
               linux-pam-1.3.0 | 3 
       gst1-plugins-bad-1.12.2 | 2 
                   luvi-v2.7.6 | 2 
                 mesa3d-17.2.1 | 2 
                  cc-tool-0.26 | 1 
             lttng-tools-2.9.5 | 1 
                   mp4v2-2.0.0 | 1 
                    mpv-0.25.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
                    ruby-2.4.1 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c19907bf9a1c765bcb339a0fe3d90516e6eb3f7d |     
     aarch64 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/cd60e664591c40bf47fbcc142e9531c1ba77996a |     
       nios2 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/5cea902433f50a5b15338055d008bb22bdc64c57 |     
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/04baa1feb0b0080dff91041e4fca9e534a906133 |     
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/fe3aabc013be136bc58ff5777b87a667f240c71b |     
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/6d427c1aae06cb483310dab905225c23d7bb956d |     
        m68k |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/775852d6cf33e0843590e400303a214f3b39d359 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/7090188d42d9bb2c2e8460f6aa6334d1e10fc598 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/7fd65ca85d9e02211d41cfd37fcae1c85070c893 | ORPH
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/e472891a656e40f33081d9a5db1b1b6d71c1389f | ORPH
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/9e443720ca247292ea612851962c611a9bcd3450 | ORPH
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/f90c50cdd0b48492f9f0bd9cc6b8dff7facdda9d | ORPH
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/3cea16b3a2a06fc71ea39cee457793af491b0def |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/b17837b326dfcfb4f983d5eaef017e7a0d827921 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/06e0c975bf542793891d27b5f7b16531c32cf92c |     
        mips |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/3a1848ec93334420a7d934c17f77b2d514252ebc |     
         arm |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/278beee76f56f20ce9cd6943d2b1811ad7b5fec8 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4c13228d28b87c3bd658b274d1fea401e1015bdb |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/922817c5323a51e80c17846e079b128cf8db8478 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a0f1b4f9d2750b157d167c2d5116c2e2c3e119d8 |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1df4b54726dbc865e414d821dc505ba966b36226 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1a5d28d48ac867db26854f2990a08f01132a7bb8 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2441691ccb51465428fe1d41357e350a35830651 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a2a6876f4e1b9468ec9b2eb19c944c8214df46a6 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ebf3297e3b4568c509d401fec5540725c4de2208 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1c53cfea4cc2cdab49abc8fc0481f601c5d61401 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/d9cc7b49b1efbe2b445c928bc0237878846c0172 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/cf28905756f5b78493fceaf4320d9013eee4ad0c |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f645a927d9a4f97b0d0df5e3d63d92c63fbc07b | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f524bbe9f661be67939afd724077010d20a4b43f |     
        mips |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/9686e18dcb5710542a5c8dab66f811ba3e36c2f4 | ORPH

-- 
http://autobuild.buildroot.net
