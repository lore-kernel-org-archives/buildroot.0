From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 08:29:38 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-26
Message-ID: <20170527062938.233CE20DF5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-26
================================

      successes : 291
       failures : 9  
       timeouts : 1  
          TOTAL : 301

Classification of failures by reason
====================================

                  ffmpeg-3.3.1 | 3 
                    dhcp-4.3.5 | 1 
make[4]: *** wait: No child... | 1 
               opencv-2.4.13.2 | 1 
             qt5location-5.8.0 | 1 
                 rings-1.3.0-1 | 1 
                   taskd-1.1.0 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |                     dhcp-4.3.5 | NOK | http://autobuild.buildroot.net/results/40e48f74b586ce380766cf31473932e43090671e | ORPH
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/b006fe2583485f8c0986056937fded730d4d148b |     
         arm |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/9bd0dca25c956bed075019a39f6ee47b05f45d20 |     
         arc |                   ffmpeg-3.3.1 | NOK | http://autobuild.buildroot.net/results/207e493e1b12d538641102b79b8580a122270a61 |     
microblazeel | make[4]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/0c84fd833d644459f92a2737bb20d1cab04536c7 |     
        i686 |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/095f7574afdb633c59a625cd063de03644b6d3a7 |     
     powerpc |              qt5location-5.8.0 | NOK | http://autobuild.buildroot.net/results/653ac9144ab7d03b6f01fba8bc62a46ff3fe307b |     
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/7dac52fd793f50e2c61f37b4b92e27d09f1239d6 | ORPH
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3d2f73d7c4248e2fdf28de147a09cb52e2d26b7b |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/791f4f42e3d085c02d500d303064c3293beda7a8 |     

-- 
http://autobuild.buildroot.net
