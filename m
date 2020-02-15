From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Feb 2020 07:14:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-14
Message-ID: <20200215071449.C30EA84B60@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  3  |  1  |  0  |  4  |
  2019.11.x  |  4  |  0  |  0  |  4  |
    master   | 32  | 12  |  6  | 50  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  host-ncurses | 3 
                         libnl | 3 
                    brltty-6.0 | 2 
                 mesa3d-19.3.3 | 2 
              host-grpc-1.25.0 | 1 
        host-gutenprint-5.2.14 | 1 
host-sdbusplus-4212292bcf13... | 1 
               libglib2-2.62.4 | 1 
                   libnss-3.50 | 1 
                   mimic-1.1.0 | 1 
                    parted-3.3 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7b89404dd84a337906d2fd4b22d7564fecf4fbf8 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b32ac9f780443d93948dc3650f45cbb71af7a09c |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0ff2b744d88eb57b0744bde1c511638722d94498 |     
    arm      |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/47bf2b3cbab6ecc6824635c3716024479623f4ec | ORPH
  aarch64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/997212fe0a09dd2498bb87115af5cf3783b1a64f |     
  riscv32    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/dadebd5b570fdc362e5d675384cea0ea0a228f71 |     
  mips64el   |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/cd555abdbe6474e456ce45561463b63a3b1c08e4 |     
  riscv64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/105f925742936a43d3f2500d727ec738b6d866b2 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/0d36952def63cb69628697fa6408aeb6ce10cb5b |     
  aarch64    |             libnl              | TIM | http://autobuild.buildroot.net/results/4d7bb0551997babd4e8722cf11eac320755427ad |     
    arc      |             libnl              | TIM | http://autobuild.buildroot.net/results/3b122a037570dc3d9925c9bc24c2201f1cc9f288 |     
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/84bca9d83a81e26400bfaca2fc360251f8057892 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/1ddaf4e54f9d393f0583f4f6c4bc2920a6e8336c |     
  aarch64    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/032b8dafefcd2ec8bdfaf10bc3e9542a79dde45e |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/5de0240a4bcb87a6444e97370047c42d722656bc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/68aaa99098bee74c8f2a1066deff796a4f485b23 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/6b5bdf681150a05f68c197ff0d31ed04c36780c8 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e5bece3c444349c87cd4b22b4e333af6a35de4ba |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/bca408aa0b4857d5c4fb6c36f0646f891ced4a86 | ORPH



-- 
http://autobuild.buildroot.net
