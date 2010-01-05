From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 05 Jan 2010 21:43:16 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <OFCD96771F.A80BB547-ONC12576A2.0049085F-C12576A2.00493480@mentat.hu>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
	<4B42F7A6.1010100@free.fr>
	<OF42E07C52.E79A00B9-ONC12576A2.00330B26-C12576A2.003321B3@mentat.hu>
	<4B433270.6010806@free.fr>
	<OFCD96771F.A80BB547-ONC12576A2.0049085F-C12576A2.00493480@mentat.hu>
Message-ID: <4B43A464.70405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

peter.stosz at mentat.hu a ?crit :
>
> > > open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
> > > such file or directory)
> > seems to be the problem (compare it with "strace us" on your PC)
> > Do you have a directory named /dev/bus/usb/ ??
> No, but found /proc/bus/usb, isn't is enought?
maybe not but I don't know libusb enough to give you more tips :-(

Julien
