From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-08
Message-ID: <20131209073007.1EF51101502@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-08
===============================

        success : 81 
       failures : 32 
       timeouts : 1  
          TOTAL : 114

Classification of failures by reason
====================================

gpsd-327a3ef7c83c1b3b2cf7cd... | 12
                      opus-1.1 | 8 
             bluez_utils-4.101 | 1 
                       unknown | 1 
                 qt5base-5.1.1 | 1 
                    fbgrab-1.2 | 1 
          qt5declarative-5.1.1 | 1 
              e2fsprogs-1.42.8 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
ne10-88c18f02199947b2c8b577... | 1 
                    php-5.3.27 | 1 
         dvb-apps-be76da69f250 | 1 
                  sysklogd-1.5 | 1 
             dosfstools-3.0.24 | 1 
               w_scan-20130331 | 1 

Detail of failures
===================

   powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7aa6b9ebecfcda8dd1fcaf433a2e38befa78d339/
      bfin |              dosfstools-3.0.24 | NOK | http://autobuild.buildroot.net/results/07f0c6e84a78e5ff11387d93388a427d55ef19b8/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/aa2e5d922cff76f264918fb933e93b8b76da7086/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/6ade7d186e7fd1a5a5888cf2f56870973f0fdae3/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/42caf134dc34474f7ba1fb3895cafed0fe54870e/
      mips | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/fee2eabe38cf92d53331c9413af133425b547f5a/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/04149f1a128940f5b308416466fecce040e3a571/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/e1ef18cd944a22b14c9c9eaddabf319582892a95/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/3cda4d95f9899fe44debc9eb0bba4ce43c13ca41/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/675ffed612629af92104ea3a1ac360a64582ce0c/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/eb704493aab43b36a49ffea145bf105cec156976/
     nios2 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/610064f074995ec48e6c8216bb3b18b5d472f9cb/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/804d67262a5bb553f6bb14342e10736fac14b440/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/bf0b3332890e60cc75bd0818c3fdd91ae87d68e3/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/35c092fdef1137325f9d9efab9a4b95ef01f314b/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/6d0b19091b2bc198e9699feca477b5e8a2bf5633/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/4eb12dfb03b2f9615c08e660ef4de9a2520119b8/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/27841db375c1ba9a7a88e8b7c4c715de6ee575d7/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/90de4f293dded212305185964404a304e4154915/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/7986ed5dc79cc15c3f9de936814c86a76be70fc3/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/b673681bbe2a783f0a25045247bdeb4abb9cb8b8/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/1360fefb79ebc7d95ef3a7459be681ac11e1ffb4/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/187a9937d2fdff3ff6029a50acb4169d11660334/
    x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/879d38a5a82d6ddc8e83fdb01bf02ff4c4a92ebf/
    x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/411960a8bb964e4b8ff3c79cdf93a1889a80710b/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/4324cb33e318ad35c6a5cd60bf0bfa6dd5d90a34/
       sh4 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/10365a8e714bc0e976939eef19286b2077bdfc44/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/0e25454cd978cb7ad02173bd775353863606674a/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/a139a9a096fbfc4bb2a0f16395df6febe6e078b1/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/b9ed9ff56a68cdc7b3f852cb45476d0521f69644/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/50a64a22d60ccb11734879d7fbf09fd033235128/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/2bf22a0c6e49fdabe2c1bfb7bf7b455c992675b2/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/91f12a085b8a0c0fde1989c734a4c2f7a5b0b80a/


-- 
http://autobuild.buildroot.net
