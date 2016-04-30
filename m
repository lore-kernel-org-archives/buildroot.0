From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 30 Apr 2016 19:57:19 +0200
Subject: [Buildroot] Bluetooth BCM20702A1
Message-ID: <5724F1FF.7070408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
Does buildroot provide the firmware for this common USB/BT dongle?
I'm running the latest version on an RPi3.
Here the output of dmesg:

> [    3.126672] usb 1-1.2: Product: BCM20702A0
> [    4.435485] Bluetooth: hci0: BCM20702A
> [    4.442507] Bluetooth: hci0: BCM20702A1 (001.002.014) build 0000
> [    4.442572] bluetooth hci0: Direct firmware load for 
> brcm/BCM20702A1-0a5c-21e8.hcd failed with error -2
> [    4.442579] Bluetooth: hci0: BCM: Patch 
> brcm/BCM20702A1-0a5c-21e8.hcd not found

and here lsmod:

> # lsmod | grep bt
> btusb                  27112  0
> btrtl                   3573  1 btusb
> btintel                 6072  1 btusb
> btbcm                   5627  1 btusb
> bluetooth             315678  7 btusb,btrtl,btintel,btbcm

The dongle works fine with Raspbian Jessie.
If you need other information, please feel free to ask!

Thanks in advance
Marco
