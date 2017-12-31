From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-30
Message-ID: <20171231070007.C377220741@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-30
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 166 |  20 |   7 | 193 |
   2017.11.x |  20 |   0 |   0 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              syslog-ng-3.10.1 | 7 
                       unknown | 7 
                    brltty-5.5 | 2 
                   jamvm-2.0.0 | 2 
                 mplayer-1.3.0 | 2 
                  dash-0.5.9.1 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 mesa3d-17.3.1 | 1 
                  samba4-4.7.3 | 1 
              wireshark-2.2.11 | 1 


Detail of failures
------------------

    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/b51f867a4316ff5ce021bd35e19f841735b5c9b2 |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/489dd7a19911b45ae7b0f1eade63def793e03ade |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/f475227ce6b4d728c813e9dbf93d97cada2000db | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/dffff671f7900ddc465dfc4819f83571d025d490 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/8f6b0200f7601ee7198bce6defa5d6e563def35a |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/90f8cac1bf434efe3e4a352a92fcf04dff9e0ede | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/eb1ea3339a2d6ea0faf8eaafd80f3c783176c612 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7be4e7cfd7862bb2bf16528b177c42af3567b9bb |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/7f11d56604e5f461d417b28cfa3765ba1b4df892 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f44d7201c6b247df1eba0ee5624b5521d68c88b8 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b8f3885f37e9135df4093179ec620cdfb818b141 |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/cd0d83417ba97999929f10deac182feb5ac03d76 | ORPH
      x86_64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/7165380d46f169de57a1a420899a8f9ed0803f45 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/b9c9c343f7477029242052bb28923f7a400e46cc |     
    mips64el |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/15225aa00f0db0671b035332ad78d2a3ef050b06 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/e93bb9970503ac259f0428370abb878a4dac845a |     
microblazeel |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/b854c97b5af5125394246298d010baafa175a4c3 |     
      x86_64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/cdc941b47fe04e8e99393004b750451490dc8c8e |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/e12b88d082f053247863124f4802cafc73278c8c |     
     aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/8b1bbc649e7d334b809c8e7187885d32b9e2deba |     
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/b6269b9c7114a6bf309cf4ad9f24c6dad152e750 |     
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/d180fa7654d3171fcf133e6b399c840cbf9febf6 |     
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/72fbfa3c05687b56663ce0fbfba65834ca008235 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/cc3a2bbb3b988631b5214f4aea20096a4749a9e7 |     
         arc |                        unknown | TIM | http://autobuild.buildroot.net/results/93f97039768b14f6fe68a1913dbc2dc9c7a6e44c |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ceca4fadcad1070bc030ce560093cf80a26e5c12 |     
         arc |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/10a9c0eb70c9e346a781891516a4330ab37fd31e | ORPH


-- 
http://autobuild.buildroot.net
