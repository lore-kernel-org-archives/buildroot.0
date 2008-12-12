From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 12 Dec 2008 11:35:00 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
In-Reply-To: <87ej0dr8j5.fsf@macbook.be.48ers.dk>
References: <20081212092938.291973C2E4@busybox.net>
	<87iqppr9lp.fsf@macbook.be.48ers.dk>
	<20081212111450.7af4120c@hcegtvedt>
	<87ej0dr8j5.fsf@macbook.be.48ers.dk>
Message-ID: <20081212113500.0c883f28@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Dec 2008 11:29:34 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> Shouldn't this then be $(MAKE1) ?
>  >> 
> 
>  Hans-Christian> Not needed, it is safe to parallel build the proto
> stuff. The problem Hans-Christian> is that the all: rule does not
> depend properly on proto.
> 
> Ok, it would probably be handy to add a small comment to explain why
> it's done like this.
> 

Okay, done in r24391.

-- 
Best regards,
Hans-Christian Egtvedt
