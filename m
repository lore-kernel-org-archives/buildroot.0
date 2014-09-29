From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-28
Message-ID: <20140929063011.74ACD100B3C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-28
===============================

        success : 172
       failures : 24 
       timeouts : 3  
          TOTAL : 199

Classification of failures by reason
====================================

               valgrind-3.10.0 | 4 
                 gnupg2-2.0.26 | 3 
freerdp-440916eae2e07463912... | 2 
        gst1-plugins-bad-1.4.1 | 2 
                  libplist-1.6 | 1 
                upmpdcli-0.8.0 | 1 
                  thrift-0.9.1 | 1 
                directfb-1.6.3 | 1 
                 pixman-0.32.6 | 1 
make: *** [target-finalize]... | 1 
                nodejs-0.10.32 | 1 
                     radvd-2.7 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
           libmemcached-1.0.18 | 1 
            host-mtools-4.0.18 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                 cdrkit-1.1.11 | 1 
                      qt-4.8.6 | 1 
               alsa-lib-1.0.28 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/592ce34029b3b63a8e2ebbe3d8417196de07cf38/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/e496cc4315c06de61379222d3e842d4cd05b2f71/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b4ae105ad9c5b791d7d29aab190d52f66b019cc3/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/eb46439a5b0b303f46db0adbe255674719b5ff70/
     powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/a0f6d6cf400ad844757c30f10b5380843983dbc2/
        i686 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/94c7ae30af16a1277d861122bb612dfbca95f67c/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/17959e49cec599eff2780955b9b385680edd8f4f/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/28aa2b41a757032da3069e94129ef6888cba2c2c/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b4626923a21bd773023ab1ae8122a19647a958dc/
         sh4 |         gst1-plugins-bad-1.4.1 | NOK | http://autobuild.buildroot.net/results/eda4174e8120402599fdcf7a0fbed9dc25b859b3/
      x86_64 |         gst1-plugins-bad-1.4.1 | NOK | http://autobuild.buildroot.net/results/7b044a97548a11ecd4daf64b9ba4ffc3d772fa94/
         arc |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/45029f0494b6ee77e3816a436058a3de6fe448a5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4413ec74f9f51d62c4ae369c0a4a4a916a8485e3/
        i686 |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/9231373a8ada2d01056155c89109aeae83f468ea/
         arm | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/ba2d06533eb6878885a994f9ac2e5aa1a33b53e9/
        i686 |                 nodejs-0.10.32 | NOK | http://autobuild.buildroot.net/results/3ea017630a73049da6de7ba5d3c75c4400533dcc/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/c7fb3d065a3731273c359b0343fcbf822dea0b5b/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/ec4c82f73005ab2b576d6859acfd27ad348bb82c/
         arc |                      radvd-2.7 | NOK | http://autobuild.buildroot.net/results/8b793515e2cd64afa0bb28e7dd95cdda88c972f8/
       nios2 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/362fa1f0f08ffe6e8fa96d7beb111a16e8485a9d/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/64c1a68c5f006dd087fe11281903a761c2a215ec/
         arm |                 upmpdcli-0.8.0 | TIM | http://autobuild.buildroot.net/results/3aabbcd0458bfa0235bd93939f23dedc47d5ae58/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/f6eab7684e68c1585ca6d17955f7f62c053e3fa7/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/92e028c147b75fd641c783c13acd764972015d41/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/04bd9c6f8a00380efd7d7ea22bb178db944816c7/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/a48cb6940a3f66716486c80a69d6f59d31a72701/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/25fa8b1e6cfe006bb3dd5748844f6b1d69c5b61b/


-- 
http://autobuild.buildroot.net
