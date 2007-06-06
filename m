From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 6 Jun 2007 10:09:17 +0200
Subject: [Buildroot] problem with openssh
In-Reply-To: <e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
References: <e19d85410706050700s69e06497gef032dddb6eef9c9@mail.gmail.com>
	<e19d85410706051935j42739782ndf1307022f2e9031@mail.gmail.com>
Message-ID: <20070606100917.e0724deb.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> i found a fix for openssh, and i might try it with samba as well.
> although its not a good fix (imo) but it works. i simply added
> "--static" to LDFLAGS in openssh.mk

Hi,
Did you try uClibc-0.9.28 ?
It works for me with gcc-4.0.3 and binutils-2.17 on arm XScale.
But it certainly works also for many people with uClibc-0.9.29.
The problem must be somewhere else.

Philippe
