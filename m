From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-25
Message-ID: <20141126073012.94DA6102DA6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-25
===============================

        success : 162
       failures : 14 
       timeouts : 1  
          TOTAL : 177

Classification of failures by reason
====================================

               libsigsegv-2.10 | 2 
libshairplay-64d59e3087f829... | 1 
         conntrack-tools-1.4.2 | 1 
make: *** Waiting for unfin... | 1 
                 webkit-1.11.5 | 1 
                 libnss-3.17.2 | 1 
               alsa-lib-1.0.28 | 1 
                 clamav-0.98.5 | 1 
           libmemcached-1.0.18 | 1 
                  nftables-0.3 | 1 
              libarchive-3.1.2 | 1 
              sqlcipher-v3.2.0 | 1 
                  thrift-0.9.1 | 1 
           xapp_bdftopcf-1.0.4 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/0e568816c741a4eab9a66bd80bf62da491596612/
     powerpc |                  clamav-0.98.5 | NOK | http://autobuild.buildroot.net/results/b491f4e5e1760248adb8d21b404e8aa15f7dbdd1/
      mipsel |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/77e5f95ec4f0b3284eb7a48b8152690f8bf81a2a/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e8095fba77ef2032574ec65d4eafdc19e85377c8/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/60202da540764bed7596aa9dc72bbfcee58ef455/
     powerpc |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/b38ca884fcac26620840272bf8188d55c37fb264/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/bb4778f0107c5ce12d801282f23f92cdaddd8bd4/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/59f55f7ed66d5cfdb6ffd0844079fc0395e86850/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/70aca0fcf5e36707181b553d4ccc7e474a8ff155/
      x86_64 | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/acce95d1505735bad34b841ce013454426c2b38b/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/87ecbba5b9b16d592a48fe827fa88ef5a5c6d09b/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/59d8d7c7f3e0a205503121c1288187471c0ce80f/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7cd42692995d7abc4189feb6435a754c12ddba13/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/9daacb124ad9450d0a61c052c8f919b0d2147679/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/464fdc71690a437c1782dd8e4c75d78195bf8bfd/


-- 
http://autobuild.buildroot.net
