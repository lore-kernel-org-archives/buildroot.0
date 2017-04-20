From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 08:28:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-19
Message-ID: <20170420062818.5A2AD207FA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-19
================================

      successes : 212
       failures : 52 
       timeouts : 0  
          TOTAL : 264

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 12
           uboot-tools-2017.03 | 8 
                busybox-1.26.2 | 5 
                    mpir-3.0.0 | 4 
                 binutils-2.27 | 3 
                 mplayer-1.3.0 | 3 
                  ntp-4.2.8p10 | 2 
             rabbitmq-c-v0.8.0 | 2 
               syslog-ng-3.9.1 | 2 
                   atftp-0.7.1 | 1 
             bluez5_utils-5.44 | 1 
expedite-0529ce56b6fb01e965... | 1 
              libarchive-3.2.1 | 1 
                libepoxy-1.4.1 | 1 
                libmpeg2-0.5.1 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.4 | 1 
                  nodejs-7.9.0 | 1 
                     php-7.1.4 | 1 
             qt5location-5.6.2 | 1 


Detail of failures
===================

         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/2df20601d4f3495a68c68d86278a86532fd28d3b |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/6f44210740725c13731de3895a5089d758dd2e3a | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/47b2a0700a549543dc3fe5cff6ea2ebee37134be | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/1bb48e8d02ba89da16390e69a4755d87030ca21d | ORPH
   powerpc64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/100230dc2e8679e2ece2dc049ec3e177dd41183f |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/47e581fd0779c7c9200976b7ca88290a6c785b6b | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/f14ecf6e4f916c3e8bd02519e7eabe8b52ba8c09 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/afd82439fe5a7a19f3b0de97116439303b1a10a7 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/397a3c2d3ccde15cc5fcf718ba18afe5b6aec239 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e703aabbccdc6276b957a59abfa8f1e64d1d069b | ORPH
         arm | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/44c4656a0477d0ebac425c9cdae7382181f9d336 |     
         arc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e2d34bdc0c0ab707ae4f4a8d0d75f0cc4b1dfb28 | ORPH
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/9d77dc46d236e2132e12f6a46065af0bdfbca303 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8572bbe833bbae580a65a2eacf37c5714d28888e | ORPH
        i686 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/844cf775b8cdf489fb739a6027d1fae7ac7614aa |     
        i686 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/273d8d584f50cbd4e3838a52891bc404611002e2 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/0fd086a02d9984795165abd28e0904cd8d59fffc |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/e00c94d5cebf07580263c116dca51540404b8ad6 |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/3f35e8e03165023a9c6b228ca7a7ad2b3ab37fba |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/2d8141e434d13ba41849ebf69a23957ad15dd047 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6cb7cff88841da42b2e5db3fb51dac280afcb24a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3dcdd9f7a0f7f35648ae64b895bfb1d13d1f2c25 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/abec7a0c7ea2d80fa4a3440d22a419df1d7aae4e |     
     aarch64 |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/2fc7e5e64ad6ced02a47e5062176d316eed0f43b |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/ba320cfd5185bd227055607f59cb1408e147d6b5 | ORPH
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/247ea50489dde194017598c8eb2b94bdb990a41c | ORPH
        i686 |                      php-7.1.4 | NOK | http://autobuild.buildroot.net/results/940e263ecdfdd666c845fde2409c0f30e0f44a05 | ORPH
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/77c3cd5b5d7b7d59b44bdc0625df7a2980d557c1 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2d7f805ce89c085732a592116066a4cb4287497d |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5467f22ec33d9404449669f1e90508fcd7c96a2f |     
     powerpc |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/84331e9a168d8bdf2cceca8e9e1480611c1ecaed |     
         arm |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/b5bad64abbf5764faf2a7129a1a25ad75c34980b |     
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/66dc9dad25a568f0053ed0d76de86970b7012133 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/aef8626f3dcc09ebdf9022df026bd90f8799e473 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/b4cab399b50b4a9f3b6b3eec455b96deeb80d46a | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6cd36e0f6e8902d9505f434b6910e4500dda555e | ORPH
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ecf72b81dabe25b2340ac670346bb5d24f1cc7f9 | ORPH
   powerpc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/7ee7f01389c2ba85229409975d7b9237b7c7443b | ORPH
         sh4 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/93e114bdf140befef5957bde244ab13d2ede1b4d | ORPH
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a741f8a46295ed4d70b76615c85bd86e07612aa9 | ORPH
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/748814259f025d3f4debd346dadcdf5e3afb457a |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/820864094b7687b11e451d5b99202f481185996d |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/d19c804407c4a0cdd9567bbb578de19743606eb2 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/3752cb58d2ea9b213d1bed568a98c343c426c80e |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/7cf714a32549e71fb8b399e50656f0ea60567100 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/fc3fd9849f89fc75404886a7bfb4fc7a1655464d |     
        bfin |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/dc54e046405e38c91a20903f91748aa772b04581 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/420e677df0c29107b22ac8813651683f7ad2a656 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/b9bfb184023a7543c798f6a02874cb1cb8b8a344 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/d117d1d9ad06885383938e7f73c954d131e66e97 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/686932759f2ed57490c22a44f2fdafef535662e4 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/6d0a2eb81366fe56aeb8fa8b1cb3f8f76bd1d8ae |     

-- 
http://autobuild.buildroot.net
