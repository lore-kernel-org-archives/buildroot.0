From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 18 Dec 2007 00:49:27 +0200 (EET)
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
	<FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
	<6E89F2D1-2F8C-4F77-ADA8-2727407BBE6C@oregonstate.edu>
	<4766A061.7060308@promwad.com>
	<85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
Message-ID: <47635.127.0.0.1.1197931767.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> Of course, I can't get a 2.6.23 kernel to even boot at all, but that
> may be the same toolchain issues. My 2.6.21.6 kernel seems to be
> working ok

As I understood 2.6.23 is not bootable at all? Is it differs by size from 2.6.21.6 built by
correct toolchain?

I have not bootable 2.6.23 kernel image of 4MB built by svn toolchain and
the same kernel built by toolchain of 1O Oct 2007 is ok and is only 1.2MB

May be 2.18 binutils used in svn buildroot has some issues.

Definitely svn ARM buildroot has some issues. Need to investigate more.

Regards,
Ivan
