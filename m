From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Fri, 17 Aug 2012 18:39:55 +0100
Subject: [Buildroot] Best way of building for unknown architecture
Message-ID: <760828.46392.bm@smtp116.mail.ukl.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

	Openembedded, T2 and NuttX seem to support arm7-m (cortex-m3)
	but I like buildroot. Is the best way of building to use Little
	endian generic and the GCC compiler or is it fairly easy to add
	a new architecture variant that I could possibly send a diff
	for later.

	Similarly is it easier to use the kernel patch config and kernel
	config options or is it fairly easy to add a Target
	architecture.

Thanks,

Kc

-- 
_______________________________________________________________________

'Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface'

(Doug McIlroy)
_______________________________________________________________________
