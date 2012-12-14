From: Ted Wood <ted@fgh.co.uk>
Date: Fri, 14 Dec 2012 09:10:08 -0000
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <50CA4A8F.1050002@mind.be>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk> <50CA4A8F.1050002@mind.be>
Message-ID: <000701cdd9da$d299b8c0$77cd2a40$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> >  For an initrd, you should use a cpio filesystem rather than ext2:
> >
> >- ext2 adds overhead that is completely unnecessary for a ramdisk;
> >
> >- if you use anything else than static device management, the devtmps 
> >will not be mounted automatically by the kernel; the cpio filesystem 
> >adds a /init script that mounts it for you.
> >
> >  I thought this was now clearly explained in the manual, is it not?
> >

There is no reference to either cpio or devtmps in the manual.
