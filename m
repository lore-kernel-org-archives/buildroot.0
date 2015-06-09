From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jun 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-08
Message-ID: <20150609063015.AC7E6101752@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-08
===============================

        success : 243
       failures : 8  
       timeouts : 0  
          TOTAL : 251

Classification of failures by reason
====================================

pulseview-198f9bc74d6c955a7... | 3 
                     vlc-2.2.1 | 1 
                    olsr-0.6.8 | 1 
                  stress-1.0.4 | 1 
                libedje-1.7.10 | 1 
  toolchain-external-undefined | 1 

Detail of failures
===================

      xtensa |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/08548a18e9ec8e2f783365bdd5e1d7491cb8d856/
         arc |                     olsr-0.6.8 | NOK | http://autobuild.buildroot.net/results/08a29bc48667f10d6dce4cb5cbb1ae6bec009e2c/
         sh4 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/718b9ecc499f5a3e11a2c5fafb4d148c33a8ac52/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/62942fd7f42975d1f6bb75192128e86a708007ab/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/ff2366b417d3cc904ea5da81e18d750f2ad8186e/
         arc |                   stress-1.0.4 | NOK | http://autobuild.buildroot.net/results/651c8fb6a40d7b810a62ebe4375e520aee0dff2e/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/786284f0a781cd909583b18235aeeb39f90a11fe/
     aarch64 |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/58fade6f072abce7a0d46b8d2c07c3f88c1a8a46/


-- 
http://autobuild.buildroot.net
