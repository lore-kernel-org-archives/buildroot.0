From: Anders Darander <anders.darander@gmail.com>
Date: Fri, 18 Dec 2009 09:49:23 +0100
Subject: [Buildroot] [Bug 757] U-Boot: mkimage cannot be installed using
	external toolchain
In-Reply-To: <87zl5g3dlq.fsf@macbook.be.48ers.dk>
References: <bug-757-163@https.bugs.busybox.net/>
	<20091209102836.8A5177776F@busybox.osuosl.org>
	<2c9a759f0912172332wb40a41fm4b79427ff40ce11d@mail.gmail.com>
	<20091218085307.4fd6de27@surf> <87zl5g3dlq.fsf@macbook.be.48ers.dk>
Message-ID: <2c9a759f0912180049i63ed7f4dk7daa381f2655684b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 18, 2009 at 09:12, Peter Korsgaard <jacmet@uclibc.org> wrote:
> ?Thomas> I think the patch is ok to solve the immediate problem. But since
> ?Thomas> mkimage is a host tool, I would rather prefer changing the u-boot
> ?Thomas> Makefile.in to install mkimage to $(HOST_DIR)/usr/bin.
>
> True. I'll fix that now.

Ok.

I was on my way to create a patch, but then I'll let you fix it.

Regards,
Anders
