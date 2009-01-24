From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 24 Jan 2009 11:57:36 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/package/multimedia/mpg123
In-Reply-To: <87r62tgfme.fsf@macbook.be.48ers.dk>
References: <20090124101510.62459769CC@busybox.osuosl.org>
	<87r62tgfme.fsf@macbook.be.48ers.dk>
Message-ID: <1232794656.5311.130.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-24 klockan 11:31 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-24 10:15:05 +0000 (Sat, 24 Jan 2009)
>  ulf> New Revision: 24999
> 
>  ulf> Log:
>  ulf> Add fix to mpg123 for bug in ARM release toolchain causing segment violation, bug reported to gcc bugzilla
> 
> So the toolchain patch you checked in didn't fix the issue? Should it
> then be reverted?

It fixes a similar problem, but apparently not my problem.
Why revert? 
do we want really want to run into the problem which it fixes?

BR
Ulf Samuelsson.
