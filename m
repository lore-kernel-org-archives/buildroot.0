From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-29
Message-ID: <20140930063009.EE01D100D47@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-29
===============================

        success : 75 
       failures : 10 
       timeouts : 2  
          TOTAL : 87 

Classification of failures by reason
====================================

               valgrind-3.10.0 | 3 
                      qt-4.8.6 | 2 
             lttng-tools-2.5.0 | 1 
                     vlc-2.1.5 | 1 
make: *** wait: No child pr... | 1 
        gst1-plugins-bad-1.4.1 | 1 
                  libplist-1.6 | 1 
     0K .......... ........... | 1 
          libmicrohttpd-0.9.37 | 1 

Detail of failures
===================

    mips64el |      0K .......... ........... | TIM | http://autobuild.buildroot.net/results/95a22dc41dc19a7a64eef769cd857654d9c92853/
    mips64el |         gst1-plugins-bad-1.4.1 | NOK | http://autobuild.buildroot.net/results/e8a859276db34aff87ef181b0cce98916b0afc90/
        bfin |           libmicrohttpd-0.9.37 | NOK | http://autobuild.buildroot.net/results/44b6f53b870005c9869eb4f50401d74fdbe4799f/
         arm |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/146ed3b904e41c73b7aff191fb3e1840c2ed86bb/
         arm |              lttng-tools-2.5.0 | NOK | http://autobuild.buildroot.net/results/4e16956373f2fda2f1f65698145989f4c8b84c2e/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/5e5c94c72c5542fd74508395943f6b060843306e/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3a8ecfe84b532fbe811ac0b2aeb6dc02630616d0/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f3a9c56d62579d9c18a7ec06dd87d9ca2808a0f0/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/8150dd1477da3625cc7022cd44ea6b830e048ebe/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/0a9d270927d301b6b143f09bac1eaadcc7bac9eb/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/e36060cb9594c761aa4a24d7f56296c258ddbba3/
     powerpc |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/114e20b5491d3fbe459d23c1a54a2db2fecc3921/


-- 
http://autobuild.buildroot.net
