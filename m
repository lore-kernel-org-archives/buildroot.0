From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-10
Message-ID: <20150211073015.D49F7101159@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-10
===============================

        success : 319
       failures : 22 
       timeouts : 3  
          TOTAL : 344

Classification of failures by reason
====================================

     host-google-breakpad-1373 | 3 
                  zeromq-4.0.5 | 3 
           libmemcached-1.0.18 | 2 
                 qt5base-5.4.0 | 1 
                    strace-4.9 | 1 
                      qt-4.8.6 | 1 
                    fltk-1.3.2 | 1 
libwebsock-3c1615eeadb0b582... | 1 
                xapp_xfs-1.1.4 | 1 
                pinentry-0.9.0 | 1 
           host-gettext-0.19.4 | 1 
                 python3-3.4.2 | 1 
               libcap-ng-0.7.4 | 1 
                 webkit-1.11.5 | 1 
                  thrift-0.9.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
               dvdauthor-0.7.1 | 1 
                   perl-5.20.1 | 1 
         qt5connectivity-5.4.0 | 1 
                    php-5.5.21 | 1 

Detail of failures
===================

        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/9d7d173ae5823375f0985f701cd86a51d0b27dc0/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/bdfb59e926ebfb82f7d10b2028f7600b31ddb5aa/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/2ac0ccf8fda720438e146d6a6b03d05bf1b68dd6/
      x86_64 |            host-gettext-0.19.4 | NOK | http://autobuild.buildroot.net/results/c4dcbc0e41deb74d79c519336b4b6881a59ec18e/
        i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e3c42b2a8334d910f44f7a908371796a332f20e2/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/04940f2f0110bc3bb19cd96cc75a6d2d7e8affd5/
        i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e733fac165c7b90b529855b0e1ccf92ad4ac9eca/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c18ce11c254f8a31039a62e3a3741ef400a4ba90/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b9699e3d0967fa9c877b1019ed8039285320d9de/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/aa2244b6a944f74bd1bf79a999a5ccbe2fc5a4dd/
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/5479e1bae7a45fa3b43b496eba45b374cda74914/
      mipsel |                    perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/bfebf82f33ca17b57ada59e439f82c0b631a671b/
        bfin |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/d583cc5ce3f21d17585ae966fe47e21f03278116/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/b5178ba30f7549a314fd461c77e88bfff8b1294c/
        i686 |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/d1687d34d9cd8beb75254e0d549dff8c0cd9cf4f/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/ef67162818424145df1ddbfca1d456b67ef925e3/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/91f52658b4b88f58ea11a02e21092dca79d0335c/
        mips |          qt5connectivity-5.4.0 | NOK | http://autobuild.buildroot.net/results/5b85c6819f94988abd8abfcdaad6226ceb2d790a/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/86fd6ff23b99e31586bb978e1627a30860469657/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/e34279f7aaf1dea88124181938c8877966de7ff2/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/0cac60cb94c872f01bfc162ebba49f6cdcedb8c6/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/d692377e57c2bf63c076dc18ba2bfe4be29036e1/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/bb44e7d6d35b8461800b496f0b1a95283ba6c968/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/72ba99ace974d223c4527d38adaea69b6c331394/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/cb691f7c7c0717d49541b40d6ad8d8626ecc11d4/


-- 
http://autobuild.buildroot.net
