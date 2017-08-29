From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 08:31:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-28
Message-ID: <20170829063112.BEEC4209BC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-28
================================

      successes : 171
       failures : 6  
       timeouts : 0  
          TOTAL : 177

Classification of failures by reason
====================================

                  dnsmasq-2.76 | 2 
                  cc-tool-0.26 | 1 
                libressl-2.5.5 | 1 
        ltp-testsuite-20170516 | 1 
                       unknown | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3540b27a1f7fe1479879ef14b2cd7a68351c62b5 |     
        bfin |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/fb7844a239472eb48c18778aa7d515552ccfb4b9 | ORPH
    mips64el |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/d453aff1ce1f5e1d380bd7692a4a0565505027a3 | ORPH
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/f165dc6bff5af4ae97e01c49b81867226cceee8c |     
   powerpc64 |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/97a96c759356fac1c940c27fa6092118f49563a6 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2033221f7ea92356e031ae2f925a75c89c885cbc |     

-- 
http://autobuild.buildroot.net
