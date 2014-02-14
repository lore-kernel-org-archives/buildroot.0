From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-13
Message-ID: <20140214073009.1D7E6102637@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-13
===============================

        success : 94 
       failures : 31 
       timeouts : 3  
          TOTAL : 128

Classification of failures by reason
====================================

                  thrift-0.9.1 | 3 
                       unknown | 3 
           imagemagick-6.8.8-4 | 2 
mmc-utils-11f2ceabc4ad3f0dd... | 2 
                 cairo-1.12.10 | 2 
                 pixman-0.30.0 | 2 
      libnetfilter_queue-1.0.2 | 1 
  toolchain-external-undefined | 1 
                     popt-1.16 | 1 
                  samba-3.6.22 | 1 
               w_scan-20130331 | 1 
                 qt5base-5.2.0 | 1 
                      udev-182 | 1 
                  tstools-1_11 | 1 
                    crda-1.1.3 | 1 
                 libxml2-2.9.1 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
                  python-2.7.3 | 1 
                 dropwatch-1.4 | 1 
        ltp-testsuite-20130904 | 1 
                     vlc-2.1.2 | 1 
              e2fsprogs-1.42.9 | 1 
                       kmod-16 | 1 
             host-libeet-1.7.7 | 1 
           host-libxslt-1.1.28 | 1 
              gst1-libav-1.2.2 | 1 

Detail of failures
===================

      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/899395ce00ba54f19fd1f8ebaf1ea7a15e3d98dc/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0fcb07e9efbef5881c986199e2c1358d7fd9cffa/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/780c3388e408ae6479e824711b1c02fdbd34bef4/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/916eec6a8853c49eab5b7806edcc0add06b8168f/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/
    x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/2d83f38b4a6cb2a1a47c78306da7773270ce698e/
   powerpc |              host-libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/e3581e4a17e2c577458f5481b391f548b7fcdf69/
      i686 |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/784b3989fab4007d6d077fba9a9078cf337ce002/
      i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/a9d35975c7699515350eb307712cd69b6d48e418/
       arc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/97ec0c366c24bd03fe4c26851e8729a4d8eaf4d0/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/ba205bcbb6898bee78f610883f3837930eda262c/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/3d77c91847a099b2498030505b91f3f84c81df18/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/4abdea83c6915aa02b6dc55c9a9dd964ba70ac4b/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/f6aa04e2b904b1aae3b68b2ffbb1b8edb6f4929a/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/79e24d5ada564e664f32041cc71a1aeac0d9d5cd/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/b23f295008a834bbb37b6ea5c99842409b652bc9/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/3becd76e2a7c3cf843d43ea9f1713fd536888cd7/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/2b1feb18dc415c69aae6de9d558e527faae7b246/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/8d3ee14585f54c6946b449854df9f06ea7746e8e/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/64ed5890d4d03399eb549cba4aa3e65afd3b005f/
    xtensa |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/70b77e7a5b292e3fcbcf8cab4651c48220f2bd17/
     nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/bc674e494c24155800583dde5dfda0709709becb/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/eb6317433b89d3ad2a70b39a186ee223bc3f4a41/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d439787cb8b3ee3e001dfd24e93351201a1387ce/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c397677e2332c9a39950ea840333fc05d04c2e68/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a659d7ede91bb13904c360fe8c8f316b7011918b/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b92b707ec32bf6f9a0c5834fd68d81d76d1a6365/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/4df8cd85e0287910567df81c0394b2914570e98a/
      bfin |                       udev-182 | NOK | http://autobuild.buildroot.net/results/386be48be71ede6e06ea5547e37a1b6448f5fba2/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/52bc9c4c2dfc0bd37f7170b98a2201ed853bad74/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/899155257298dbc85c1681f900ddd042ead98412/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/b908769c1291da8f758a44b04d36dbc415400b39/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a53ea017ec92150c7d37c0da0ca9a8dac75f460e/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/6e7c691099a8f3eef4fc84860ceb1a94f25873eb/


-- 
http://autobuild.buildroot.net
