From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 25 May 2009 10:44:34 +0200
Subject: [Buildroot] [git commit] xserver: mark as broken on avr32
In-Reply-To: <87ws85egn9.fsf@macbook.be.48ers.dk>
References: <20090519183052.C8CC77787B@busybox.osuosl.org>
	<20090525100303.6e1597aa@hcegtvedt.norway.atmel.com>
	<87ws85egn9.fsf@macbook.be.48ers.dk>
Message-ID: <20090525104434.4f6245f4@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 May 2009 10:22:18 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
> 
>  Hans-Christian> Why? Could we please type a bit more descriptive
>  Hans-Christian> commit messages?
> 
> We had some discussion about it on the list leading up to this:
> 
> http://lists.busybox.net/pipermail/buildroot/2009-May/027492.html
> 
> I should indeed probably have pasted that error message in the commit.
> 

Ah, so xserver needs some AVR32 stuff in the compiler.h file, thanks.

-- 
Best regards,
Hans-Christian Egtvedt
