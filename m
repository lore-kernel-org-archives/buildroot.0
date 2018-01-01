From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Jan 2018 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-31
Message-ID: <20180101070009.A9B63207CA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-31
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 151 |  13 |   2 | 166 |
   2017.11.x |  12 |   2 |   0 |  14 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 2 
              syslog-ng-3.10.1 | 2 
                           all | 1 
                   erlang-20.0 | 1 
                  ffmpeg-3.4.1 | 1 
                   json-c-0.13 | 1 
             libostree-2017.15 | 1 
                 mesa3d-17.3.1 | 1 
                 mplayer-1.3.0 | 1 
              qt5wayland-5.6.3 | 1 
                  samba4-4.7.3 | 1 
                       unknown | 1 
              wireshark-2.2.11 | 1 


Detail of failures
------------------

         arc |                            all | TIM | http://autobuild.buildroot.net/results/1f7eacd0f67a8057851e373441f834be4dab1472 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f6ec45ca6c784289ebb9c533301d21511480ddb1 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/571fd64b0f1551fe86ef28295f72d02440c8b19a |     
         arm |                    erlang-20.0 | NOK | http://autobuild.buildroot.net/results/62b09e9422575769e9048bbace5188c96bd81bc7 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/74df63e622f505164dfa6039e9e8041552f72c81 |     
         arm |                    json-c-0.13 | NOK | http://autobuild.buildroot.net/results/fa45d8fb0fa1063d35e74aba7c5ce69380038890 | ORPH
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/680458dc049d2c286918aeed745515894f8fcefa |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/105a5aaf9f460a24681ff37e3363aae2e580b1d2 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/678b5b88ae7039cd5dcc5652d7ac1b640af7e352 |     
      mipsel |               qt5wayland-5.6.3 | NOK | http://autobuild.buildroot.net/results/289d9b73d99e29d61c2df9ce228fed3968d89f5c |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/cf86d11883fb4bf9bafa873723db6a933c0a58e0 | ORPH
      xtensa |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/20dc3491c360fd5c169eea8b7cf94d0a7bf0526a |     
        i586 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/63b43cc427d1a912da58f88a488e7e506a4f2a38 |     
   powerpc64 |                        unknown | TIM | http://autobuild.buildroot.net/results/413b51febfa010ed0dbaafcf807bf36a2427e672 |     
      xtensa |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/bd5e7c54006445254dc9d2d4a7602de613989192 | ORPH

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                   pcre2-10.30 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/49dcb4e05ed721610024e280e8ebbfdb999f179d |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/fed3f43707ab4959e615b4df7f469b800710d9c5 | ORPH


-- 
http://autobuild.buildroot.net
