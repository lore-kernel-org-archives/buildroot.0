From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 20 May 2017 20:06:40 +0300
Subject: [Buildroot] [PATCH 0/3] Bump bsp versions for linksprite and
	orange-pi
Message-ID: <20170520170643.19786-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

These patches update bsp versions for pcduino and orange-pi boards:
- bump u-boot to 2017.03
- bump kernel to 4.11

P.S.
I tested builds on orange-pi-one and pcduino-lite-wifi boards.
However I don't have orange-pi-pc in my board zoo,
so build test only.

Regards,
Sergey

linksprite_pcduino_defconfig |    8 ++++----
orangepi_one_defconfig       |    6 +++---
orangepi_pc_defconfig        |    6 +++---
3 files changed, 10 insertions(+), 10 deletions(-)
