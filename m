From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Mar 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-23
Message-ID: <20140324073010.579C0100B89@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-23
===============================

        success : 67 
       failures : 44 
       timeouts : 0  
          TOTAL : 111

Classification of failures by reason
====================================

                   slang-2.2.4 | 12
                 mtools-4.0.18 | 7 
              host-scons-2.3.0 | 4 
                    crda-1.1.3 | 4 
                  zeromq-3.2.4 | 2 
                   ptpd2-2.3.0 | 2 
                     wget-1.15 | 2 
                   systemd-210 | 1 
                 qt5base-5.2.1 | 1 
                 fluxbox-1.3.5 | 1 
                 mplayer-1.1.1 | 1 
             host-mysql-5.1.73 | 1 
                     vlc-2.1.2 | 1 
                  python-2.7.6 | 1 
           imagemagick-6.8.8-8 | 1 
                    php-5.5.10 | 1 
                  bustle-0.4.3 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

    xtensa |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/42b085548fbf07359488bf22b948fb22eab16225/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/71a9c46c4f525fdf06098cba2f0b1174888d7087/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/27036304c46dcd6884eeef74bc9d971b3258ad5d/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b33e35c895725a1ae9d4891f11071702fe9d160d/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/27f7781b6b9ec7d5656d72ed21ab2827c4491e38/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/b4869a41a495abf0fa4f9c1c1d4de4805d48e5a5/
      bfin |                  fluxbox-1.3.5 | NOK | http://autobuild.buildroot.net/results/e9c887d25a3239759765c364b0c02241261f03cb/
    mipsel |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b547088a9cd429651b08eada07bd32e812dc93ae/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a89e95b299e3013c6a574a770289d26633c65876/
      mips |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1122a2dc72324eeae4e5fbbb9d1a85f088015a68/
       sh4 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/75d2324e3fdb9e6e8098c141f6cbabb03f1970db/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/afafe285ef504d91f05253b52f8295403cd52601/
      mips |            imagemagick-6.8.8-8 | NOK | http://autobuild.buildroot.net/results/c753dae94913808803c20f1aa444717bf549a592/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/95f9f43b41a5459d29514fd5c048fe3a8240962f/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/972ef800f687622422f694e36a411bc4248bd822/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/41ad569b6546fa69e771a3ac2c0855dabb070abe/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/ab6fb7d08a57a261aa6cabc2f53a6dad823e9493/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/db3ade4377796897786f6a3b3ba76f0623e207c9/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/de2a34bae07acab79c021c7d0cdbe67d991e6202/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/332cecba9cb58aba9871f7ff19168a11a397c8b4/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/67c40aa6bc2aa8f4828a9ad5fbcf744317946cdb/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/62b028c8d034baba63fc8ac233d607a1ceec0cf1/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/7e28e139ceb87738c9771f1c84d71b8843b95e48/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/901af9171d123ba256ae532049a6308f02d45f71/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/1e1afd98dc2a9c7ef34a991a1b694afc33f5988f/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/46acf37d26e2db0afa5ca224e27bc29bff8b2827/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/a3d464578e4e76555db93ff33ef103884e501a7d/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/e8c3f76bde95e7c9363cce0aabe20ddcabe98764/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/64baa8a06c1a0228721401aaea039e9bd99dcecc/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/3f0788084e781f47e6dda5eda136e9965c5178b1/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/afe11c4c4435f0ac946f8707a810e75c24bc53ee/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/458246eeb1bc38a1161b488d8ad571ccb0269939/
microblazeel |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/2bb819640bbd3cf95f4e4d3021584aaca174f42a/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7690ce58ccc4d65488fa7d24c14b310d4660b5fb/
   powerpc |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1425882cbe7c337686d36bf08a2e991560e99742/
    x86_64 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/29fadd3789e48e63cbfa5143636ad539ba37293c/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/eb8543738624c65abcf43488aa7f95932b7b13d1/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/fec558d034528b71e340094d6b7542b23621d3ef/
   powerpc |                    systemd-210 | NOK | http://autobuild.buildroot.net/results/09866da023d527b3c228a98f1fde104e780e1883/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/68b59ab36c32325e4256acf0c62f37def9671f54/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/b7ebf159cc344b41fbeb20f7028481b98e292746/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/424bfa0c3d9283b198b9fcaf4e9db0dc995e21c7/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/f14c776282a8d564b176514713dee27c59769ddf/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/30d31e813f2b469b95ea0b607a27c34f2fcef153/


-- 
http://autobuild.buildroot.net
