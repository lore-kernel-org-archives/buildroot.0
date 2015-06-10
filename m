From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-09
Message-ID: <20150610063013.261A2100C01@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-09
===============================

        success : 231
       failures : 11 
       timeouts : 2  
          TOTAL : 244

Classification of failures by reason
====================================

                  stress-1.0.4 | 2 
       host-erlang-rebar-2.5.1 | 1 
             alsa-utils-1.0.29 | 1 
                    qemu-2.3.0 | 1 
              strongswan-5.3.1 | 1 
                 libssh2-1.5.0 | 1 
                    webp-0.4.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
                   zmqpp-3.2.0 | 1 
               valgrind-3.10.1 | 1 
                     php-5.6.9 | 1 
                 libepoxy-v1.2 | 1 

Detail of failures
===================

        i686 |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/bd50805edf02f498dcad39defb843fc9f0c7f1e1/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/57e8e2640d59391a06e1a56f60562df2f1a9c46d/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/06826b263d43482c65808ca6186b04f19ec15d30/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/3f25428b9c81f483b7f923ecd41ea1b51196b597/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/c4af12e247ca0d9616147eadb79fe1663f722535/
        bfin |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/1ace407113aad9b607d3d982695d9b2805dc6dc7/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/e3422fd005443a37a9a24d64f3672e7f9dcec0e3/
         arm |                   stress-1.0.4 | NOK | http://autobuild.buildroot.net/results/9a8dbd66bc072475aed4d5b38597ee34b54a769e/
      x86_64 |                   stress-1.0.4 | NOK | http://autobuild.buildroot.net/results/dc2367dd3def7f4fcdda8cce6bf72fa07b470014/
        sh4a |               strongswan-5.3.1 | NOK | http://autobuild.buildroot.net/results/8179be910901c161402c1cb59a50e9d37489f3b2/
    mips64el |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/352d087bf5daed8ce2c7e2d61db2e75db9b069b9/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/153ccf9557958e64f75f6dc3c44dd91fcfefd960/
         arm |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/bd6923858681338acecc4ffac13fdd9b7b5a1e50/


-- 
http://autobuild.buildroot.net
