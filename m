From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 16 Oct 2012 00:03:55 +0200
Subject: [Buildroot] can't open /dev/ttyO2: No such file or directory
Message-ID: <CAAfyv35ct59po3tM7xfRH3-xWX0yL-Bs_yuh_XY2eMp5-iJp0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is not mainly related to BR bt maybe somebody facing same problems.
I have rootfs builded by BR (just busybox with external toolchain for
Cortex-A9).
I'm booting kernel 3.7-rc1 on pandaboard with devicetree on barebox.
Booting seems to be
fine till point when IMO getty is started. Then I get console full of :
can't open /dev/ttyO2: No such file or directory

Last messages snip:
[    2.023406]  mmcblk0: p1 p2
[    2.036499] ThumbEE CPU extension supported.
[    2.066894] clock: disabling unused clocks to save power
[    2.076354] VANA: disabling
[    2.079986] VDAC: disabling
[    2.086822] omap_hsmmc 480d5000.mmc: Failed to get debounce clk
[    2.093231] omap-dma-engine omap-dma-engine: allocating channel for 60
[    2.100097] omap-dma-engine omap-dma-engine: allocating channel for 59
[    2.107269] omap-dma-engine omap-dma-engine: freeing channel for 59
[    2.114349] omap-dma-engine omap-dma-engine: freeing channel for 60
[    2.121093] platform 480d5000.mmc: Driver omap_hsmmc requests probe deferral
[    2.128814] twl_rtc rtc.9: setting system clock to 2000-01-01
00:00:00 UTC (946684800)
[    2.219604] EXT3-fs (mmcblk0p2): error: couldn't mount because of
unsupported optional features (240)
[    2.375122] EXT2-fs (mmcblk0p2): error: couldn't mount because of
unsupported optional features (240)
[    2.612854] EXT4-fs (mmcblk0p2): mounted filesystem with ordered
data mode. Opts: (null)
[    2.621765] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    2.629394] Freeing init memory: 320K
[    2.808105] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered
Starting logging :OK
Initializing random number generator... done.
Starting network...
can't open /dev/ttyO2: No such file or directory
can't open /dev/ttyO2: No such file or directory
can't open /dev/ttyO2: No such file or directory

Any ideas?

Thanks,

mbe


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
