From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-22
Message-ID: <20140923063011.5B12A1010A4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-22
===============================

        success : 203
       failures : 33 
       timeouts : 5  
          TOTAL : 241

Classification of failures by reason
====================================

                    ffmpeg-2.4 | 6 
                minidlna-1.1.4 | 4 
                    ruby-2.1.2 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
freerdp-440916eae2e07463912... | 2 
            gst-ffmpeg-0.10.13 | 1 
                    neard-0.14 | 1 
                 webkit-1.11.5 | 1 
                  autossh-1.4c | 1 
           xapp_bdftopcf-1.0.4 | 1 
           libmemcached-1.0.18 | 1 
             subversion-1.7.18 | 1 
                       unknown | 1 
                 python3-3.4.1 | 1 
                  thrift-0.9.1 | 1 
                   mpd-0.18.14 | 1 
      host-xlib_libXfont-1.5.0 | 1 
             bluez5_utils-5.21 | 1 
              librtlsdr-v0.5.3 | 1 
                 gnupg2-2.0.26 | 1 
                    ola-0.8.33 | 1 
                  ffmpeg-2.4.1 | 1 
                   czmq-v2.2.0 | 1 
                     tcl-8.6.2 | 1 
           heirloom-mailx-12.5 | 1 
         qt5connectivity-5.3.2 | 1 

Detail of failures
===================

       nios2 |                   autossh-1.4c | NOK | http://autobuild.buildroot.net/results/45c1400a8490b61844abd52d57e3d21549910ba2/
         arm |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/006624eab44cd7b917f4ef1556b351c243c041c4/
      x86_64 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/580188900a382fe88c19819e99fc3f379d49e289/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/cd53af973d9722481c3298f484b399c9a2c286cf/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/caad4172db90879db51b66625b98aa0805e39c73/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/d2f51632aea5727df9404e611e8e379567f03b61/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/a9a2c49d923fd891945a24c9d0d147b3eea9b037/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/2eace18d0d32b4cbb6120b06d2bbe79d2b9857a7/
         arm |                     ffmpeg-2.4 | NOK | http://autobuild.buildroot.net/results/a622dd113dcb7b352bcfebe3b3c7ac6ed286d7c7/
         arm |                   ffmpeg-2.4.1 | NOK | http://autobuild.buildroot.net/results/be54e75c4171d1db0eaaaeb5f5df29751d7db57b/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b8ebd2e2d079b9a82f43c3591084cd1bddbc9cea/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/6110dfb78388a6d332187627c8e7b8fd72e580cf/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/989648cfd3cc5750992fbbc784726dca4be2e920/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f621a89a58598038e155083be14fba4c99eb6092/
     powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/b91690288abba1cd30d9dc0a5c7e537fa1a7c489/
         arm |       host-xlib_libXfont-1.5.0 | TIM | http://autobuild.buildroot.net/results/7176d7460e3efe671c515b616e8efe9d17120ade/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3c4c31ee735533b56a866330986bb6139996f8bc/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/d68a23e2a57fd5430d74b8151931f36959d9578d/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/599fe97fae59f199265e065834cd82b3610fc3c2/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/35f8309449c0c475f32219a757deed4997ea5ea5/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/a3584e014c477f723bad33bf2232f2a7d3785ffa/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/453438875f53a6eccc9e58686a5cdcea3665efde/
         arm |                    mpd-0.18.14 | NOK | http://autobuild.buildroot.net/results/778e0731f1412edea9082116ce93900366247d37/
     powerpc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/2a1a098fb4e0421a8958c557c350bd48e4adff7b/
      x86_64 |                     ola-0.8.33 | NOK | http://autobuild.buildroot.net/results/e28a0323c5054409e2769c4f6d853560bd387973/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/b3788b6fc254ce8bc996e20481357ce87d849c84/
         arm |          qt5connectivity-5.3.2 | TIM | http://autobuild.buildroot.net/results/9dce125466797c3baf2e3f82dd9b63ed1b40e6e6/
      x86_64 |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/3b5f6e7999624a9fe4c985fd5ad05d199db00cc7/
        bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/7492c6b35895689ca2d226a753eb127e49cf9c2f/
      x86_64 |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/7a9a78700a48b2d66a0811d1209ee43c7b678ce3/
        sh4a |              subversion-1.7.18 | TIM | http://autobuild.buildroot.net/results/3a1560b3e134de5f5ae777f5d01f36f4184555af/
         arm |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/3b578c6abe38f18ef83199ec7ac1d9b4bad14f0e/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/0a7656f1f31bcbd04faa260f4e36e97f7a221d5f/
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/cdc0e8e02e2168281a6903da4ed64988d91912f2/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d552bdc93a59973ab99aac18a687689faa7cfec8/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/21c1d8a3e6f979a15afc287ee9c96e3c290ae98d/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/490f1e8fc5a7e1d83dcdfdb1d787d2982ad528ef/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e2bf975aacd83dbac3d33a30f3f54e68fa808963/


-- 
http://autobuild.buildroot.net
