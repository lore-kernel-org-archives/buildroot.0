From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-29
Message-ID: <20160430063022.B7658101788@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-29
===============================

        success : 135
       failures : 66 
       timeouts : 1  
          TOTAL : 202

Classification of failures by reason
====================================

                    mpv-0.17.0 | 10
                flannel-v0.5.5 | 4 
                  ffmpeg-2.8.6 | 3 
                 jack2-v1.9.10 | 3 
                 host-go-1.5.3 | 3 
                wayland-1.10.0 | 3 
                moarvm-2016.04 | 3 
       openpgm-release-5-2-122 | 2 
               valgrind-3.11.0 | 2 
                     vlc-2.2.2 | 2 
                    ruby-2.3.1 | 2 
        host-gcc-initial-4.9.3 | 1 
                   nginx-1.8.1 | 1 
                     fbset-2.1 | 1 
         qt5imageformats-5.6.0 | 1 
                 lvm2-2.02.151 | 1 
            webkitgtk24-2.4.10 | 1 
            qt5serialbus-5.6.0 | 1 
                    cups-2.1.2 | 1 
                poppler-0.32.0 | 1 
               host-wine-1.8.2 | 1 
                   erlang-18.3 | 1 
                   tinc-1.0.24 | 1 
                  stunnel-5.31 | 1 
                 libgee-0.18.0 | 1 
                pinentry-0.9.4 | 1 
                    ustr-1.0.4 | 1 
               opencv-2.4.12.3 | 1 
                 opencv3-3.1.0 | 1 
                grantlee-0.5.1 | 1 
                   ulogd-2.0.5 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                sg3_utils-1.42 | 1 
                    putty-0.67 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
iputils-3a86a2542c6fe29413c... | 1 
flann-04b4a56533faf8c8228d0... | 1 
        lttng-babeltrace-1.2.4 | 1 
               iptraf-ng-1.1.4 | 1 
                  mono-4.2.3.4 | 1 

Detail of failures
===================

         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/f9b067e79c53279da9f11d845877715f5141e940/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/5b0c25627ed2b3756d0ae8a4da24d40a6bb5d0d8/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/4bfe8808ae057e2f689c425fc9dfcd795d9cba58/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/ca9f9d02bfdeeb4ff3238e84aadee632820e718c/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b878ba9689819316d094abba7cdda24ea835976a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2e60966c436c9e4eb8154e3823d342a735aebef3/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/86525c28712c17344c6d0e3bba159004dbc3c9d1/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/397999d1d8dab254608fbfa7b65b25f967f04f02/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/904234cbd8cb380fb13c6888813639f364926e86/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f4e9665823a9bbf80897ddfd93b162949c9c7fbb/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0df48c6bb2cd786495f7e63a58102dedd2832f45/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6184d7a6afd4cafe34749c1da2156fe1f94738fb/
     powerpc | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/f15586291bc17e22303244284b1e9d70605af049/
         arc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/0fd9d55d9ba18e44b17e24ed7e657831b75610ae/
     powerpc |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/1aa7a420f7c2a62530f86d99e2346de20cc0bdc7/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/b0248a7242e60e00567a941549406b9ef8fbab1d/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/5002fc2a4eb3906ba5da934b490d07e6c42b46b7/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/5b541f010d688b87bcba5df6acbb26a426ee63c3/
        i686 |                host-wine-1.8.2 | NOK | http://autobuild.buildroot.net/results/eba92ad9c2cb73f0fff7a4dcd69c5ee4143a744f/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/15b0bd7bbd0d0c84c3f5aaeb69ba146550605707/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/05929cd80f8de33e29bfd2216bbd5d8bbc4fa771/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/956c6b11dab67a724c521a0c60fe18192154d34d/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/6d29e8f61f3b8419b3f106b5f74e76577c82ff55/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2bb3bba1f80630a1252931fc70d02e8f2760bd46/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/935ac42c30ed893939c06c077534f060aed80e9a/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/5eeb64f35d2380ffa15208faf7062004e6361f25/
      x86_64 |                  lvm2-2.02.151 | NOK | http://autobuild.buildroot.net/results/a50b3795cd1ce6f70352ca2bf438be74ba31a71d/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/d4246b837df3da54572e52ee37eed26d21ef9616/
      x86_64 |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/212469db5dc8399070390603c0fdf7f12b130cda/
      x86_64 |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/28c7d97b0f073208f5bb709ff56c97d36c2be3f9/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/c77c20c74287971bf1d7ab0e5affc9468a9128f2/
         arm |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/d49be3fd276e13f3c67475f92809f0f918365abb/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/38d97421aa363dc3439685cbc935957b7e155705/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a562149f5b525793d5fd9771564d907752d6fed9/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/100b02e2a78832fc5c2a530bb2b4bb0371f5ff8f/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c555b3998549d4a0dcdfbc35895a5092d9f698c9/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/2f20cc7366b7fe3cdc6ba846814e3a554e72804f/
        sh4a |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/32fbd3b554898a03b19cd3e647f806a8e1d1878d/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/eba0bdfb9e223fe4cec2207a36208b556eddbf35/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/da2ee8cd00011e07b722155c899597d54805ceca/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/f53f3faac6564e537c38c0dc7afcc256fb81b76f/
        sh4a |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7b7db479ee9e292ea56b6e5095ad358ffa7b6ebe/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/73b71da56a14eff40cab1e5e2454c55821b4516e/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/e167fc14fa29e2a2070d3fe3638f75e4eede51a3/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/0fa0c20bc2efd22d16a85b159b7428863bb1ce7e/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/5c13afec35febd4037fc57e4b04e0da135486c93/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2cc4ae06d7c821f1a4f33b82591e89ddd5c6f8e7/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/fb29ecd6b1eaea79c628750eab4cdc84f42393c8/
      xtensa |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/bfb1778e19b6c5519b42a8d43fed3f742aa23dbb/
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/b7cd550af983165d7d930bcc68fcab5bad00159d/
     aarch64 |          qt5imageformats-5.6.0 | NOK | http://autobuild.buildroot.net/results/688233a3993ac0b8eeef4d2238c1b384eb84479a/
        sh4a |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/db610aab4e101ad2c1a5ec4531689daac8567763/
     powerpc |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/fe7bdba5faf199275aedea2918705b5d19d228bf/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/96bfe63e10bea519b1184883e801c4ee4722d5f0/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/aed904ed19838993da9027f90912142a015e36f4/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/ef381240e2deca4a48e4b37794adcbbc46048ab5/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/455d43c6a5aaa50eea687d12744cb85874007357/
         arm |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/3176071cfbab93083ab4404c924f2de86c88734c/
        sh4a |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/701bd6d99a0d334a2f627db933c4874a5d7d115d/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4b170bf9f4c578e4ad371f591133bf5a0de5cce2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5c295e59f2d0b685b616fb7a8d6113e0a801e9c3/
      x86_64 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/9f878e4f73335d6b7cd493295e2e91e0f5053f37/
         arm |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/d764852735442733cacdeca15b212357d6f33c64/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/13eb1cb036917e11de73fc05f5fef1d317bd6c12/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/1f8f4a8323df9c90aa4a238ecc8d130171ae297f/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/d54e495951ac036196af28a5987c6c96f79782d9/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/c47c619bb48249c1d6eb81a837f3ea5c5176eb80/


-- 
http://autobuild.buildroot.net
