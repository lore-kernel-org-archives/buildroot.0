From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-17
Message-ID: <20180118070007.70946209A2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-17
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 240 |  32 |   2 | 274 |
   2017.11.x |  35 |   3 |   1 |  39 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

open-lldp-036e314bd93602f73... | 6 
                  boost-1.66.0 | 5 
         libcpprestsdk-v2.10.1 | 3 
           cups-filters-1.17.9 | 2 
                  ffmpeg-3.4.1 | 2 
            nilfs-utils-v2.2.7 | 2 
                   systemd-236 | 2 
               asterisk-14.7.5 | 1 
               domoticz-3.8153 | 1 
                   gconf-3.2.6 | 1 
          host-libsemanage-2.7 | 1 
                 leveldb-v1.20 | 1 
make[1]: *** wait: No child... | 1 
make[6]: *** [profile-do--b... | 1 
            mesa3d-demos-8.3.0 | 1 
                    php-7.1.13 | 1 
                      qt-4.8.7 | 1 
                 s6-rc-0.4.0.0 | 1 
                  samba4-4.7.4 | 1 


Detail of failures
------------------

        mips |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/184d0a53fb96838e41a29523dee7e74c9061846e |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/50212f9bae4d3b4e6da7f5d07d8fd8499e5994f3 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/079ac08a26a771f294237bb6917d15e721c64ce0 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9cb349fe7a8d8d87fac897ead029d5dc7f46d514 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ba667973291b0517ec94ddb9f9e242c598a792ac |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/84ca6c524ff691d2a1080a7233602a6548606662 |     
     powerpc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/457562ae3123d883930ee5461b9997e9b4b31706 |     
     powerpc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/788c1a4bbc8ec90b5cdd94c107c784df21869f6c |     
        m68k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/197baa15cbf7f4fc7b3ccc602515af3f375ed68f |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/4ce6054dc947239ed46deadb29458cbe5addc9f4 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/b92bc52d0462b06006ba22cb30e762fa143a3d35 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/6bfa3926baaad1b7889895c775d96c3a734c67d7 |     
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/40200407c56990e3e27ff0d354726b5736f9dc1a |     
    mips64el |                  leveldb-v1.20 | NOK | http://autobuild.buildroot.net/results/46234e509c03230aac3a7132d3a7d0f04e21da5c |     
        or1k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7e42b906954e960506558b0811ff96b8f0ea9dad |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7ad7ddbf7f9cf9a5648f613920f7003d061f9c6f |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/fcbee96d707182c80b7ca00d3fa53ec1aac3eb57 |     
         arm | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b22c6fba3fcc47cb0a2f816c97287724ce33b1c4 |     
         arm | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/101ff85b8d9dd08517c0f3f380b228e6a8e5ddf5 |     
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/8c13fd2d562e4b6f496436e428c9583904c3b3a2 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/41af95b9ed7bbbe319565e1c20d1f6e2665d445f |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/acaac513eaaa39d4000268428407a9fa6989ef03 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/6e4e6597dcf53803e2f3bb3dbd37a1f05b3015a2 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/682d47b66c7d714432575b8d22539305471e975a |     
         arc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/a06feb8616b98d4931145ea5079650e06bd1a61d |     
       sparc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/a525d5e5cf5832a36ec3ace377856f6269f8d6d7 |     
       sparc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/436d78ef10b04c8d296002776c8f406f83419024 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8360e84e8b4e31f688d86a1d635a34d1cd575330 |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/ce046aa6561c31995668ae59d8458554a1643939 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cea2e8de176532d7838b4b9a9f19cdf0fe11e4c7 | ORPH
    mips64el |                  s6-rc-0.4.0.0 | NOK | http://autobuild.buildroot.net/results/1832d016721e55bbba59386cf67dc81ae2121413 |     
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/c31cac4ae40c703261675221f9ed52784628e080 | ORPH
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/60ea91128b06c25cf1591894579f87260e9c2e79 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/2c605eb49fb091a3cc163fe9e29fd2c5ec997b6d |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.88 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.9.2 | 1 
                       unknown | 1 


Detail of failures
------------------

       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/b99e122e07e6f48d998d88339315fa5170061f82 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/140378efc31f259cd8d74eb46ecf51021db023c1 | ORPH
    mips64el |              qt5location-5.9.2 | NOK | http://autobuild.buildroot.net/results/34a310acad2719a5c5105e10a5109fd17e02b78b |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/6c62e8458b1fd10c9727a806770096a7f5a3f62d |     


-- 
http://autobuild.buildroot.net
