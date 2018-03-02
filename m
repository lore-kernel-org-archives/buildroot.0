From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Mar 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-01
Message-ID: <20180302070008.D2DBF2091C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-01
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 132 |   8 |   0 | 140 |
   2017.11.x |  13 |   0 |   0 |  13 |
        next |  28 |  13 |   0 |  41 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 2 
                   systemd-237 | 2 
                  boost-1.66.0 | 1 
           host-mono-5.4.0.201 | 1 
                      qt-4.8.7 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/493fb1a6e314635cdf5cbb3eaf4453c87c9da4e9 |     
        mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/df27c6ad23fb6ae8360b898de456a815fc7b777a |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/71e16d8298b00c32898c9648b4922a684d8ca18d |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/3cab7b54390feb5f952407f1e7fa49b9633a5f76 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9c75dc4987d896d94259dc815a6489607da4c910 | ORPH
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/fd11cec23bd6bb0d7cdcc85f91a22225f6888cc2 |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/14f9ceba9af32751179310d2e8dfd65e8707d660 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/78f29836a43b6b730427aa9d068754b05c4fe284 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 3 
               lightning-2.1.0 | 2 
                     php-7.2.2 | 2 
               domoticz-3.8153 | 1 
                     gpsd-3.17 | 1 
              host-erlang-20.0 | 1 
                  host-go-1.10 | 1 
                nftables-0.8.1 | 1 
                    sdl2-2.0.7 | 1 


Detail of failures
------------------

        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/176c0357004e568d2a5df2b5d87ff38e67fe160c |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/cfa76743c290c28b09c706014ac032a20e4cfb65 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6d8758cef5bd58374ae6029036ea5b105aed456f |     
        or1k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/666493495f44e7214a2ba7f97d5a3efd1adf5723 |     
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2e6ce44364eb1542d29ae20b89b1584a6dc6fead | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/7ad868a68178ebb839f7ed924642cf5ea8fcca67 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/6f5df901b41a7244d14cb3cf3223a43739f65963 | ORPH
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/ac82dcb38553ece41f9554f6d7f3ab6c3fe0d1bc |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/48fea9c9a4ecb9c448463d8bbf4155ceab063471 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/146f1397ee1d5f91cf83e3c6199d82db8dfbbb08 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/0bcfef9175f1b82a8b6dcbf1ea86b3142514a1c3 | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b1e154bb0904395ad2dbe04347af6ec19465e725 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/4782c490296e76dd8e7721f2d82a044278fc5ea9 |     


-- 
http://autobuild.buildroot.net
