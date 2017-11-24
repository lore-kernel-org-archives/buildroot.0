From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-23
Message-ID: <20171124070006.9E1CF20399@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  11 |   0 |   0 |  11 |
      master | 170 |  11 |   0 | 181 |
        next |  31 |   6 |   0 |  37 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   pcre2-10.30 | 2 
                      qt-4.8.7 | 2 
               asterisk-14.5.0 | 1 
                  cc-tool-0.26 | 1 
                     gpsd-3.16 | 1 
host-google-breakpad-7515ab... | 1 
    host-libevent-2.1.8-stable | 1 
                 mesa3d-17.2.4 | 1 
                poppler-0.59.0 | 1 


Detail of failures
------------------

     powerpc |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/e0da7dc19943474345b164bc15eee074052a2256 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2125cd75f1b1744a31ef49a5e919a2bde9b3ca35 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/ac311babba8a2df583598b51bdd676e532ac6f69 | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/5d615ce8f87b72f17c335f52895a616abac4721d |     
         arm |     host-libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/403886e3afc6d5d18a138f4b0651f3c5a50ed064 | ORPH
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/91fc9706f2a3a0fa0481f675812cf9af4e79c37c |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/944dab9312495184fe3d2d0de323c7390560e72b | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/9ad3f242ce9279be69a88ad657436f0e0ad180ae | ORPH
     powerpc |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/7febf3d5efdf70fbb798f5a38d359ffd608bf9c7 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8e99883f1adc486a1f3fbc7d021fe4ef41a88ed0 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/744002f7c4da8faa210d9608d4e5cbf785322227 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              alsa-lib-1.1.4.1 | 1 
                    chrony-3.2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                harfbuzz-1.7.1 | 1 
                   libcap-2.25 | 1 
            motion-release-4.1 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/2da3decef91fa7a272d73067617a0f979e47381b |     
      x86_64 |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/5c1b0c0c72757ff68832a93388e03554e8ff5015 |     
      xtensa | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/b09fdedcf73c5dac25aca1d6227006db5d9468c8 |     
   powerpc64 |                 harfbuzz-1.7.1 | NOK | http://autobuild.buildroot.net/results/ce3092c7ff3cecb1140d9e6f183912de95f3cae8 |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e05ed1631241e46c6b809ad557152c488f430db6 |     
        i586 |             motion-release-4.1 | NOK | http://autobuild.buildroot.net/results/65534775c5977e2424c5f5c63c46f9d0f39d7e1b |     


-- 
http://autobuild.buildroot.net
