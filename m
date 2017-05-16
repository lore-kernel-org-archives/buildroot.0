From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 08:30:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-15
Message-ID: <20170516063043.79C252213B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-15
================================

      successes : 239
       failures : 14 
       timeouts : 1  
          TOTAL : 254

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 2 
                  quagga-1.1.1 | 2 
             rabbitmq-c-v0.8.0 | 2 
                  boost-1.63.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 ibrdtnd-1.0.1 | 1 
                libepoxy-1.4.1 | 1 
           modem-manager-1.6.4 | 1 
               pulseview-0.3.0 | 1 
                 qt5base-5.8.0 | 1 
                 x11vnc-0.9.14 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/e77695bccb2fac76b4b56bf4cc37102cb983d00e |     
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/05022c15a54c9ed2c1e13483c389df4ada2e4682 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/2344e3faf056166205f049dc44e799d45b9335bf | ORPH
         arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/14134c73cf4fc478554211a4c72b81f0176442ec |     
         arm |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/533f2cc996f0a2b83e2a05d61045ba1920eb181e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/31c37d436a4482e3595990420e9eec95135a2787 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/552dd83d1de7e84694008f599eab69041e0b7407 |     
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/e9f3f175e203529c44ecf92a34b82a0b3a473e34 |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/49bc9345b9849c9c3c53ace290c534ff7bb98683 |     
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/d81b0ae5821d525261347a66507a190733d625f0 | ORPH
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/8589823e3da092ca25e6ee82e4fb199136c8e770 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fa3c0bd55a34c32ef48449641296aa04470fbf71 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f5bcf69ce18c9c1d221b0f4f10c67a7454a5bc12 |     
         arm |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/873ed8f2ade1d969abdff15b7b6d63e04819af9a |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/8319e8ad660839b6617f08a0639aab8d6391fc51 |     

-- 
http://autobuild.buildroot.net
