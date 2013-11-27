From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 08:30:03 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-26
Message-ID: <20131127073003.45D031014F0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-26
===============================

        success : 71 
       failures : 14 
       timeouts : 1  
          TOTAL : 86 

Classification of failures by reason
====================================

                 rt-tests-0.83 | 2 
                sqlite-3080002 | 1 
                    crda-1.1.3 | 1 
                log4cxx-0.10.0 | 1 
                openssl-1.0.1e | 1 
             tinymembench-v0.2 | 1 
                 libnspr-4.9.6 | 1 
sconeserver-d58f2de88c68193... | 1 
                host-gdb-7.5.1 | 1 
          host-protobuf-c-0.15 | 1 
               alsa-lib-1.0.26 | 1 
top.c:523:7: warning: value... | 1 
                     nut-2.6.5 | 1 
                pulseaudio-4.0 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/be720d745cf1082dd653c3d76bad24ff4cf1f9c2/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/31c54e16b60f41e2aa9ea6cd43ced694d3ce3ce0/
     nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/a470f147166b6cc756ae32dea2a9e0a3ac58a027/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/506f8b778b62e1397b91592289c3dfb8195240dd/
      bfin |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/dd353703ed94cec48cd126d80cd2f1b039811be4/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/035a00de0a56be00559767ba822a396ddc18a9fb/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/47d74ee1195aebcbcd3cb553305d07bee85fe433/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/32e9576dbbdf131dd8e8e6bd35755e4fade1b99f/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/b6f26faf7fb3d2465a6a2c9a762692fbafcf5ade/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/bc84ae15772114abd4e8295a315c2e179fb570b5/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/bbd7c70648b731932099dff52e32d43f025a630b/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/1ea4863e3bc0398e51d54d6d108821e4338a60c3/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/bdd8372a375cca606b241c6943eeddbd717e8b83/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/c5da2d99c09b1a2f7da23f1636f1ccc8978cc4a3/
      mips | top.c:523:7: warning: value... | TIM | http://autobuild.buildroot.net/results/b251116bdd7321a970da153270166b2131db33b4/


-- 
http://autobuild.buildroot.net
