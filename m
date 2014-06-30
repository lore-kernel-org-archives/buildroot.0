From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-29
Message-ID: <20140630063010.61847100EF1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-29
===============================

        success : 115
       failures : 32 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

      jquery-validation-1.11.1 | 6 
          perl-net-ssleay-1.64 | 3 
                    sdl-1.2.15 | 3 
                      lzo-2.07 | 2 
        perl-xml-libxml-2.0116 | 2 
                      icu-51.2 | 2 
                  python-2.7.6 | 1 
                     devmem2-1 | 1 
           heirloom-mailx-12.5 | 1 
                  zeromq-4.0.4 | 1 
                 webkit-1.11.5 | 1 
                     crda-3.13 | 1 
                    fltk-1.3.2 | 1 
               alsa-lib-1.0.28 | 1 
                  dhcpcd-6.4.0 | 1 
               audiofile-0.3.6 | 1 
                libsigc-2.2.11 | 1 
                 libebml-1.2.2 | 1 
                oprofile-0.9.9 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/866b452df6d50b7a04bd4781f839e611f9764763/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/8dd6c9ea90c3104e84baa1e15045d47c21533f1b/
      bfin |                      crda-3.13 | NOK | http://autobuild.buildroot.net/results/51756ae0d6184a5ff3cacae8e96df9a31e2bf6b0/
   powerpc |                      devmem2-1 | NOK | http://autobuild.buildroot.net/results/c45eb706fb35ffc87fede777c3d20479a90872ae/
      bfin |                   dhcpcd-6.4.0 | NOK | http://autobuild.buildroot.net/results/5f44b75d1522c0a2f01fbd42b9616329aa155a32/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d53f6242cb0eb407320caf4e30241b684c5a61bb/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/b98f1e51d70daca85cba079fc477c80d9ad1f5ed/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/811e1acfab496ef3023384b7f3cef605c370c43e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b834631d5091e98dc8e3f1c0141148333fb115f2/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/83c6fa270baebcb27ab4eb070bae737f151eaa1a/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/1f75821a1d1aeb5dba076f73736a65ce8d8f4988/
   powerpc |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/f15f8eb2031d51a99b7c0cf220690c3becfb2065/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/a00e5b185b5f290e5fd3be1505c9e33d6234e90b/
    mipsel |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/ed85db4126050275ea13b602c42ed51273139ded/
      sh4a |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/6e348a53cbff87d75b66b49b6ebf1c73a56ba3df/
   aarch64 |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/fee54cef5d5d19a7bea355e2ac7120aa037b46c1/
      bfin |                  libebml-1.2.2 | NOK | http://autobuild.buildroot.net/results/4b4f7fab554ff71a148572eed6d910c5d32191bd/
       arm |                 libsigc-2.2.11 | NOK | http://autobuild.buildroot.net/results/344e59d1206a22a1d9c358e2898ce864c8ac51b9/
      i686 |                       lzo-2.07 | NOK | http://autobuild.buildroot.net/results/327fc192c6753237604fa6e203f9bef448c6128b/
      i486 |                       lzo-2.07 | NOK | http://autobuild.buildroot.net/results/1e8e826c4463c9dd3aa5ddb95f08b9564d10a75d/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/82dbac394e9e737a062c0608e6fd5fe2e803da31/
   powerpc |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/6dd6bf7d0a814aa508062636fd72de1d07c1816a/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/0b8c326b7b36537b8c082191589616a81412a7b1/
    x86_64 |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/2553a13530fe0a2bb352de0a683afccf352f5cd9/
   powerpc |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/f809c99ce4db80e64ca46865fcd9b75b0dcc1fcd/
       sh4 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/7b6224822f3c1d41a2a76a7591ae06c72dad12bf/
   powerpc |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/ccbe9f933ae01cdb18446631be7917e681c67eb6/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/533a241055dcbaf0d0547f61f9133d3a93e9abaa/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/bc799517f8b754cbf029b25f5bced74f0e810d18/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/56a39ebcdb3fc53c998b75122da64abe00fe4c13/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6cb32bd788d8d4a552d944a3a0cd305a5faf27e3/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/ccee0b42c6c5b4f67c743254c2656fc857ef50d8/


-- 
http://autobuild.buildroot.net
