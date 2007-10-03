From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 3 Oct 2007 22:44:25 +0200
Subject: [Buildroot] Building libgcc with -G 0 options
In-Reply-To: <557489.49105.qm@web7903.mail.in.yahoo.com>
References: <557489.49105.qm@web7903.mail.in.yahoo.com>
Message-ID: <20071003204425.GF20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 03, 2007 at 06:09:26PM +0100, sathesh babu wrote:
>Hi,
>    I am using buildroot to build toolchain( GCC ver 3.4.3, binutil-1.15 and ucLibc-0.9.28, linux-2.6.18 kernel)  for MIPS processor.

Good luck. You're way outdated, retry with something vaguely recent.

>  While building the toolchain i enabled soft float option.

Fair enough.
>  I have written a loadble module ( which gets complie along with kernel) which does some floating point operation.

This is most likely broken by design. I'd seek advise on using FP in the
kernel on the kernel mailing list (or think about it for a second or search
the archives if you don't intend to delve into endless discussion on why
that's almost certainly wrong).
