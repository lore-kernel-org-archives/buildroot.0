From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-16
Message-ID: <20140217073009.1BAB9101553@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-16
===============================

        success : 94 
       failures : 27 
       timeouts : 0  
          TOTAL : 121

Classification of failures by reason
====================================

                      icu-51.2 | 2 
        ltp-testsuite-20130904 | 2 
                     vlc-2.1.2 | 2 
                  thrift-0.9.1 | 2 
               qt5script-5.2.0 | 1 
             iputils-s20121011 | 1 
           xapp_bdftopcf-1.0.3 | 1 
               alsa-lib-1.0.26 | 1 
            gst-ffmpeg-0.10.13 | 1 
           host-libxslt-1.1.28 | 1 
                  libogg-1.3.0 | 1 
                     php-5.5.8 | 1 
              gst1-libav-1.2.2 | 1 
                    fltk-1.3.2 | 1 
                 mplayer-1.1.1 | 1 
              e2fsprogs-1.42.9 | 1 
                  python-2.7.3 | 1 
             gstreamer-0.10.36 | 1 
       gst1-plugins-base-1.2.2 | 1 
              gstreamer1-1.2.2 | 1 
                 qt5base-5.2.0 | 1 
                aiccu-20070115 | 1 
                    crda-1.1.3 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ee0bc10681e915257c0bc160c345c474ba1bd5df/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3f98efed297d3c6dde7aa0b3c55be779d76fa2df/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/1f1b3962cf6326f893f7e39bd0c460d8ec5f9f7f/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/09ee0dc0c67e6e8d58bbd1de2ffa0c9c2cc2b972/
    x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/fdc3eabd63d0b15c47496e993443a6936a3de898/
    x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/ec70885bfbb8f126116f885c3f5c0d30b06a42e6/
   aarch64 |        gst1-plugins-base-1.2.2 | NOK | http://autobuild.buildroot.net/results/2fddb0ec74b5183f79a4a591bf9484b2cb37e26e/
microblaze |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/b23129613f1849ba07ea9cddd83e43bd918a819b/
microblaze |               gstreamer1-1.2.2 | NOK | http://autobuild.buildroot.net/results/70ba92b5673f5f14c2fab1b0ca7129f5f9e18637/
      i686 |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/39202af201a74e4e173c21062ae268bbd1210231/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f7baae3487e893e484c43b372cb54adf41591e64/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/eb8e58afd53155d4edfbd3cb33b0eb76069476cd/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/e9451cf467d7ae1cf878167be13dcfaa07d81e6f/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/6529e52f1d48d618702231c6dafcdd34ec8603fd/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/61e7650ac417e158ae78cc95ba724e68361a8a96/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/827b6d6a4b8977d6ec26af371babafec344d7c8e/
      bfin |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/109b7c9b575c7362c4982a908a1e3695e7590ebd/
       arm |                      php-5.5.8 | NOK | http://autobuild.buildroot.net/results/e18eb3520725de2aa2fc6ad653000a29bb9d71ba/
      i686 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/576d2159894425f8ee9447650c604b825c9ea32c/
    xtensa |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/fa8c86d45128c478ca8426be34eb0bc1df9d58a7/
       arm |                qt5script-5.2.0 | NOK | http://autobuild.buildroot.net/results/e85152c01d46946f53902115ec662044279eb72c/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f837440fdf8b3bddfc6cc548902a0453640fa6b4/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ff7ab52c3965f9545c197f7552d3bc629b900886/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/d18a6d3ec44cf254e20e934d84d41c613ff4c900/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/6e0633294660f29fedfa205362b0b3169f4e2f4b/
microblaze |            xapp_bdftopcf-1.0.3 | NOK | http://autobuild.buildroot.net/results/db37576b884dfc6b519839bc3b7364062de1feea/


-- 
http://autobuild.buildroot.net
