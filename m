From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-24
Message-ID: <20150825063012.C9C1510159F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-24
===============================

        success : 264
       failures : 40 
       timeouts : 0  
          TOTAL : 304

Classification of failures by reason
====================================

    xserver_xorg-server-1.17.2 | 6 
           libfreeimage-3.17.0 | 2 
                 mesa3d-10.6.3 | 2 
                busybox-1.23.2 | 2 
                  midori-0.5.9 | 2 
                  gamin-0.1.10 | 2 
         erlang-p1-tls-b070004 | 2 
                  mono-4.0.2.5 | 2 
                  guile-2.0.11 | 1 
         qt5connectivity-5.5.0 | 1 
                    ustr-1.0.4 | 1 
ltrace-c22d359433b333937ee3... | 1 
             bluez_utils-4.101 | 1 
                   redis-3.0.3 | 1 
                      qt-4.8.7 | 1 
               libplayer-2.0.1 | 1 
                   zyre-v1.0.0 | 1 
             lttng-tools-2.6.0 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                 cdrkit-1.1.11 | 1 
                   hostapd-2.4 | 1 
                   erlang-17.5 | 1 
tvheadend-d9cf931f9f7242f07... | 1 
              gst1-libav-1.4.5 | 1 
                elfutils-0.161 | 1 
libubox-e88d816d6e462180f03... | 1 
               linux-pam-1.1.8 | 1 
                libnspr-4.10.8 | 1 

Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0c885c5cbe217978894f12337404cb9d45a9d3ed/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e87b12645e0e9962d0809c6001a1bca2a3a40841/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1f721673c5f0acecfb41e31cc879ff2270b1219b/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/984b40e10c29076b208aed8c8004fd15b52831eb/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/04313981a3bbe3ceeeb770359498c1be81afc970/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a773dabc74807bab06188ae01a78d35520c640fb/
     powerpc |          erlang-p1-tls-b070004 | NOK | http://autobuild.buildroot.net/results/2fb30a43fea25bcda026b59fe7ef4a311e42833e/
         arm |          erlang-p1-tls-b070004 | NOK | http://autobuild.buildroot.net/results/f77dc845b1dec1a38bbb4fdc8be7a05e1ef498e3/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/a315efd1faa77b7683be362c266a29779b9d5050/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/4028add7001835e4d46c2e9cb791a8d7df79c2bd/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/c1b630982b0377f6982dc12120fb598dca3afdb9/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/cb922f95a6c916f4abb36c12aeee22bd6493bb32/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/71575937e5af7fcd93e6cdbe480bf629dbb8eb59/
      x86_64 |                    hostapd-2.4 | NOK | http://autobuild.buildroot.net/results/4d140a1fe535311661a0bdec31868f71f1d0dc51/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a67369acd3b16f53a0fdd5a05f06b1765b897a91/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ce9c9ac0e51a81de018e3e11e670f6fc97308b44/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/2cf21b13763988be1073cd7ae0a47f1df03e69d3/
         arm |                libplayer-2.0.1 | NOK | http://autobuild.buildroot.net/results/3f432d42cc02005d6af8cab3d9dd11b3ac6d296c/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/fd6edcad7caf38f1b2270512b6027d72f1949c1e/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/702bfa22d6f6fced0cceb2dc71afc080f4625b2e/
        mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/e1a99784d7cbd5a14808f6d8fc27994b44e996c4/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d989aaa248ba2e434a9188d4232e6dfbd6e96cfb/
      x86_64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/c898d9de1a026e2be598cb5d3eb08dcc68ea097f/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/1c5a7177472895bc1a8b39a35dfc063e619c074a/
    mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
    mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/0065e92df1ea6bef44942503b9ba8c0f84e10213/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/12360d2f110d4db0d27806e02d9acadef478ff49/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c2d23726f8efcd3da97356b51a35a427919206ef/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/15d58f787dd846773aad18924f5012ffc310e8da/
       sparc |                    redis-3.0.3 | NOK | http://autobuild.buildroot.net/results/a222223733a518ce69fe6db87851133243dfe448/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/038888bb28a59229737a6d1214e40970a846b54c/
    mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/10bd119bae1ee158a10ce542e9e991719e240b45/
      x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/29caf899bb6d0a591a533af024b4262d0ef4ce96/
        mips |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/d0a37acf8a9377cd9c5a99aaaa867ae72276b4a8/
      x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/6386886945292e86c6b8c08311c1125d9760e258/
         sh4 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/22009a4acceab9b99e811784ca59b2fc17de0fcb/
    mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/66d962ed0fa6adf5ebbf24965df5afec16791a99/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/b07f5ab8657d6c6515e90f3d41ee23cab14c3f44/


-- 
http://autobuild.buildroot.net
