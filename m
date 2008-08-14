From: Christopher Taylor <chtaylo3@gmail.com>
Date: Thu, 14 Aug 2008 15:56:33 -0400
Subject: [Buildroot] GDB attempting to apply patches severla times
In-Reply-To: <2590773a0808141245y57fe1166n3d1646ab285b9824@mail.gmail.com>
References: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
	<2590773a0808141245y57fe1166n3d1646ab285b9824@mail.gmail.com>
Message-ID: <2590773a0808141256m12ee7203i5597833fa132c05@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Should have mentioned that it looks like it may have something to do
> with how the gdb.mk file is layed out and buildroot references it.
> Specifically, the section below from the gdb.mk file:

does the attached patch work for anyone besides me?

-Chris
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gdb.mk.patch
Type: text/x-patch
Size: 555 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080814/42770e45/attachment.bin 
