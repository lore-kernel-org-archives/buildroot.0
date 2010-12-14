From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 14 Dec 2010 16:54:00 +0200
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <20101214154228.51a969b6@surf>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
Message-ID: <AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Config and boot attached (compressed, I hope you don't mind). I do see this
in the boot logs:


VFS: Mounted root (nfs filesystem) on device 0:12.
Freeing init memory: 152K
Populating /dev using udev: done
Initializing random number generator... read-only file system
detected...done
Starting network...
ip: RTNETLINK answers: File exists
GPIO_M: init
usbcore: registered new interface driver fjveincam
v2.21:USB PalmVeinCam driver
net eth0: MAC Address: 00:11:22:33:44:57
*/bin/sh: can't access tty; job control turned off*


The line before comes from some S90* init.d script (this is OK). I don't
understand where does it come from.

On Tue, Dec 14, 2010 at 4:42 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Tue, 14 Dec 2010 16:38:47 +0200
> Diego Iastrubni <diegoiast@gmail.com> wrote:
>
> > Still no go. I do see the dev directory filled, and still login prevents
> me
> > from logging (both root and default, which should have an empty value.
> > correct?).
>
> What is your .config ?
>
> Do you see a login prompt ? Could you post your boot log, please ?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/27e5322b/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: boot.txt.gz
Type: application/x-gzip
Size: 3563 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/27e5322b/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.gz
Type: application/x-gzip
Size: 3815 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/27e5322b/attachment-0003.bin>
