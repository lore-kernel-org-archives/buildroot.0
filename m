From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Jul 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-04
Message-ID: <20150705063018.2EE5F100A86@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-04
===============================

        success : 112
       failures : 61 
       timeouts : 2  
          TOTAL : 175

Classification of failures by reason
====================================

make: *** [core-dependencie... | 36
                    wine-1.6.2 | 2 
            gst-ffmpeg-0.10.13 | 2 
                      atf-0.21 | 2 
               upmpdcli-0.11.0 | 2 
                iproute2-4.1.0 | 2 
                collectd-5.5.0 | 2 
               openswan-2.6.43 | 1 
                  opencv-3.0.0 | 1 
              lbreakout2-2.6.4 | 1 
             ctorrent-dnh3.3.2 | 1 
           aircrack-ng-1.2-rc1 | 1 
                busybox-1.23.2 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                  zeromq-4.0.5 | 1 
                   tor-0.2.6.9 | 1 
  toolchain-external-undefined | 1 
                rtorrent-0.9.3 | 1 
           host-heimdal-1.6rc2 | 1 
                  boost-1.58.0 | 1 
libsigrok-fe473123ba836445d... | 1 
           host-nodejs-0.10.39 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/12e26cf0eb821bbb50585591324c4b5fa8ee38e9/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/bab55b5bcfa7a6871535d07af62971f783666865/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/0e687ccd4d64da768e1c3e09122794193fb539fb/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/8aee1cf8ef07d586b4bef3464bb3c02bde6ce419/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1a380aaca9303b67cc59165d56cf12f35966fe26/
microblazeel |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/eec7fe2a86cdf1d01a886709564be2233673f994/
        i686 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/4ac716a46de1f0484e5d7885e841e7a559135edf/
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/070bca7574e791adf0d3cd40affc672d5c4320af/
         arc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/d2bbdd2b76c9d38a177f42cb3c45e03028c3c85c/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/3a9e3bffb56abfec6981a61bebaa194510d4a506/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/60f3551bef54d6ad8a5f873c8969fae37ed4ab38/
    mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/04addb3080f8019b119325df41c3f651147c0d7a/
         arm |            host-nodejs-0.10.39 | NOK | http://autobuild.buildroot.net/results/e6150af3e4d02e86cefea4352229d6b3f7c02456/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/c9284e979ff5d113ff0145e0c81aaa779744d6db/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/237f4caa2601f0493951bd0eb82d5680ff1c52ef/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/40f972a9bcae4662791ca13a95353a302081b4da/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/81be0e5af8ffd5b0223c93815c6111684d026226/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a2c04346db167ce99893f9e23fcfd762c9d7f2f1/
        i686 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a0ddee05fbde9e39acfac5765b13ee8284a8be89/
    mips64el | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/319a2c267e0ec325a74fce1aefdbe4fb853ea2d2/
        bfin | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/c9bf409b3b18fdb2f202c607e838511ecab5cefb/
       nios2 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/b69c61bdfe645a13a7769b8aa027d111a74abcd7/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ff7ae55f2008843ef0551b21eb130cc1003de9f3/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/14901c429d6d4999bf881ae02b3264b99c07fe15/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/8603c3bf7b349323380560e864ea63e656c5e295/
      xtensa | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ce65aeca7436238010ac423578e5cb04e6d0d496/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/9353e71746d3a4a70c76f1ffbc73c516e673b226/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/46959ead775cafe59cbd43f026fda5f15e9a117f/
      x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d25a9782730b9631f05ad91aea3e0cabd7ae2dd4/
        i686 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/0e8fecc8eb9663d7e2e81429d4f2cc6ccb55061b/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a3faf2e6278e2fe3f65dbbafd683eef3f3b4e1f0/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/f8b235b97e9d85de1fa07ab850ef5c21b31ebbe5/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/41fdb7180df87d467261d5328039b58ed2b934e7/
    mips64el | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/4536d7a6cd92dccdd3a147b30915b8e58ff669e7/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/cfac433fd05336a7a1f8924ff67175313af22084/
      mipsel | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/54a1cd7e4ac8b9b1537488fb4f22546ece99b1c7/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/88f66d67c369a742d66157f9d011689bbedeb248/
microblazeel | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/63fe47c488edaf33e5896a812e07b93c35199f5a/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/5caa8429368cdbab1e4fa3c4069972474f6f69e5/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/4eeb8587b92383c444e32feae10908dbfad59757/
        bfin | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a7ea7a5e684a28d7030428bdb0e3f1fcbaea5680/
      x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/81d016764675405bb6fc4adaab0abf293ef7608f/
     aarch64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/36004d717b71f641cd8c52595270b8e3243be4de/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/b3384c8816a22564a5604a95d92c9c504daf6019/
     aarch64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/2c0a0b0406ccb0e87bd5e8608bfe7af8d8a96421/
        bfin | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/e0659cbca021cd0966ce864b301a882531b84831/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/2577fbcd1b3ab260dcf4bc9174e4a1f610c3e59a/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d38adf127d8e718182d6150d30762f856e9e8ae1/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/597c69d15b27abd2b20543598679fbcc6e1478f4/
        i686 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/235b78d55130c3bac656009ab669079972e55d96/
      x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/af44f47406e318c24252a4d70e6c852e3cb9adb3/
    mips64el | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/bf8ae5ac68819e9fe0d6197708aaff8e47b1c9bc/
     aarch64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d6504cf82a593aad0edc698b1cfc3c339dce5976/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/0d61474197fcb14dbd10f0d60e891406114738f5/
     aarch64 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/91a150a4f0b16cfa24ff9c5e5e1a732071173e05/
         sh4 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/8c91ff9f25f164d087b4d9aaad8c8a04006f76a8/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/23dc024a369c90afe72f562e763486ebf5d23d05/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/f09af8dd0d85bc6137a0c2f26cbe62686767b957/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/18d5c7892e226b633160410056b4a8364379a3be/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/8754c4e35b488e0369fbe0088100d6161e90c57c/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/8bdc1eed55075313403aa8a6c9af6a427bce198e/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/2ca57e218ea2b8ccd57c099c1014434a25ca5a3b/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/466c8796286891fbbad0c8788806bf24d729ba94/


-- 
http://autobuild.buildroot.net
