From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-18
Message-ID: <20161119073014.3299020C1E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-18
================================

      successes : 139
       failures : 27 
       timeouts : 1  
          TOTAL : 167

Classification of failures by reason
====================================

                  guile-2.0.13 | 2 
                    mpv-0.20.0 | 2 
                    php-7.0.12 | 2 
              ptpd2-ptpd-2.3.1 | 2 
                xfsprogs-4.7.0 | 2 
                   assimp-v3.2 | 1 
                collectd-5.5.2 | 1 
                  lcdapi-v0.10 | 1 
               libdvbcsa-1.1.0 | 1 
                   lite-0.8.10 | 1 
 make[1]: *** [all] Terminated | 1 
                 mesa3d-13.0.0 | 1 
                 mplayer-1.3.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
python-libconfig-b271c3d9da... | 1 
qextserialport-ada321a9ee46... | 1 
                    ruby-2.3.1 | 1 
                  stunnel-5.36 | 1 
                sysklogd-1.5.1 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
                     vlc-2.2.4 | 1 
              xapp_xload-1.1.2 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9e4c12001d54d4a62fb43546c4263ef09aff91e4
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/a3169ef98a5f38ac475ff640967d787c87df6efa
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/b94b3ebc9e7bcc60b83e9dffc8cb276c6ee5bec5
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/1c1bf79024d6d7aab1fc4c1e932768d975933af4
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/3aa380539edf3a5a046f24b5c99e8998c2546c72
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/0be5e6b6194df5261b5ee569100f9eb2c899b695
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ff59ddbcfd8942c5141e49be1c0a75f85ef076e7
     powerpc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/b12c607bec99c6b1c59921b1659dc54effa2e432
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ab240f93c6b2701c3df08b25d12a4b27b7a24451
   powerpc64 |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/35b43039ee050a62966c6f104ad4b5816ebfc310
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1db64b4830f499621e44523e0ef68191505e2ce9
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c9e554c8f880b49b3c9203725ac5e6565b7e5c6f
         arm |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/a90e6c44c54d7860007d32cd897d180515f8e8df
         arm |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/500ee8b828699a488697eaac90bd912fe8eb2ca0
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9a046dc5ef390e562b89338f0afeaef14b945458
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/cb967c8af006caa9272e800968f794ca018a7a27
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/845a1e990eae3cc8a148f846db4ac597ebaedb4a
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/c9233ad71fd60d0e6a85731a8bd4e598bd84947a
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/e0f6c2549ed79a8f099eb87e5812749ccc3a85be
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/b2fe90ab02c3e0d9588f79499065635723824320
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/3cb074ea467042348d443f8b7f9408701432d888
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d01e947fa807336ffcfd0fad27397af8e7442833
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/7f4ba458d28d0b1eb6a4052276ae31aa1318f106
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/432d0fb0bd872aa334069af17a0f41f9a4eb9633
        i586 |               xapp_xload-1.1.2 | NOK | http://autobuild.buildroot.net/results/986fdb636bfa0bcb6c5ec224a1eaaf86521119a5
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/f68037b8b64d9ec663c5070ae7858a5e61cace43
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/01574937006c9da190e2e3cffd5432460e374984

-- 
http://autobuild.buildroot.net
