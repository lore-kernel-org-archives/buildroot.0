From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jan 2018 08:00:44 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-26
Message-ID: <20180127070044.8A4B1208EE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-26
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 211 |  37 |   4 | 252 |
   2017.11.x |  15 |   1 |   0 |  16 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 7 
         libcpprestsdk-v2.10.1 | 6 
             bluez5_utils-5.48 | 3 
            nilfs-utils-v2.2.7 | 3 
              host-erlang-20.0 | 2 
open-lldp-036e314bd93602f73... | 2 
tvheadend-e06ffd87beff16103... | 2 
                     daq-2.0.6 | 1 
             freerdp-2.0.0-rc0 | 1 
                   gconf-3.2.6 | 1 
                     gpsd-3.16 | 1 
               host-efl-1.20.6 | 1 
         libevent-2.1.8-stable | 1 
        ltp-testsuite-20180118 | 1 
              lynx-2.8.9dev.16 | 1 
make[1]: *** wait: No child... | 1 
           python-flask-0.12.2 | 1 
             qt5location-5.9.3 | 1 
                  samba4-4.7.4 | 1 
                    sdl2-2.0.7 | 1 
              syslog-ng-3.10.1 | 1 
                       unknown | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/63446a3680b0a82bb3fbe816bb0e21516ce56678 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2274de8a0f8d9d535fbff3da69bcb7bcb670941c |     
        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3acfde38e54b50976eabab4d92af2fa4c1cd58bf |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/60f781f750cd27ca08231eb63cd04e13bdc7a410 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f73219d4b0f8121ac917788799a8ae9aac0e6759 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/c27bf1ab958f89e3c9f439a6b8ae13a758a628e9 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/00da22909c011a4a86a9dae5757a2dff8074a558 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/77cc33a23ec6d598adb01428973dc93bb45edd90 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/eac1c582203b0225a7076cd650cf12add0c874b3 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f4c9225c313503c25199b39ec72ae184e0367515 |     
      xtensa |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/d547c56fb9a0e8b02ecd5038228ebe63ba21e7bf |     
        or1k |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/28433b930750bda6f31e8a8fea3d62abee6c2a5a |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/a05f0afd5d7e43b5b1acee64456f042451ce6523 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/02d6979541d78387ff3616fb84827815e510c739 | ORPH
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/d469cf05ff0b8d0bb77e801754230159907ba4df |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/b7c50177acce4313f156b1b60ee32a6c5d1e8b95 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/6193fbfd700b0c9cbae97e7321bb584445cdd387 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/347d1165009f0e48ae461a39e0d16e47ad056bd9 |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/9037c28cde335d15b98f4be6942bb94a18abe9c5 |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/5a535296720b6d50d00d51d7fe6f2d65989ab768 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7bdbfc71743fb935e00352a4063fdea5a3900c3b |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/6193657894757f9fbe4b3d0b0a485c86c26956d7 |     
        or1k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/f131cfa4ef4e11e7d54b0d92634a1bf200561579 |     
         arc |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/40dc1c0aedeb0c39c237bbfc29784d68b8848649 | ORPH
     powerpc |         ltp-testsuite-20180118 | NOK | http://autobuild.buildroot.net/results/21a6eeddbf5ccffc34c38527d0807305a5eb3917 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/1d9da51b73bb10896af6b67cecb0a5bb9925152a |     
     aarch64 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/642c6886fee662a8f5eb5a95ec26b3bc8e7d60b1 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/ec45911145437e6f811c502f546630051ebb9f89 |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/2d7f940edd0c88bf91e9d18aaf8af6f29a561e8f |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/36abfeb660a4a656f5c7b3541ffbef25cecaf36e |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/4cd91e1981ccd6caceaf1c5732db1d0d1c0160fe |     
        m68k | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/81be2f3bd9a7bfb24c786a0f4c6c0137425120d4 |     
      xtensa |            python-flask-0.12.2 | TIM | http://autobuild.buildroot.net/results/7236910ed0666cf34449e874741b378867c41475 |     
       sparc |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/0ad78ebf88a8b3d383993a5c264d413a9f219f33 |     
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/7736702af4711c3ec2d7171bd9bc41e0932dd432 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/1bc5363078ebe352715ffed7087427fac8fc8c70 |     
    mips64el |               syslog-ng-3.10.1 | TIM | http://autobuild.buildroot.net/results/af5e8ccae7dc771c233c5f09434417bb0ef7f242 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/2f697ad069d4c7f15e201fbaa2e95a119aa3a0a1 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/5340ea475254260b0024eb2b03981e27aaaa2219 |     
        or1k |                        unknown | TIM | http://autobuild.buildroot.net/results/6c64e5c14bf57fa3085ada509afcec373e1a7e86 |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/7d20bb582b3a5800e225b1158c425faebfac8ce9 | ORPH

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/38da8f2c397e84da23e45b941143ef3dbde961ae |     


-- 
http://autobuild.buildroot.net
