From: Will Newton <will.newton@gmail.com>
Date: Sun, 25 Oct 2009 11:54:48 +0000
Subject: [Buildroot] Nano runtime error
In-Reply-To: <4AE34C4D.9000108@ethertek.ca>
References: <4AE1582B.9050106@ethertek.ca> <4AE303B6.4090605@ethertek.ca>
	<87tyxozlsa.fsf@macbook.be.48ers.dk> <4AE34C4D.9000108@ethertek.ca>
Message-ID: <87a5b0800910250454m6f563d09rf5ec15946c7cbd5a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 24, 2009 at 6:49 PM, Dan Pattison <dan.pattison@ethertek.ca> wrote:
> Hello Peter and List,
>
> Sorry for my impatience. I realize this is no commercial support system, I
> stand corrected.
>
> Locals is not enabled in uclibc.

The error "can't resolve symbol '__ctype_b'" occurs when you build a
binary with a toolchain with locales support disabled and try and run
it with uClibc with locales support enabled.

I would try doing a full rebuild of toolchain and filesystem.
