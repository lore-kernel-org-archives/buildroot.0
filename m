From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 May 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-22
Message-ID: <20140523063008.8A64410106F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-22
===============================

        success : 107
       failures : 11 
       timeouts : 0  
          TOTAL : 118

Classification of failures by reason
====================================

                 httping-2.3.4 | 1 
                      qt-4.8.6 | 1 
               alsa-lib-1.0.26 | 1 
                 mplayer-1.1.1 | 1 
               audiofile-0.3.6 | 1 
                    php-5.5.12 | 1 
             dosfstools-3.0.26 | 1 
                  python-2.7.6 | 1 
                  cppcms-1.0.4 | 1 
package/rpi-userland/rpi-us... | 1 
              gst1-libav-1.2.4 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/520606ec674f6c8efad6ebbb840099ec89d03130/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc21623fbc3d4e94f09b2cb0be36ce05cf75a2e6/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/6a6eca78e0f8d730de612ed440ca5d030b363c12/
    mipsel |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/246c067f1e9def748498f0c6fa6988c036e1d109/
     avr32 |               gst1-libav-1.2.4 | NOK | http://autobuild.buildroot.net/results/ec6675adad4e09d71d7e365c399172ff233107f3/
   powerpc |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/365d6be787c5560aa1daa28065668261e1171d24/
       arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f62ace7ba49d492ea224bb8f3beb547389aab517/
       arm | package/rpi-userland/rpi-us... | NOK | http://autobuild.buildroot.net/results/0ef46e5d60c55387416c3293da8f26770854e158/
       arm |                     php-5.5.12 | NOK | http://autobuild.buildroot.net/results/3545a3a45124ef4f2c4c420ed56d0c923e3d63eb/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/4b42887bc7739447dd299361070e3625c3de7a56/
  mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/14309cd2c14f6a41f30cd00f7aef199b11612a85/


-- 
http://autobuild.buildroot.net
