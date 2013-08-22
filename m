From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 22 Aug 2013 11:42:11 +0300
Subject: [Buildroot] initrd isn't needed for iso9660 when initramfs is
	used
In-Reply-To: <5215A80A.9070006@mind.be>
References: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
 <5215A80A.9070006@mind.be>
Message-ID: <CADwac6BN+Vuti_jpvH8otsxygN7dnE=yd6Sv409HTaLQEkCdPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

 Why do you want to use iso9660 with an initramfs? initramfs is only really
> useful for boat loaders that have a problem with passing an initrd, e.g.
> network boot.
>

Can't give you a real answer for that :)
I was basically playing around with a few things and didn't understand why
initrd was always included.
Feel free to disregard this patch.

Good day,
Assaf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130822/4b298588/attachment-0001.html>
