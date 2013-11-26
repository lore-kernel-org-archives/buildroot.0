From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-25
Message-ID: <20131126073003.0DD121014E8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-25
===============================

        success : 87 
       failures : 30 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

               alsa-lib-1.0.26 | 3 
                   attr-2.4.47 | 2 
              fontconfig-2.6.0 | 2 
              e2fsprogs-1.42.8 | 2 
               w_scan-20130331 | 1 
                 ffmpeg-0.8.15 | 1 
             xlib_libX11-1.5.0 | 1 
                openssl-1.0.1e | 1 
                    crda-1.1.3 | 1 
                 mplayer-1.1.1 | 1 
               audiofile-0.3.6 | 1 
               qt5webkit-5.1.1 | 1 
                      qt-4.8.5 | 1 
                 webkit-1.11.5 | 1 
                  python-2.7.3 | 1 
          host-protobuf-c-0.15 | 1 
             bluez_utils-4.101 | 1 
                   duma-2_5_15 | 1 
              gettext-0.18.3.1 | 1 
               libglib2-2.36.3 | 1 
                coreutils-8.18 | 1 
                 cairo-1.12.10 | 1 
             alsa-utils-1.0.26 | 1 
                    fltk-1.3.2 | 1 
                  poco-1.4.6p1 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a2eeedeaef96c0bbd23c9430871410c569e8646e/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/031df24367490dd7dac02309621af865fef31711/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ff04577be7f1cabb123ddc65dfcdfe54d726cd60/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8e61e0227570a03ea2f8c2f095f446dd1d188573/
    mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b575154552a06c414a2ef2a39f572523ccd7bf54/
    mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/12fd65f29ae90559762456faa6e949968201cbe2/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/02e707ba74f825219714e76c9fb306b523023da5/
    x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/36f2f12a136ed045fb270cdf7d7d39c87c0ae384/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1deb9bed455529ead3fe23082558a019f474af52/
    xtensa |                 coreutils-8.18 | NOK | http://autobuild.buildroot.net/results/b763cb432aed8cbe46c1edf194a1ce15a960a362/
      bfin |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/9d0e3377bbf55e56ba7c06e8c0f385ccfaae7f46/
      bfin |                    duma-2_5_15 | NOK | http://autobuild.buildroot.net/results/ff3af32c9415c411f2b3e18e78650683ae7d09d7/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/f1b55926466724ef623d7be5610f3863e5eae43e/
       arc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/8fce03b91dabc17cdf2187ec8001e59e6ad479d8/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/26e8958075df9c15be49b8c06aad0fbd38c82d0a/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/1a50b547ce2c5617947240c3e293f4dd57f85d8d/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/70dcd384d67121749ae61a53e006f6aa73ce6f99/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/0fc86850c19f4b2a40044708359e2d852d57c908/
    mipsel |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/e07a73638feb7b4992973299f1096eef1e5032e4/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f47c4f0883019ba3a8e61a9ae51b7bd7f347b38c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9482faf844650527e96ca2037ac1dc6196ede32c/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/fd35ca0e30a8d944cf88c8374bf51cb966bdf044/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/250d87d41a74ec42b908f80c9b850f84f4d2570b/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/83cb56b06027b63a72316e25c5c0c263af27effb/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/b8e153e05c7e693210c766b3c162505c1674392f/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4d35bfd8bfb94f59a49e43237e3077319715cacb/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/d5c8ea63c4c901a9c90730bcd1847ca68f3faf7e/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/eabbf0dce6b5b3e32b87c7a429354b5297f1bde8/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/16c4c944500c028c724144288110e37d05450978/
      bfin |              xlib_libX11-1.5.0 | NOK | http://autobuild.buildroot.net/results/21eced4370341ad39b456c65514221783be3e05c/


-- 
http://autobuild.buildroot.net
