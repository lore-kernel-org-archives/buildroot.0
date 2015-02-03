From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 2 Feb 2015 20:18:02 -0600
Subject: [Buildroot] Driver for C-Media Electronics,
	Inc. CM106 based usb audio device?
Message-ID: <CAFGceHExxZ36zvUa1-7ky_8bqSb50D1GTnogMrOWrcZLJ6mwMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again all, does anyone know where I can get the driver/kernel modules
for the c-media electronics CM-106 usb sound card and how to set up fader,
, balance, and volume controls and whatnot on it in buildroot? I will be
running this card on a raspberry pi b+, which as we all know the built in
audio is just plain DREADFUL sounding with all those hisses and pops, and
this card sounds MUCH better (I'm listening to my tunes through it on my
main Ubuntu-based box as I type!), and is inexpensive.

the output of lsusb is here:
Bus 005 Device 002: ID 0d8c:0102 C-Media Electronics, Inc. CM106 Like Sound.

According to this link,
https://github.com/Pivosgroup/buildroot-linux-kernel-m3/blob/master/sound/usb/usbaudio.c
the device has four 16 bit registers or something like that.

Does this link btw contain the driver, and if yes, how is it compiled?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150202/7fd4ef2b/attachment.html>
