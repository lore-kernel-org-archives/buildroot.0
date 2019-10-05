From: Danilo Bargen <mail@dbrgn.ch>
Date: Sat, 5 Oct 2019 02:38:47 +0200
Subject: [Buildroot] [PATCH 0/1] add support for apu2 board by PC Engines
Message-ID: <20191005023847.0fdd25d7@x2000>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

In the following patch is the board configuration and a default
defconfig for the apu2 board by PC Engines (https://pcengines.ch/apu2.htm).

With this defconfig, the system boots, redirects all output (kernel +
getty) to the serial output and recognizes both the ethernet controller
as well as the mSATA SSD.

This is my first custom board configuration, please let me know if I
need to do something differently. The configuration is based on this
blogpost by Tony Arkles:

http://www.better-bsp.com/blog/2017/03/02/buildrooting-for-apu2/

Cheers,
Danilo


Danilo Bargen (1):
  board/pcengines/apu2: add config

 DEVELOPERS                        |  4 +++
 board/pcengines/apu2/isolinux.cfg |  6 ++++
 board/pcengines/apu2/linux.config | 51 +++++++++++++++++++++++++++++++
 board/pcengines/apu2/readme.txt   | 40 ++++++++++++++++++++++++
 configs/pcengines_apu2_defconfig  | 16 ++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 board/pcengines/apu2/isolinux.cfg
 create mode 100644 board/pcengines/apu2/linux.config
 create mode 100644 board/pcengines/apu2/readme.txt
 create mode 100644 configs/pcengines_apu2_defconfig

-- 
2.23.0
