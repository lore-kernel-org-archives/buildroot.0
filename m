From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 08:00:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-09
Message-ID: <20180110070005.6B915207AA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-09
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 211 |  22 |   5 | 238 |
   2017.11.x |  19 |   0 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 6 
             libostree-2017.15 | 5 
             bluez5_utils-5.48 | 2 
            nilfs-utils-v2.2.7 | 2 
                      qt-4.8.7 | 2 
               asterisk-14.7.5 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                     gpsd-3.16 | 1 
              host-sam-ba-2.16 | 1 
                      icu-60.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
package/python-xlib/python-... | 1 
                  samba4-4.7.4 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

     sparc64 |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/285ebaf09a03d580c348b9c74544281c0460171c |     
     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/7fa870edf928dd52b6cb091d26becea5d59839d6 |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3ea73c51f73d1dc968f2f61702775fb7681444ce |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2b65557e9c689a678228d7f364c75290435b557f |     
     powerpc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/3d49d72ac8150ab60b815b9e833957d959be2e39 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f966183d6aec9c1e53144a15745c05b3c7849d52 | ORPH
    mips64el |               host-sam-ba-2.16 | TIM | http://autobuild.buildroot.net/results/bf23aff19be436333611749a78d969f424dc0812 |     
        bfin |                       icu-60.1 | NOK | http://autobuild.buildroot.net/results/6b848f9535043448ab6686b0608f41e3445fa67c | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5ed3e10d6218b50526d082237fd89473eab76796 |     
      mipsel |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/651d280271545abcc5096b2e25ca365179388f68 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/0299460eea49d5df62541da0a4b5893734661ebd |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/dc11d6fa536b5feccb731e3794b167daf975a9a4 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e25ffce4c98f82e9fa90b872bb5b0dffbb0aee45 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/8fad79d7c790a5d04066dec561ecc4f136fa1c96 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/6fc51ade76571536133ac9e79ee50d8d1deaa806 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/08ed07316e4e2858d20134ab6c67fd56c792ebdd |     
      mipsel | package/python-xlib/python-... | NOK | http://autobuild.buildroot.net/results/28354b5f35969f2194c6376f4848ebe8ef2a0797 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa411a4b1253c3c19f42567ffb5f1519e759c463 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7c021638fed650a14211517835873fbb5cf4c756 | ORPH
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/5cf38d8e631367f24ac9c9e3dead7395a4868ed6 | ORPH
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/8bba68e624ae96f92bbbfbd8d0f647370c06caa3 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/e9dcc250fe1bc814a9c2433662f555f3567182cd |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9c5f28fc3b4ac0867550a2a0131ccfa4b05689ce |     
      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/abf8dc76a7ae1db30f6ffb54b7f866ecfd77bec9 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/9fdc9816672f3fb4f810a79a195c7fc7566fd8ea |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/95a729110fdb4599c3192b95c41316b6a10cf611 |     
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/af3036347a369dd6a6f9bde75350d845801d2a01 | ORPH


-- 
http://autobuild.buildroot.net
