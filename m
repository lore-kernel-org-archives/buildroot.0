From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-08
Message-ID: <20140309073009.994EA100DBF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-08
===============================

        success : 72 
       failures : 34 
       timeouts : 0  
          TOTAL : 106

Classification of failures by reason
====================================

jack2-37976441044d69b91d61d... | 7 
                    crda-1.1.3 | 5 
                  libenca-1.15 | 4 
                     wget-1.15 | 4 
              host-scons-2.3.0 | 2 
                  python-2.7.6 | 2 
               alsa-lib-1.0.26 | 1 
                     popt-1.16 | 1 
                linphone-3.6.1 | 1 
                  bustle-0.4.3 | 1 
                 mplayer-1.1.1 | 1 
              e2fsprogs-1.42.9 | 1 
                rtorrent-0.9.3 | 1 
                pulseaudio-4.0 | 1 
              pcsc-lite-1.8.10 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/21abf7885dd7997ca03924b384e858c77899c9c5/
      i686 |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/56987b9c39376d2443b96160485f4fd8eefda9bb/
     avr32 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/8124a32b26030a2bcd924454b0710aff73d79d83/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b527d5a380e24d9573e219d55d91ecc353bd389a/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/8ef7e5046785df643a3ab05b12f078dbfdb43641/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e164843f875fb54cb069b98bb9545311650ca810/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/1c5b05c7b367c8d074d13cfbe8b9d0be3933e048/
       arc |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/088943d2f73ff95b0db71a9a8245e4fc81e3d89e/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/717c49916aedfdbea1db03a902f3ae5a4e29a26b/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a7e18d1249502a67463514f10bc6b186d1a60775/
    mipsel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/6f347de52214d9f5fb80df3814766445ed69e976/
    x86_64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/fc42597a9a22af69a33c810561e2b3dd6c6bf8f4/
    x86_64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/1b5561e210b55d4c169a513892e3b586e9263b42/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/4c3b4f1db5c1aadfd8de59f7a655a7644f1bc1be/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/f4558837adeb89650beb9d74a3bd97616e412a8f/
      i686 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/70437b308bff04bc72297fa861213da88bafb419/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/53d8d93b911e2e81f6c85cde12382be739af3e6c/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/cf29379344d2b44c3d46aede7a7bdb6b95916f65/
       arm |                   libenca-1.15 | NOK | http://autobuild.buildroot.net/results/1dfb57ee9068696706b951987e5f8f1cf0ecac06/
      i686 |                   libenca-1.15 | NOK | http://autobuild.buildroot.net/results/40c9016a6a268aee6aec1a72974d8650953ba537/
  mips64el |                   libenca-1.15 | NOK | http://autobuild.buildroot.net/results/6d84a3dd2e0423785cf3c5b410ed7398d7d4c4d6/
       arm |                   libenca-1.15 | NOK | http://autobuild.buildroot.net/results/9098268fd39240ff2c41df36be42de1e10d57537/
       arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e66c8204ae763172491886d671e3fba57c52645d/
       arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/949e4a0af8310fd6a39dbace86df941621c3b71e/
    mipsel |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/34b83c3ea4a8aac6aeda225e5859bd318b13a676/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/df9cf4b483000f147bb5e041ae4cf0c26625bc2d/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/636dbad0b55e4d5079a42312906cbfabce47cee7/
      i686 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/20d988bac04889030cbef534be287ff4289acd5e/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/9330d6e6b35c9a28ea0774f4927c7a5311ecbf93/
     nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/20fe334b5020d459e4ef5a22f1acdd3f8cbbd100/
      mips |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/73015e8bb195a9ae5a2acdf8d0f81b954402f39e/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c05f033346eb52cedc39d0529404ef4b9055a34d/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/122d8f1de5b10d18121c9f2918f1e6a66b509c67/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3921b6f450834c00bb709b43c549186606c7eeba/


-- 
http://autobuild.buildroot.net
