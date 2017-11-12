From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Nov 2017 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-11
Message-ID: <20171112070009.5A3232085A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   4 |   0 |   0 |   4 |
      master |  93 |  21 |   0 | 114 |
        next |  18 |   6 |   0 |  24 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-vboot-utils-bbdd62f9b0... | 7 
                  ffmpeg-3.3.5 | 3 
                openjpeg-2.3.0 | 2 
           python-numpy-1.13.3 | 2 
                      qt-4.8.7 | 2 
               asterisk-14.5.0 | 1 
             freerdp-2.0.0-rc0 | 1 
                   mp4v2-2.0.0 | 1 
                openobex-1.7.2 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

         arc |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/2e687d177d5e4fc371d3339194b5bd9a6b8dd566 | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/a87a6065d1ef27fe13511b67a4b0584e780ae01a |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/341bb994222dbe2b6fa56d36dde0c56dc23cafcd |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/489f56a39ddf20745cf19acd0fb5d0967beff37b |     
         arc |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/566898acd36c96950bc47d16df5871f9ab705381 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b05714971becd8a546b7bc2f8ab810a9529e47e0 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aeacbd9fe66c4d55c9cbd72cf96442d72d0f4102 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a23bf69e552c007ec0e2b2f17738d49b05433ac0 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e6479e2cddd2db0cf1ea1cbd60518143599e17a9 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/01ef701d78bc1fc0a4f000bf4b1e4441ee2309b3 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5530d56f29f8b1e8103c95558b663ae0b76681af |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9244ea2bba222784b522b5fae86c49905cb801ee |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/6d58187fa0e6cf99b27abb65ff2291c0f1a71e16 |     
         arm |                 openjpeg-2.3.0 | NOK | http://autobuild.buildroot.net/results/3494a2fa2745df7c74e0fbdc3105fb415da49b72 |     
         arm |                 openjpeg-2.3.0 | NOK | http://autobuild.buildroot.net/results/f16a558c30199a92e93a31e0ba391b99a9bd689f |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/d837769e98d313c0dea464ef716369c0b1369fe5 |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/c22940da328fefa2c7b351d258ca98013cfa5bc0 |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/cdb8ef71ac1661a467fa0de1cfd96e40aa52cbb7 |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/4099e354fa979b37b1c744081e987dedd47bfc44 |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8202d772643a7d1f0edf695b57899a254b769f01 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/950c133f886587f32aa7d232fc9d20e972937ef6 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.3.5 | 1 
                   jimtcl-0.75 | 1 
                libplist-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
pdbg-77158819158d1d7053a737... | 1 
               wireshark-2.2.7 | 1 


Detail of failures
------------------

         arm |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/102fcb625e0a8be7e9239b7ca69365f54f4d8239 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/e7042cb939cfcf8d24851b6f7c1db4dc484a3d0e |     
         arm |                 libplist-2.0.0 | NOK | http://autobuild.buildroot.net/results/863bb43db222f8e63d60b1fc4a53299575727de1 |     
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c3d0b2af141e37b25ca59b3ad66812deee2e2b07 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/0ff199a8dc0c70f0fe6966327b165153587cde70 |     
      x86_64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/6326b6fdebc5ed56b60f45c231edce07b3ac801e | ORPH


-- 
http://autobuild.buildroot.net
