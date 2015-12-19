From: Steve Morris <morris@buinea.com>
Date: Sat, 19 Dec 2015 12:11:26 -0800
Subject: [Buildroot] Trouble bringing up Raspberry Pi
Message-ID: <20151219201126.GA9718@buinea.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm having some trouble bringing up a Raspberry Pi B+ and was hoping
someone could point me in the right direction. I have successfully used
buildroot on x86 machines in the past and managed to get them to run.

I'm using a Raspberry Pi B+,with a USB keyboard, ethernet and HDMI
output. The system works properly using a Raspbian image.

I'm just trying to bring up a minimal system and then go from there.

I'm using buildroot-2015.11.1 and followed the readme.txt under
board/raspberrypi. I've tried both the volatile and persistent rootfs
and find the instruction insufficient to get a working system.

After the first failed attempt, I set 
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
which allowed me to boot the machine  and I'm now able to log in via
SSH/dropbear, but I don't always get a login prompt, and the keyboard
has no effect even though it's found by the system and I
 get a message when I unplug it or plug it back in again.

I've tried adding items to cmdline.txt from various websites, 
but still don't have any keyboard input.

Are there other missing notes like the one about enabling MDEV which
will allow me to log in to the console?

Perhaps a working .config for the Pi B+ would set me in the right
direction.

Thanks,

Steve Morris
