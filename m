From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 08:27:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-27
Message-ID: <20170528062750.00DE920E61@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-27
================================

      successes : 302
       failures : 11 
       timeouts : 2  
          TOTAL : 315

Classification of failures by reason
====================================

                    mpv-0.25.0 | 2 
                  apitrace-7.0 | 1 
                  ffmpeg-3.3.1 | 1 
             gstreamer-0.10.36 | 1 
       host-erlang-rebar-2.6.4 | 1 
 make[2]: *** [all] Terminated | 1 
                   mpd-0.19.21 | 1 
          openpowerlink-V2.5.2 | 1 
      python-itsdangerous-0.24 | 1 
                   redis-3.2.8 | 1 
               wireshark-2.2.6 | 1 
                     xen-4.8.1 | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/dcb30ae6e1577ed775b7f5c90b27390d9c9293fd |     
        m68k |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/ccea666a91a9e588e3f9e66284d60da393d3668e |     
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/4d1bf5dc10465093d3f8eee661fefa02013d7e2a | ORPH
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/a041589ee6749c19ba08cc74292febe9599c8294 |     
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/f3fcd280b06cbe4e5068c8511e8a4755276fd008 |     
         arm |                    mpd-0.19.21 | NOK | http://autobuild.buildroot.net/results/7997ccd698f03885f98d00bd150dc3a578e4b161 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/b7362ed6c1101d9e2e262e8a4d6626ab991f5c69 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/96660c8eb560f5008cda509ccfb0f8847acea55c |     
      x86_64 |           openpowerlink-V2.5.2 | NOK | http://autobuild.buildroot.net/results/f437d09ac6c689c911e1885b95da33b692f2cb3c |     
    mips64el |       python-itsdangerous-0.24 | NOK | http://autobuild.buildroot.net/results/39010c31a71da0b05f07867de838c4f80eed8649 |     
       sparc |                    redis-3.2.8 | NOK | http://autobuild.buildroot.net/results/7b5818767b7550ade3992d54e16d515639627e4a |     
         arc |                wireshark-2.2.6 | NOK | http://autobuild.buildroot.net/results/6aefa88b01161c2e9e730cdb7ec68478e034d3c0 |     
     aarch64 |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/2ae44f36f3ed58a62b79fab059f23b508fe0f542 |     

-- 
http://autobuild.buildroot.net
