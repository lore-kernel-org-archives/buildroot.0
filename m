From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Feb 2018 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-27
Message-ID: <20180228070032.8565F20986@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-27
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 130 |   2 |   0 | 132 |
   2017.11.x |  12 |   1 |   0 |  13 |
        next |  27 |   7 |   0 |  34 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 1 
                    sdl2-2.0.7 | 1 


Detail of failures
------------------

microblazeel |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/75b2025131439e2e8f77f7182d3d77c9152c273f |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/9612d43b192bbb88214a11fe18f8b8da6ad10313 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-erlang-19.3 | 1 


Detail of failures
------------------

         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/b9a64dd9400c9c9e9805c93ba8ed74ef9e5192dc |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 3 
                  host-go-1.10 | 1 
              keepalived-1.4.1 | 1 
                     php-7.2.2 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8e2263cefbffda0cdd85903bb29beddd18eb8a14 | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/543f4d824b8d0f0c0b975bcb788ee48419fd22aa | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/0c870969f6370bc57e213ab985d72fdd1294197c | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/90cca9ce83b000788eff6bb228344f6210f600dc | ORPH
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/c069defd30b76ae213e2beaddcec6fa16b9faf5b |     
      mipsel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8159b44a8f6875d41b882174efed6d4d434d7c5e | ORPH
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/a2b9cb107dcbd9bd6ac7c610675d13f7beece3a4 |     


-- 
http://autobuild.buildroot.net
