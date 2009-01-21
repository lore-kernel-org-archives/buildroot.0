From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 21 Jan 2009 08:54:18 -0600
Subject: [Buildroot] buildroot with glibc instead of uclibc because
	i	need some libraries not provided for uclibc
In-Reply-To: <87k58osp9t.fsf@macbook.be.48ers.dk>
References: <OF5368AD77.8DC10895-ONC1257545.004F0B48-C1257545.004F71EE@gidi.it>
	<87k58osp9t.fsf@macbook.be.48ers.dk>
Message-ID: <20090121145418.GA10568@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> No such thing exists. You should in theory be able to do it with the
> external toolchain support, but I've never heard from anyone trying
> it.
> 
I was the one who originally put external toolchain support into buildroot
specifically to use glibc instead of uClibc via an external toolchain.
That said, buildroot does not support building glibc or a glibc toolchain
within the buildroot framework.

-Steve
