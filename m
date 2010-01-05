From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Wed, 6 Jan 2010 00:37:48 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <304874.32181.qm@web58207.mail.re3.yahoo.com>
References: <4B43A464.70405@free.fr>
	<304874.32181.qm@web58207.mail.re3.yahoo.com>
Message-ID: <OFA2ED1E32.51132C4A-ONC12576A2.0081B629-C12576A2.0081CDDE@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Steve, this was the right path.

> The old mount point for usbfs was /proc/bus/usb, now it is /dev/bus/
> usb. Same filesystem. But someone has to mount it in either place. 
> libusb uses this filesystem, but libusb is not required for usb device 
access.
> 
> Regards, Steve
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100106/e7236949/attachment.htm>
