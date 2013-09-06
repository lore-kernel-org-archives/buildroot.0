From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-05
Message-ID: <20130906063006.215E552C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-05
===============================

        success : 73 
       failures : 53 
       timeouts : 0  
          TOTAL : 126

Classification of failures by reason
====================================

             util-linux-2.23.2 | 9 
    trace-cmd-trace-cmd-v2.2.1 | 7 
               alsa-lib-1.0.26 | 4 
              e2fsprogs-1.42.8 | 3 
                 libnspr-4.9.6 | 2 
                      udev-182 | 2 
                openssl-1.0.1e | 2 
          host-protobuf-c-0.15 | 2 
                      qt-4.8.5 | 2 
media-ctl-ac40b79f002a2315f... | 1 
                      icu-51.2 | 1 
                 lcdproc-0.5.6 | 1 
                  poco-1.4.6p1 | 1 
                     m4-1.4.16 | 1 
                   mplayer-1.1 | 1 
               w_scan-20130331 | 1 
                 dmalloc-5.4.3 | 1 
               erlang-R15B03-1 | 1 
                   attr-2.4.47 | 1 
                  dhcpcd-5.6.7 | 1 
               qt5webkit-5.0.2 | 1 
                 binutils-2.21 | 1 
                    zlib-1.2.8 | 1 
               binutils-2.21.1 | 1 
               audiofile-0.3.6 | 1 
                 cairo-1.12.10 | 1 
                 libraw-0.13.4 | 1 
                beecrypt-4.2.1 | 1 
                 fdk-aac-0.1.1 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/335f65befd786d1299175baa5d37271cb2911cef/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/28556870ca45be140211996ebbbb8f5ee6133c7a/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/944c7445c92987613450ae649fa297d2ced9f25c/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5f229757d11ab50732ee919418ba852c5760fd6e/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/4320fe3cfc31219005238fbf7f7b118d94bfbf71/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/2e4c28f4d6e7ac6acc936368b617c3ad8b415fdf/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6873d1a6b72aae3215abaaef595982009695eb1f/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e7a5bce7f1de582099b267c0724994485463c99d/
   powerpc |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/bf2875ea53bdaf3e06a60f6c3bfa83e464dbd6d6/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/53976ce37992275b944e76eff2671b08f919cd9d/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/e4d26e855ff78c8fe81290dbca530e58ac1e4d6a/
    x86_64 |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/e154606bc8056b6a5d072a9dfcdab9ea3b326c5a/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/d6a94c074560444ceb0014f4bcc15c62221b5c56/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/0d43c8254710d275c603b9468eab55c64ff38901/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/e98c1879e8226ca0f9541f4fdd2b2e8c9ed3292d/
       arc |                erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/1d69e281e948cb6ac44c22e832389ef63e961713/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/be527f3bfb723be07f3a061df8a4499c86d607bb/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0129254b5398887f6b55db4df8a0134db8cad0ad/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/de9f0f2a9a0841c0e6df4860ad0bd6ea9d9698d5/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/8cae08a86fe4a7f5dbfa3527f78018ca6610c59d/
       arm |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/cd0352d5e1bd51f9960fa8ee49d451180c72aaa6/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/98ef031ac5bae429a8fa1b8346a9fa0264fe0dba/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0bd98ffaaf79bd096bf6da51ed7fc0c48bf394a9/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/78a9662c09abbda74a54426003d6cdb53ef44fb0/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/1d1f804e0828aae894042c075fd141b6f792e12d/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b97e653be41780a290727b055003766d84e4ed4e/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/b20277031713fda04342adf67de0b37ca728047a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/10887a2d5f377c168f1693c65d48fb27df579770/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8087f968d2d0f1c8ec89e343b12e4ebbef63f91c/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/56148179352607f02b02257598a62d77c57cb527/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/010f353f85e1f425a2d88924a87650a65f9559bf/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e5086964d5147551f33b074951b36b5426494c5b/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/f908c4a21de75a459418151c5715fd87b88a0bb5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/394f1a494b9e85fcc01b2a7945e6bda1aab4661d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f0844bc2bd6338143d7c1c333e72d1c53f7d9715/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f2582b5235843cbdc70c3ec4f1cc4331574bf5b0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f3b58a6e44abf4c748b8ec5a3f36671b84270e1b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d35ae33698d61e076c1d0dcf7633897c46bf7a95/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/abf507c2473d51f1cf97ffdb7e4270a93aeb7bc8/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7de500a2e42864eb13b251b464f4872502384b0f/
       arm |                       udev-182 | NOK | http://autobuild.buildroot.net/results/6a3013c42fb8d5a405fafb6872b6889e1e1d1f14/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/c43db4e9c62ee304284af566163a06e2b59b9a8f/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3750eacf5b9957a223a350f3d31589b9fe18ba06/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/da99608f353f74218926b087b1989494ed71e58d/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9d3b7525cb2c23cfca5af42e1f1ba5e5002650a4/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/00d5f8a281b6a237571eaee1cf33cb0c9ccad378/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/349d6ff938b093623618669a1acb390aa2a5fafe/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/57e2c612c46b9e3b5f7bb213fcb3825b23fb7fc7/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/990409d0b50d49e3a79bad70261b08ba475cf46b/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f4709d50418addddbf96e83869a6a1e6fb324927/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/af9ad7896fe3662f025808db441e731404649d3b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/3a3a88c3996ea81d3179ef2aeec3e377efe33317/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/6ca2f32c4ba7a3bd12594b8c83538108bd67a22c/


-- 
http://autobuild.buildroot.net
