From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 13 Aug 2009 23:30:32 +0200
Subject: [Buildroot]
	=?utf-8?q?Building_Linux_system_-_Beginner=E2=80=8F?=
In-Reply-To: <BAY136-W1229649F0F8F25E88E8B70CE050@phx.gbl>
References: <BAY136-W1229649F0F8F25E88E8B70CE050@phx.gbl>
Message-ID: <5f2b60908131430yc02f01if52bd71e90e3d0b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/8/13 Raed Abu-Sanad <raedbenz@hotmail.com>:
> Hi,,
> I found your email in the mailing list, and you seemed to me quite
> experienced in buidlroot, I have decided to send you my inquiry, and i would
> be thankful if you reply me back.
> i have put my questions before on the mailing list but no response yet.

Please continue to use the mailing list instead of sending private
emails, even if you not always get replies.

> What i have done so far is:
> I managed to build the root filesystem "rootfs.i686.ext2" and kernel
> bzImage.
> My questionsd are:
>
> 1- how do use this format of filesystem "rootfs.i686.ext2" ??? usually what
> i know the rootfs consists of multiple directories or an archive and you
> untar it to your target device, e.g. USB flash or HDD partition and you get
> the directories..

If you want a tar archive rootfs from Buildroot, select "Target
filesystem options -> tar the root filesystem". rootfs.i686.ext2 can
be loop mounted on the development host so that you can see the files,
and you can use it as a initrd on the target if you like. But if you
are using USB flash or HDD I guess the tar archive rootfs is the
easiest way to go.

> 2- I also enabled grub in the filesystem section of the buildroot
> configuration (when i ussued make menuconfig) in the beginning. how can i
> use this grub to install a bootloader in a? USB?
> what i want to do is to put the rootfs and kernel with GRUB bootloader to
> CF/USB flash and run linux.
> How can i do that?

I have little experience with GRUB and no experience with
GRUB+Buildroot. Maybe someone else can help.

> again, I would be thankful if you could reply me.
> Thanks

No problem! Just remember to use the list :-)

Best regards,
Bj?rn Forsman
