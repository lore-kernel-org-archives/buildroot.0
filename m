From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-18
Message-ID: <20170819063025.C7AD721DAE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-18
================================

      successes : 156
       failures : 7  
       timeouts : 1  
          TOTAL : 164

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 2 
             lttng-tools-2.9.5 | 1 
make: *** make[1]: *** wait... | 1 
          mediastreamer-2.14.0 | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
                    vde2-2.3.2 | 1 


Detail of failures
===================

      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/0111d1f3c18b3f482207a1052831cd0bc45172b3 |     
   powerpc64 | make: *** make[1]: *** wait... | TIM | http://autobuild.buildroot.net/results/69a8e848ee9ef142fb9565ee5f6d4b2b0e166b5e |     
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/92870b5a749af53e58687be77e50d91ba1583cfd | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9f8101a1a5be2fa79dfe606c1019dd5928069e73 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3219b94214a7c3ea11274be6a8a05a2fddeddca7 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/35761bce2bc3bda0a82e4361dcafb2384d3f72b5 |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4bcb939676052cc6a1f2bcce6f16c6ab0d65b538 | ORPH
         arm |                     vde2-2.3.2 | NOK | http://autobuild.buildroot.net/results/7caed73f118932bc74149fd646eb2da56f15d52a |     

-- 
http://autobuild.buildroot.net
