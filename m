From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Oct 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-02
Message-ID: <20131003063006.98DDE52C6B7@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-02
===============================

        success : 49 
       failures : 68 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

                     bison-3.0 | 28
             gstreamer-0.10.36 | 11
    trace-cmd-trace-cmd-v2.2.1 | 3 
                netatalk-3.0.5 | 3 
                 cairo-1.12.10 | 2 
                  aespipe-2.4c | 1 
               libglib2-2.36.3 | 1 
                  imlib2-1.4.5 | 1 
                 dropwatch-1.4 | 1 
                      pv-1.4.6 | 1 
               uclibc-snapshot | 1 
                     m4-1.4.17 | 1 
               binutils-2.21.1 | 1 
             tinymembench-v0.2 | 1 
               libcap-ng-0.7.3 | 1 
              e2fsprogs-1.42.8 | 1 
                 libvpx-v1.2.0 | 1 
                      qt-4.8.5 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  usbredir-0.6 | 1 
      host-gcc-initial-4.8-arc | 1 
                  poco-1.4.6p1 | 1 
               uclibc-0.9.33.2 | 1 
                 binutils-2.21 | 1 
               libsigsegv-2.10 | 1 
              gettext-0.18.3.1 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b7330e455958c378b3137698d660d766b35b9c0e/
microblaze |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/2b10358b3540f9a12fc777bc37afbfb6072d2a47/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/8244788b518211947cd850e97ab80c43426a07a3/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/24038213e8f91fc5df9fd9ba0f4d63d9214e8044/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/1d486763afb844ac2dc99b87d882fdb9be2774dc/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/2d7f9abb893d6d1e66134563300bab18990242cc/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/eef3dde3e468fa6a452af95f8c6bbe641838f2f1/
      i686 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/4ac265e616f9f851b85f00be24f362bdde231618/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/6c14949d87aa638fe34ef9ecd23397d39bbac276/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/42fb65fe48b9abb7b78f113b278009b496a49650/
    mipsel |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/27ad6fce76fab6ccc333542196ed64d76787f4f5/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/7405986254c5985f130e1ea2579558744e4caf1b/
      i686 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/a24d89ca7f051121c4130c234d2742437904e10c/
    x86_64 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/c7ca3542568a1b2c571e28de42acb4a3150cdf01/
      i686 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/3aa470148971979a7fa2eaedaad147df66f44a6f/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/3a701925c937dc0b14346ad66d74fc6b1efc308d/
    x86_64 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/64bc0b0272bcda5f02a2e7925cd48d5764548371/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/7ac6c9f73d3eba76c178e48f9867a4cc3d199dc3/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/55a4f23ad6bd0eb67bfd7145b4e21ee8b6d2341b/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/3ea4c393bd2596844fe5721d9f0f1e7caf31d84b/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/447b9a5ffc15d7c3da1c3e3fc16d128608b3d476/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/3eae37e0cf6f8de0210d9feb104444d027b322bb/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/667157b92d06a7bf593ec845f52fe0cb80d3c1f0/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/4a3039f2a47408fd92bafa4ac6e51c701e58f33a/
      i686 |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/fcc629b8bdb9d45010316d1380e95eaa5f249ef1/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/48a85de5171c86d1f371e831458889a62dd2eed6/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/e8a960f38e66f31355af733e510002d45052b541/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/002dbde7780bcc36581b74f74f8ca4629b8ddefc/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/d673e2f8134fce7565f265fad6949c060b55ee59/
   powerpc |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/82a4ddc872068fcf69d1caa3cc87df3d100ed166/
       arm |                      bison-3.0 | NOK | http://autobuild.buildroot.net/results/c9369e2308d6b0b206e184bffe86041f4408bb99/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/dec414c29fde59d9394f8401771b4c1c8295858b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b5c592f7cfe9f5bb4eb461c1884c1bac4d69f40f/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/30f1d08fb6bb4b6596c81c6ba3fcbc1109cc5f80/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/1661df265583bd910de23a8688e5c2544880780f/
   powerpc |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/bdba62c89b1ebbd7135eecf82b5e64e08df23d42/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/47385849cf5f6ee1db431362d89104589c5503db/
       arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/4684d31db5c4e877d0413898bcdb3d6cb5cb84d5/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/22090af66d34d9049607f1b1cad34123a9532dc4/
       sh4 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/ced6ff1a4721168dbcd82346797ac01a48d0789e/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0037f1ad9b65885b141423ce8ecce5728760b306/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/7b3c4ad96254c2891b4c630ea84391467f3b6cd2/
       arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/388e5ca64a7bec02d397329dbbb6fedc2beb3a1e/
      i686 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/d69fb1673ddb31f1109aee0279256d509ebb6b08/
       arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/d8d3f730922deeeaa186bee2113d70eed53e12f6/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/06811a750715fd806522486f6fdde28c86bffff4/
   powerpc |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/af0c1f66a05ff08bf10d2abaef6aab6421d7a62e/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/bcdd19767cb5821d1577f5bd896dafc71e220b7f/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/1be5470f5c697cfd9486ea64e9fd295e438f23c3/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/ce112e13d9aaae79ec2e871b8fe6c88517d9fd9f/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0a26b484f1cc01d6c150f6f855b2b8c7b03d585b/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/0e1b5ddb26d25cc01ef91c19ec0082b62ae3fcd1/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/490c20dd057b8ecd99deb9c401c564946b01b7cf/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/c312d921605f4b4ec43bf7890d79ef8394a34ef8/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/51e1e7567afa827c6827e6e1a2bc027e61f92d92/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/2a740818aae0f5e62cdff1d089e5692e151534eb/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/8f61b3f109761053b2e399671e96cc4b53a9a804/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/62a4bdb5a93a2b94ec9f32d590f16bcf8e8b754b/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/ec20db979cbd8116d79486fb6f5d0d6c7e2ecbce/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/8f53c50971669823e031ec1680b9df067312fa25/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/617ddf4ad0b593b86535b0b659e10d9b08a984c8/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/268499509a2ad09dbad11d16655f05e04a03ff32/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b73f2fce17e4bd58431580e99b8af74228abaa70/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/487526ec10a428f0c81a1828aee3854321a344aa/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/25004cfd55b7a215590ed5a931bbe6ea8bcac3f7/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/c9a6adc790f25a984905e43f4cdd8cfbc64bd4d2/
    xtensa |                uclibc-snapshot | NOK | http://autobuild.buildroot.net/results/7b4ee8b7c69cd0bd5a131f0fa2a91217f8a16f10/
      i686 |                   usbredir-0.6 | NOK | http://autobuild.buildroot.net/results/cfa9a634e133b6ac1cea4818d988652d7e16b8cb/


-- 
http://autobuild.buildroot.net
