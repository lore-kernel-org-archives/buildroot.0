From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Oct 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-30
Message-ID: <20141001063012.7DD7A100CC7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-30
===============================

        success : 121
       failures : 15 
       timeouts : 2  
          TOTAL : 138

Classification of failures by reason
====================================

               alsa-lib-1.0.28 | 2 
                upmpdcli-0.8.1 | 2 
libshairplay-139d5ef5556451... | 1 
                   ushare-1.1a | 1 
           heirloom-mailx-12.5 | 1 
                  nftables-0.3 | 1 
        gst1-plugins-bad-1.4.3 | 1 
                elfutils-0.155 | 1 
             alsa-utils-1.0.28 | 1 
                    ruby-2.1.2 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
               valgrind-3.10.0 | 1 
                 tcpdump-4.6.2 | 1 
             subversion-1.7.18 | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/88ad89f6c4bef430ad43713ef743653a33e054d3/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/7202edea11ee8e3b241b5d2610f51ff8b6e4ea8e/
         arm |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/2ddb85507ddb0deaa6e9a966a8c0e732ceceeb6f/
      xtensa |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/8ab7fce71e778b5eeba3b027d6f16f246d1da099/
      mipsel |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/280fdbe2b33e34cc6989364c6df3dd75ecef65ee/
        sh4a |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/e5d2c4d66387bf6336c5744febee3e32b9f2b1ed/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/a93fb9ae929c224c02f50c62bea703e60005edbc/
        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/f6c6db3e08bf6b95ff22d8665095982f103f53b9/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/b053c3162e610545668e79e35683a22563d65071/
        bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/f981e6f3aef0252ac686cfd2951547008a263819/
    mips64el |              subversion-1.7.18 | TIM | http://autobuild.buildroot.net/results/0a4a88a695ad411c79ab195dd5bfbcf917ee503b/
      x86_64 |                  tcpdump-4.6.2 | TIM | http://autobuild.buildroot.net/results/c05ac21feb10318c8e31baffd47deb94aac0fc4a/
         sh4 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/e5be8fe46a30f0b417fe5fc19a27c480d885791e/
         sh4 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/a3453afddff4fc03681f7fbdff3ccab9706eb189/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/d91009e827b828857253d3681d66024d3f1cf623/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/2d2c2c2076312a6c77f39eaeffd1ad17f9b23d4e/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6e7086abbc4b7b5b9e022d656b02e854f6d80a7a/


-- 
http://autobuild.buildroot.net
