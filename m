From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 08:00:40 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-17
Message-ID: <20171218070040.1BDD620503@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-17
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 201 |  36 |   3 | 240 |
   2017.08.x |  18 |   0 |   0 |  18 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           shapelib-legal-info | 12
                     vlc-2.2.8 | 11
                    brltty-5.5 | 5 
                  cc-tool-0.26 | 1 
                   dante-1.4.1 | 1 
          host-acpica-20170531 | 1 
                   host-zip-30 | 1 
               iproute2-4.14.1 | 1 
make[4]: *** [.obj/qquickte... | 1 
                 mplayer-1.3.0 | 1 
                    neard-0.16 | 1 
                      qt-4.8.7 | 1 
       xproto_fontsproto-2.1.3 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/0c4f557c2ad276b1ed065119532af37c0af5f014 |     
     sparc64 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/ea82b7c7732821368746ddddb5d529e97c9b6c16 |     
microblazeel |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1103576dd14aedc464e8a09c574fa5bbdce958fa |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/cb9565250ec99ebe21f82053a9cc31b7cc2d832f |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a83e6fa2daf86a26580d6c569ce27dbca565abd5 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e58aa8ef64fca0d70ec17d59ca2a9564a39b1449 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/88c2643655fbd4c33f3fb678b97c63afa307c299 |     
         arm |           host-acpica-20170531 | NOK | http://autobuild.buildroot.net/results/20bdb5399ae5f14843561efa325fad9a0f59b164 |     
        mips |                    host-zip-30 | TIM | http://autobuild.buildroot.net/results/8bf361af19e70a7bb455843a255bcbcddf2fc962 |     
         arm |                iproute2-4.14.1 | NOK | http://autobuild.buildroot.net/results/46da1142806fb524326994585cec6de9f7f3f480 |     
         arm | make[4]: *** [.obj/qquickte... | TIM | http://autobuild.buildroot.net/results/fa3554f1eaea75dcccd1d434c0fb174ee155005d |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2c4bce4abb247af978f50b1fec6f55ec9ad8272f |     
      xtensa |                     neard-0.16 | NOK | http://autobuild.buildroot.net/results/e74f0254e6ffd4ab8d60453b9d3b8f3046c8045b |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c506197043cb7067a4a567e718d29c12d60af5e1 | ORPH
        i686 |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/3a9bc6ec4b2f1fe15568054cf9400dc6522420c5 |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/851df1077b60a76499240f4cb03e9e33b97b85ce |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/64444ebefc4dab57e3b4ad12e8c26a313c3da84d |     
    mips64el |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/1992daa36f9869ba4413dc3379782e9d379f89dd |     
    mips64el |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/d87205f11ecf06a80d92dd56b9148c9d9c28de31 |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/a4365e82b718ea5bbbe8c5feccdc881dc71441ea |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/eb023fc1edb34739b7b2c93f65f118f99ce3b445 |     
      xtensa |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/8891ad4e2c834b7cb15e0431357effa9bc4c9943 |     
      mipsel |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/eb36bfecab3ede59fa7b5bd7c1298dc87890d225 |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/5647f9e5562c17cd43bd45e64de91a822bb8151e |     
       sparc |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/d242e22b1b96773f2d2662c17036db2ce8979f53 |     
         arc |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/ee01489c95378374fcfdc5f1b0490c4e4bcbfde6 |     
 powerpc64le |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/bef54afc68cd35999dc178940bbcfde7f7ec6614 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/b5fe47e749c1eea53744f8935b53c5a2815b1ddf |     
      mipsel |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/0c64578750cffecf842a05e0570b7b50ada9cbf4 |     
     aarch64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/8dee16a6297886a5c874a4172e7441fc614b1785 |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/1b6d8f638a932ac10eecc0608d298d05df1534d6 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/15d9ce3d90e97e1c64f6769dfc1f8df8739209c1 |     
        or1k |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/c477353599e4061093457daecb682879aa28eaaf |     
      x86_64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/d89b724582f02e63981eac15d0eb5b9a906c1437 |     
   powerpc64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/f2e7437fe596c14485959e50dacdc42b07ed5ba8 |     
         sh4 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/f66f10224dae1fb946b025dcf7accb3252ac23d1 |     
       sparc |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/9ae041c66445f3776df247f742923b159fcacc06 |     
      mipsel |        xproto_fontsproto-2.1.3 | TIM | http://autobuild.buildroot.net/results/9f81a80156eb1037ce1b2a5895d52f4db872363d |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/490a83057d9d43eeb6da75fb4d32423dc8009090 |     


-- 
http://autobuild.buildroot.net
