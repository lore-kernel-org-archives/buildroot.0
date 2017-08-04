From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Aug 2017 08:30:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-03
Message-ID: <20170804063052.F248121EF4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-03
================================

      successes : 144
       failures : 16 
       timeouts : 0  
          TOTAL : 160

Classification of failures by reason
====================================

                     gpsd-3.16 | 4 
              swupdate-2017.07 | 3 
snappy-be6dc3db83c4701e3e79... | 2 
                  cc-tool-0.26 | 1 
                  dnsmasq-2.76 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
                librsync-0.9.7 | 1 
          mediastreamer-2.14.0 | 1 
     python-cryptography-1.7.2 | 1 
                 qt5base-5.9.1 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3c7d7bd3ff43ec4719b61861dfcc03e047cf916d |     
        m68k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/ed64ce27846e72f3c5b5c217f54eb68bdeacc0c7 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f0484296ff5beb78dcdb3bbd9b3c0bafac45487d |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/88a03a3e918072b810a3e214aab64927868f3355 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/437705e886c4a2a436f0963aba0bca60b24b196e |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6936b7a3fe1b286bb281bf74571772dfcb4957c7 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/7d8e6d469269b5f147ab6d7bf73466807f4a3488 |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/05c4d6d7af60dcdd3ebee01ea486a208c203ea12 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/42d2ff90086d8a78db2daf3274ca06286c17eff7 | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6bbd10ddb2e07ccabfb9733f2c6c97739e8579b1 |     
       sparc |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/841c7ecd59dff6c320262118436711acaeb2d156 |     
        m68k | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/8860b9259f7a3aecb2ddbfa787be048072bd347b |     
        i586 | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/39f9fc4300ddca19e8a533765b46838003752000 |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/a4f64d21867c6bd909e6d03e6eeaee96ec6aa539 |     
     sparc64 |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/cc5beda3d7e0027291668aa739078cb613c2db9e |     
      mipsel |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/9befed13c509eeeab70a7db5769dfc727af52e6f |     

-- 
http://autobuild.buildroot.net
