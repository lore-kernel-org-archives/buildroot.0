From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Sep 2017 08:31:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-20
Message-ID: <20170921063105.30063208EB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-20
================================

      successes : 104
       failures : 56 
       timeouts : 1  
          TOTAL : 161

Classification of failures by reason
====================================

host-softether-1e17c9bcfd7e... | 16
                openjpeg-2.2.0 | 10
tvheadend-303f418e1ac2bb307... | 7 
                 mesa3d-17.2.1 | 6 
               librsync-v2.0.0 | 4 
             lttng-tools-2.9.5 | 3 
                 mplayer-1.3.0 | 3 
                libmbim-1.14.2 | 2 
                    cups-2.2.4 | 1 
                flashrom-0.9.9 | 1 
                     mdadm-4.0 | 1 
             python-lxml-3.7.2 | 1 
           python-numpy-1.13.1 | 1 
rpi-userland-29835184aa70c1... | 1 


Detail of failures
===================

         arc |                     cups-2.2.4 | NOK | http://autobuild.buildroot.net/results/e5d892f50c4cd48e94371af6a75e3592d1cfdc3d | ORPH
        i686 |                 flashrom-0.9.9 | NOK | http://autobuild.buildroot.net/results/7dc4298e3a07c73e03f70205516d68a0f4c2d297 |     
         arm | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/08bfbdfd9d8fff8b1fe6a27d92a19b09c1973e6f |     
   powerpc64 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/9f3d25132b09c0c0b30a3cbaf05bb00e8a4d4f77 |     
        i686 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/1b22cc8ab7e35dc91cbc957ce9ae998cbcdf56fa |     
      x86_64 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/f096da310583d65da4dbafc0237531702f90c6c7 |     
    mips64el | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/f4c3719e56f3fc8adbf2fb2e0b14810c90300a5e |     
         arm | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/2237b9ec78044678aac9e743318ce5dc01309ab7 |     
        m68k | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/881b8fb3d2d3a9ad08e9b3b6c1795397b82bd7a5 |     
      x86_64 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/1c33b6f79c94ccfd103692a3c165e393a390b2b8 |     
      x86_64 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/c6e6e9d906406f5e04ca8ca46572d0521fe86f4c |     
      mipsel | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/50e166767ca9768774a6d0c19ca09c7a4abc21c1 |     
       nios2 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/bd9ac611d526130e5686ac4479c44d49dc82018d |     
    mips64el | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/34777f0c6f2b750251afed5016be789e6e123d47 |     
      xtensa | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/ac676076a392209eeafd00aa6e3997c316ce6348 |     
      mipsel | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/19bb8d1fe0f692310d1c7634253cda76a5b605c9 |     
    mips64el | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/79bd2838d7b193df1510bbd2b1965018559bb82f |     
       nios2 | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/d8f5fcef17b4665be3147d38f8b0a006cf4a58a2 |     
      x86_64 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/df21779b940efdca9c0809b7623d62cccd80af55 |     
      x86_64 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/d22f7b10a35056220fc634c41af74af433615e8a |     
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/98948bc179b8c663ae7dda255d2e986d39ba7c0f | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/e4d85ca81b50f88c62efd37e6f65a6e00156826f | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/87f7bbeab3115fd7e54a72c4a9583ddd3fb430ec | ORPH
     powerpc |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/d82c410aac97d0db8da373add4b642d7ba09340e | ORPH
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/60c7900c7be337dd44c1f332a6a5f6be9a8638a5 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/06cd4fb78a2b83f8044bdda4a733e29377b83f2c |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/22228442c4270a90af595d854936d1b66771d0bd |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/46e17a3f57b638fd8e096a6e2b069a0b5395c8e0 | ORPH
      x86_64 |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/93a7801abb22ec05070d22782814d30ccfd4dcac |     
    mips64el |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/2703a6fff3ca4455459d2791c899a6889efe3e33 |     
         arm |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/4b133ff2de22a507213b2def41947f43a73992f8 |     
   powerpc64 |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/9f7f4a22ddbb0860271c3144950e1ba4e69fb922 |     
      x86_64 |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/e502b2508f1f102cdc3b8a58ecc8de0af9159c9b |     
         arm |                  mesa3d-17.2.1 | NOK | http://autobuild.buildroot.net/results/bf398d15af11fdf385469f2a4a09ee389626444a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7db8277d4ebd7a8969c82a02124275623a00ed68 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/23059f4d74739202dd514a0c2c12d9e576ea9558 |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/dba606db69d8019b3bca14b825afd57073181cb6 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/50992aa86fad38a2fd058f654774e10c7fc3d06b |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bb1759732d2cdd714810851debfa618f97c9d98f |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2e807594b40072f4419b21c9b2fca2ae99f66624 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a4b38544a51b223ef0be7637dc83b037ff510c3b |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/be721ab34c540288327a5731dc9cac549daa4ce3 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c93de4d4cd55d7604df154b9de69acbf061745e4 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ce66a935644cb553b38c572fcd4ec80cb11c14c3 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fac3837a16fc998819a4014ded8a07af931cb3c |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9d75702850033f6816b6b62d932aa7147ffa63bd |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6e546a9181a28eec0c4c80da44a13d8b99b3a5fc |     
microblazeel |              python-lxml-3.7.2 | TIM | http://autobuild.buildroot.net/results/7a1a5c5f0815898718ddcc8dbc1e434103c6d907 |     
         arm |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/70e944fd3fc57ecb6355ee38fdd0eab94aa653d2 |     
         arm | rpi-userland-29835184aa70c1... | NOK | http://autobuild.buildroot.net/results/e95b6df24471d91c9c2bf89d812f6179c661bc7f |     
       nios2 | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/e103d72770a8adafcfd73239096fafd040206ba0 |     
     aarch64 | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/e98dc25419ceaaaa4f63a1c256eced9e5706217b |     
        mips | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/c02ec626f89282c8e8d8ca94ccb4628f85756365 |     
       nios2 | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/3cd2360a8464c4cefd524251a44ea32a76c85b79 |     
     sparc64 | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/59ad7940dcd498cd0aaec26c8497b21e64379a6f |     
         arm | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/ad1673f23a36e7b547866c6fb3fac0e342d20751 |     
        mips | tvheadend-303f418e1ac2bb307... | NOK | http://autobuild.buildroot.net/results/0a7dfe3745417a16eaef27eb43b3133495a7d99a |     

-- 
http://autobuild.buildroot.net
