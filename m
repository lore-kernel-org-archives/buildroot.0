From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-28
Message-ID: <20180129070007.A790D21984@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-28
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 238 |  29 |   2 | 269 |
   2017.11.x |  36 |   0 |   0 |  36 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 4 
         libcpprestsdk-v2.10.1 | 3 
                    sdl2-2.0.7 | 3 
                  boost-1.66.0 | 2 
              host-erlang-20.0 | 2 
open-lldp-036e314bd93602f73... | 2 
tvheadend-e06ffd87beff16103... | 2 
                     daq-2.0.6 | 1 
               domoticz-3.8153 | 1 
                  ffmpeg-3.4.1 | 1 
               host-efl-1.20.6 | 1 
                 libv4l-1.14.1 | 1 
make[6]: *** [profile-do--b... | 1 
                  ntp-4.2.8p10 | 1 
                      qt-4.8.7 | 1 
                  samba4-4.7.4 | 1 
                   systemd-236 | 1 
                    tunctl-1.5 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                       unknown | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ecb3a1d143f1c2ea3b3a1352e3cc0b94c12d4b05 |     
     aarch64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/29507ba56acf98f7c3b010c2dfbad28b59957971 |     
     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/66578fe80d2bdfec508c830aeda601fbbb592866 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/31ee3bab5fdb48a8db5a8096d83e89360388de72 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5c615a44132df7968057ffd814f770ce1bbf676d |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7b3affbbe00cc622420d6643c44886637272a0d0 |     
     powerpc |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/e129b4fc14d53c365a0bc173e7a40c26224e3125 |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/875fdc121f4c41c3a102df2244d061be2b609cf0 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/95461def9f97208c727a970016849f6675e13a52 |     
     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/3f86e95c74d92ab5fc8364c1405df9301ba8d04f |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/bf6b76d6ed258b0743801304f5dcbe8077b62c4f |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/fc27e1da6d7323694e2e61943c1f7253a1b1121d |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/3884da50acdb3eb6a600688bf98c882df511f6b3 |     
        or1k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/836fbb7bc239ae94afeda3de41950d3d2fa205d2 |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/ee439d29d1b766d86d199c1918164aa13e868794 |     
        i686 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/16184585a526d5def2ce2e67476e5e3e6cd8bb9f | ORPH
         arm | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/0707642c9d6dafc45b1cf4f477f9f2bbab27f835 |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/d73b93b8b0b5e69622064cf2648a2f6a746c3c8b | ORPH
     powerpc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/86f152d3916dfd0018ad17acd0e3838a50ba09f0 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/03bd1d4461fc452714c0a1354117edf10653f23d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/77169c1895425e3e674040babe4a61007beef5f2 | ORPH
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/fdd9bb5bea4488fc9e16746222051156224317a6 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/eca87864317cb6c43762666ef91fc54ccdf9742a |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/881ba25209f6802364c392ff46e5d929005c6510 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/57696ed8fe8bc6e00e6ab0869223eeee2613c506 |     
      mipsel |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/3817c66f16a561a1f5c057fd4b7853fe5baba574 |     
     aarch64 |                     tunctl-1.5 | TIM | http://autobuild.buildroot.net/results/ed014a5dbce946ef40a5e3731f3ef9359c040864 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/a1c529bb38b3d2e362a866e26698a1854a031ef3 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/48769d739edd5128bc6c5737b65251e8174d0a2c |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/567478e0ef928deaadd729ad68547e567198149f |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/14e977723aac8036527a492de780d7af1ac64eef |     


-- 
http://autobuild.buildroot.net
