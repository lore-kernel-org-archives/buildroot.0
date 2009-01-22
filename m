From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 22 Jan 2009 20:01:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
In-Reply-To: <874ozrpv1k.fsf@macbook.be.48ers.dk>
References: <20090122075324.D71DA765E9@busybox.osuosl.org>
	<874ozrpv1k.fsf@macbook.be.48ers.dk>
Message-ID: <1232650901.5311.15.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-22 klockan 10:08 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-22 07:53:24 +0000 (Thu, 22 Jan 2009)
>  ulf> New Revision: 24952
> 
>  ulf> Log:
>  ulf> Add simple way to enable most (but not all) targets for testing purposes
> 
> Please don't do that. That's not a common use case. If you want to
> test everything, just use make allyesconfig instead.

I agree that it is not a common test case, but I don't want to
test everything as well at this point.

?It is a help to test, but I agree it should be removed 
before the final distribution, or significantly improved.

Right now, It saves a lot of time in the testing process.

Easiest is just to replace it with an empty file when
the distribution is made.

?
> 
> Having such an explicit list hidden away under target/generic is bound
> to get out of sync with packages/ in no time.
> 

Yes, but it is fairly easy to see what is missing
if you do  a make menuconfig.



BR
Ulf Samuelsson
