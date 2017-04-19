From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Apr 2017 08:28:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-18
Message-ID: <20170419062815.A6CFF207F7@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-18
================================

      successes : 201
       failures : 40 
       timeouts : 2  
          TOTAL : 243

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 10
                    mpir-3.0.0 | 3 
                poppler-0.53.0 | 3 
                 binutils-2.27 | 2 
                busybox-1.26.2 | 2 
                    ffmpeg-3.3 | 2 
                libepoxy-1.4.1 | 2 
                  ntp-4.2.8p10 | 2 
                  boost-1.63.0 | 1 
                    cups-2.2.3 | 1 
           libmemcached-1.0.18 | 1 
        ltp-testsuite-20170116 | 1 
             lttng-tools-2.9.4 | 1 
make[2]: *** [smartd.o] Ter... | 1 
                openssl-1.0.2k | 1 
           oracle-mysql-5.1.73 | 1 
               qt5webkit-5.6.2 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.7 | 1 
               syslog-ng-3.9.1 | 1 
                   trinity-1.7 | 1 
           uboot-tools-2017.03 | 1 
                    xxhash-r40 | 1 


Detail of failures
===================

        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/13d086e7dd1cb6783e772b0e6ce77dd2307413c7 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/9d19f2130493b76263700ae5687c344ed91952f6 | ORPH
     powerpc |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/6f8a1979262537de3aeac2cbba55512e856046ee |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/f582de34815f022d0136792837d0d60075217125 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/aea5900b47fad35f83cbf5bac008e6f786c85e60 | ORPH
         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/2910bca9f48b62428c9c7da05f68689c443364aa | ORPH
        i586 |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/7e67d7e6e33b52ce7fbb9cb180b2b9b19e116eee |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/b09e47d9a6fd708704a6ade8f7f3e3c021c1d5c3 |     
        sh4a |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/aa62cd936093be88542ed88bfa1f1aeff9d63aa5 |     
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/5ab698b3745a853ee32c0cf08a71b158746896a2 |     
      x86_64 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9b3ab1cff3990ee216fc482a40d77cbed8636e97 |     
   powerpc64 |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/3bd3a60916a8a2320705140d4666899fc00d70b6 |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/0575ed4079f8eccdaf99d7ab2b44b168707bf3ef |     
microblazeel | make[2]: *** [smartd.o] Ter... | TIM | http://autobuild.buildroot.net/results/48f115589d3b39474b1cd8869e909235777fc97c |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/def6661b02be5f866979846f574749f74c063c45 |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/ecdde998c6763c14b2314d4513f15db95305fa11 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c25d797e4e2b621c72ba0770ba9cba94dee2401a |     
        mips |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/e61bf36380280e7d3a6b26c2d87f362a8b4fb849 | ORPH
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/3072c3e1a1004e0533981c834e1386470b3e4b6c | ORPH
         arm |                 openssl-1.0.2k | NOK | http://autobuild.buildroot.net/results/9feeb8b43f1c98d0d90fb03cf396fdf37bfa3811 | ORPH
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/30b59dfc7509aede74cfae4540311e9f8d4a7e66 | ORPH
        m68k |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/955e09fd38fd2990f74c0d0410cd76fdff04094e |     
        i686 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/b5773a5219030f0f64482878d68edcdc1396195b |     
         arc |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/f6632959046d84f5dfee3d48ec95f5f323c484c0 |     
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/a88f43b667230d35d40826c70f394c5d0c11f011 |     
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/570fcd1fffe21dc04541beb7fee5560afa3411d4 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4ef0a88423182d2f05062804441bb5030d0b6e60 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/b8a962b9b02c2887b2aec5a5855fdb218f09282e |     
      x86_64 |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/3c32f4eb7436da06f3fb59f928363959df2a5e86 |     
       sparc |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/17f7fe79242a40ff3e588748230de7bf2a010941 |     
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/242e8e844861ef80ac9d9b6df3077375c6fc2373 | ORPH
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/a07b65b85bead2ab4b57ac0e83e5e20eb0e79c82 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/83ca28ccc742e2b1a449dab9ed6372feb0fbfe89 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/859cc6766cb8a79a34318516d627f4ecfccacfbc |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/514e4d1d7b16b624d0b9ec7b5287a9e7e5df8158 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/1e258139ed2b96b383162b925d0e3932b914dbbe |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/25d753d113678d9fea8ecd235e16e4f948cf5210 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/fea7f7f61b4bf51f52a074d4b0037cf09c61dbb9 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/0fd7bc4098118b909a49aa8a379c1c0a85bc93fc |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/7267acc0248d391e1c1ce069047e6d4104215639 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/077ff7a8193539bdf79f8434f03c1c1047c258be |     
    mips64el |                     xxhash-r40 | TIM | http://autobuild.buildroot.net/results/c4d69e92e331ab332232ec472b55b692fea3de64 |     

-- 
http://autobuild.buildroot.net
