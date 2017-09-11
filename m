From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Sep 2017 08:30:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-10
Message-ID: <20170911063043.38501209D9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-10
================================

      successes : 152
       failures : 40 
       timeouts : 0  
          TOTAL : 192

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 20
         s6-linux-init-0.3.1.0 | 8 
                   luvi-v2.7.6 | 3 
                  stella-5.0.2 | 2 
                       unknown | 2 
       gst1-plugins-bad-1.12.2 | 1 
                libmbim-1.14.2 | 1 
             lttng-tools-2.9.5 | 1 
                     mdadm-4.0 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

       nios2 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/761c684ef0cfa5e392aec04f7065d54d2c1860f9 |     
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/0b623916124638dec03cc2d6d7dd8eeddcdc325d |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/e09848ba091b6bdf105d9a2725a16c5748832c31 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/7a1a4c29c3c4aeda5d0c76b996287e0357efc512 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ed5634961866993e25628b221326ebde74fd2061 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e3b4916d91e49e6bb8c405ffe932cbedc284d41e |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/33dc1a27d780fc06e165ce731dfd8faade818f55 | ORPH
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/62ff44c7f9166228cb4fda5d1a45cfacabe14417 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/53a3f54cbdb7b427b2e36d709a0faaae0115ee2c |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/96f707ccb5aacf545b0cbb30dac2e418da7cbd13 |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c5048f0def366b3bcbfe08b77469933a30be0953 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fd619dd60a7505a54e37766a958afae9ad05823 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/31b21be017da873caf9f761f307d612389dff30b |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8561fc22d023bc109c3c3960bbb3578084bc3a7e |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/70c0172944dc7a8203bb726e0ac2be606be287b0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e2e47c2b5f490272a39e708faecbd98d0a2ac39c |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bd2a965c25ac921228501ca1564e09389c22949f |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/29621409f2ad7205e31dc1ddad948df2f67552f4 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c3636d3553f4a28301c774f2b594f8f8f76d25da |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f8037259dd8eb96752910f5f4e14e9dd3a88dcb9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e6b95ff2fb23a30277696ca519f1a8a4d3cd7db0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9f97870afb4f20ad67b540a71ea5e332c802a57a |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/07746d60a93c1a77079d292bdc25ee514601da77 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/24382b4b4951dafc3cb2a9760bdbedf517ac1945 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b418287d3ac12537d9182d36a0c641ac27e25108 |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/80ebe961669c9b1b1da234d020e77ecdda2718ca |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5051fe07a137e6fdb5f6cbd4d11b21f5a1665a4c |     
    mips64el |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/7208b2630832c3293db39affd7886691691770b4 |     
      xtensa |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/c10548ffde2d83b6298759793ef99a5142309678 |     
         arm |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/a0da44d547670bc46479980ac1b29e7e2421b378 |     
         arm |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/df7ec3facb183b7caf1a6eaff4f89a65961681fb |     
   powerpc64 |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/fe7a32fbec5d64c359ad0326a01764a631dcc6f6 |     
    mips64el |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/79029d736910ca32567bc8a82ac6982c3ac1e1fb |     
         arm |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/20091ae932385bd7ba4205626bce174e385da221 |     
     powerpc |          s6-linux-init-0.3.1.0 | NOK | http://autobuild.buildroot.net/results/c1cd69444abb32e77928e7d7363f5cdfea79dcf5 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/b70bd0c696de752499b4be3bd4e3d6aa0712544f |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/58614b04a42dcb79e7b98f683ee4cfa4e52b7903 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/46ce4a21d00ce23e61d1c768997bebe84bdfd184 |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/a5fbcd2a887e14bb8bf429d1ca312c303b193d97 |     
     aarch64 |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/553e9b117f7cae5812571dbe125fe9ae874cb23b |     

-- 
http://autobuild.buildroot.net
