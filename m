From: Leonid <Leonid@a-k-a.net>
Date: Thu, 11 Oct 2007 00:14:07 -0700
Subject: [Buildroot] Mmap failure: Value too large for defined data type
In-Reply-To: <Pine.LNX.4.64.0710100447510.10223@localhost.localdomain>
References: <Pine.LNX.4.64.0710100447510.10223@localhost.localdomain>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F57@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

I'm working on at91rm9200 (Linux 2.6.16) and I'm trying to map last 64K
of memory (CPU registers). I get an error:

mmap() error in xio_linux.c: Value too large for defined data type
xio_linux.c:134 Ifc mmap_entry_2 start 0xFFFF0000 size 0x00010000

Frankly, I don't see any overflow here and besides it used to work when
I have compiled using glibc based toolchain. Now I started to use uClibc
toolchain from buildroot - and here I am.

Any suggestions?

Thanks,

Leonid.
