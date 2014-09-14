From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-13
Message-ID: <20140914063013.2E5D2100F07@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-13
===============================

        success : 206
       failures : 37 
       timeouts : 3  
          TOTAL : 246

Classification of failures by reason
====================================

            libsvg-cairo-0.1.6 | 8 
                 tn5250-0.17.4 | 3 
                    strace-4.9 | 3 
                  zeromq-4.0.4 | 2 
                 gnupg2-2.0.26 | 2 
                 wayland-1.5.0 | 1 
                 webkit-1.11.5 | 1 
                 libraw-0.13.4 | 1 
              uemacs-4.0.15-lt | 1 
                  tstools-1_11 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                      qt-4.8.6 | 1 
                     vlc-2.1.5 | 1 
                 libssh2-1.4.3 | 1 
             bluez5_utils-5.21 | 1 
           libmemcached-1.0.18 | 1 
                 gnuplot-4.6.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                     qwt-6.1.0 | 1 
               alsa-lib-1.0.28 | 1 
              libsvgtiny-12121 | 1 
                  xerces-3.1.1 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
        perl-xml-libxml-2.0116 | 1 
             libqrencode-3.4.2 | 1 
       gst1-plugins-good-1.4.1 | 1 
                 omniorb-4.1.6 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/1da77cd666772a55110395fe257d73f55b6fd95d/
      x86_64 |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/448373dd6028829cb71175cf6dba5573d23e035a/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b3b409ab78f2f9a9eb0e0b54847d7964c3bb36ad/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b560b4c53fabd88ebca1f78d0ffedbcb0ef1c5db/
        bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/5ded5a7f80544f131f82027958a541a3733db7c5/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e860a8b90397f3c34b899eafb58df167a117d741/
      x86_64 |        gst1-plugins-good-1.4.1 | NOK | http://autobuild.buildroot.net/results/9f0aacfbd0c459ede47826ea2e42924a0ff63fdf/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a49c369b4b251580c8f64ad019aba3258c95656b/
        bfin |              libqrencode-3.4.2 | NOK | http://autobuild.buildroot.net/results/1ca0719dd1fe0bbc528ec99b5bc2b42e985bfdca/
      x86_64 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/3d65cf351d3dd89b5ef5b339d5b8f474c96e2c19/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5d49bd0b0d592567deda94b38d487d868e995196/
      x86_64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/465597702c314ca04e910b00b6b94419997cec72/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d63e3d835af9546826a019ee395b584c3a5c3ec9/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/2954206a3bf1401583fc069500988fc0837e619b/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/740b14ce3a75cb89d296b9cb7fefa2956de9c924/
        i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/3c0f2d7665417771b1bb461d13630250832c1073/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/1f7fb838b039f4e85e14346bbe5ddc8bef26edf1/
     aarch64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/2e09642ec05bbfc68d9c39454cac45b3a4fb520c/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d19635a8be054d1cb14f575c045b47020d44b582/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/37161481eeea74bb67d40755a98ea9f38c6ea44a/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/fbe6c722b92fe4ddf7ac36a8fe1be3a3891c11fd/
        i486 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/389617c7c36dfe92b85d3a3db12a706ae092c73d/
        i686 |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/54df19105c151ba4ffe30ec7b76592c5ad03f182/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/aa644a9ec6a702033499fd194ccd340e4aa194a4/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/32c3860edaf14e0dc149856bc6b997369e166833/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/e8f4965b27c9dcc58d6ec77cdc48b83c218c5bec/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/b1c6e25f2f90b329eee57fdd7cdc66d7f551cf9a/
     aarch64 |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5d1b59b73a476a9267805f6844cccbffcbb199ac/
microblazeel |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/4831e82f91187afd7d78f4824df189ef062987ac/
         arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/85a8e8b771f1d118fd4a25163ab44558a4de5ed0/
      x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e7cc022ca102a837207f9f0453fb265d2ac00b88/
     powerpc |               uemacs-4.0.15-lt | TIM | http://autobuild.buildroot.net/results/d301c796eb11936a7bab374c221806c6d83e2198/
         arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/2d2bbd633dc09e7471e8b48be39b74fb1bf6336f/
        bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/ff5b1895325204e060cb500f9ac40dd373df2c64/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a2bcf55a304d1129a7cd58f4725511f96abe1968/
        sh4a |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/a34cd26d34acd185fcae01a0e6ea4a8a217dd5a3/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/fb851ecb9794c0ffe15138664cda0ef276fea548/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/779ff42d63d7d192771575e11902b43a0b63274c/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/de0da33dad120f5fd02601d3da68ddbcddd552fb/


-- 
http://autobuild.buildroot.net
