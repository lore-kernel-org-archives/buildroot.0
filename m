From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Jun 2017 08:32:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-31
Message-ID: <20170601063239.361F720F48@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-31
================================

      successes : 225
       failures : 5  
       timeouts : 3  
          TOTAL : 233

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 3 
       host-erlang-rebar-2.6.4 | 2 
                    hans-0.4.4 | 1 
 make[2]: *** [all] Terminated | 1 
    python-pygame-d61ea8eabd56 | 1 


Detail of failures
===================

    mips64el |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/d142f4a439d4d5fcc89865abde3e593c45ad5d96 |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/1c829903c60a201249d5c0c7829cdca0bec76205 |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/1d3b5144f1c75440d513c0cf1a9c94375e39bd81 |     
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e50537f196678f1ad91d005c91718484c1d60078 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8b49ccb4a05058155741f6747123ce38a21f149c |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/af81ed60cfc740d920ba3da16394c2023eaadced |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fd7e14f31386735090d4663e11c05971a1037c6c |     
      x86_64 |     python-pygame-d61ea8eabd56 | NOK | http://autobuild.buildroot.net/results/b2af2ef789e2ff026d04db919eee370f7f0fa39a |     

-- 
http://autobuild.buildroot.net
