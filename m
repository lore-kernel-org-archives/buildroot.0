From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:13 -0500
Subject: [Buildroot] [PATCH 00/44] Linux-firmware: mass addition of missing
	firmware blobs
Message-ID: <20170206202457.31527-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This rather large series of patches is here to add a bunch of missing firmware
blob options to the menuconfig.  I didn't go as far as to add crazy things
such as scsi controllers, and there are still several things missing, but I
feel like this is a good start!


Adam Duskett (44):
  linux-firmware: add emi 2|6 usb audio option
  linux-firmware: add emi 2|6m option
  linux-firmware: add korg121 audio device option
  linux-firmware: add mastro3 audio device
  linux-firmware: add soundblaster 16 option
  linux-firmware: add yamaha audio devices option
  linux-firmware: rename firmware_radeon to firmware_ati_radeon
  linux-firmware: add amd radeon option
  linux-firmware: add matrox graphics card option
  linux-firmware: add nvidia nouveau option
  linux-firmware: add g07007 mpeg-4 encoder option.
  linux-firmware: add samsung mfc video encoder/decoder option
  linux-firmware: add atheros qca61x4 bluetooth option
  linux-firmware: add atheros ar3011 bluetooth option
  linux-firmware: add atheros ar3012 bluetooth option
  linux-firmware: add texas instruments bluetooth option
  linux-firmware: add iwlwifi-5150 option
  linux-firmware: add mediatek mt7650 option
  linux-firmware: add wl125x option
  linux-firmware: add adaptec starfire ethernet option
  linux-firmware: add alteon acenic ethernet option
  linux-firmware: add broadcom tigen option
  linux-firmware: add chelsio t6 option
  linux-firmware: add intel e100 option
  linux-firmware: add kl5usb101 ethernet option
  linux-firmware: add myricom ethernet option
  linux-firmware: add netxen gigabit ethernet option
  linux-firmware: add slicoss alacritech isnic option
  linux-firmware: add sxg alacritech isnic option
  linux-firmware: add av7110 dvb option
  linux-firmware: add hauppauge nova-usb dvb option
  linux-firmware: add telgent 2300 dvb option
  linux-firmware: add siano mdtv dvb option
  linux-firmware: add computone serial device option.
  linux-firmware: add edgeport serial device option
  linux-firmware: add keyspan usaxxx serial adapter option
  linux-firmware: add keyspan pda serial adapter option
  linux-firmware: add comtrol rocketport 2 serial option
  linux-firmware: add ti usb 3410 serial interface option
  linux-firmware: add ti usb 5052 serial interface option
  linux-firmware: add connecttech whiteheat serial device option
  linux-firmware: t4fw bump to version 1.16.26.0
  linux-firmware: t5fw bump to version 1.16.26.0
  linux-firmware: fix typo in config file.

 package/linux-firmware/Config.in         | 221 +++++++++++++++++++++-
 package/linux-firmware/linux-firmware.mk | 315 ++++++++++++++++++++++++++++++-
 2 files changed, 523 insertions(+), 13 deletions(-)

-- 
2.9.3
