From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 23:05:59 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
	in favor of pkgdir
In-Reply-To: <5282302C.7000005@mind.be> (Arnout Vandecappelle's message of
 "Tue, 12 Nov 2013 14:42:04 +0100")
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina> <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
 <5282302C.7000005@mind.be>
Message-ID: <87bo1p46ns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>  How is that hard?

>  I would do what we usually do for new policy: enforce it for new
> packages, but leave it alone for existing packages until someone grows
> tired of the inconsistency and sends a global fixup patch. That also
> has the advantage that we can still change our mind on the short term
> without needing to change things all over the place again.

>  That said, I think that using package/foo in the .mk file is a lot
> clearer than $(FOO_XXXDIR).

Agreed. We already have a bunch of magic variable names in BR, so lets
not enforce more than needed.

>>> <foo>_DL_DIR => same as before.
>> 
>> In general, I think the new variable names make sense.

>  +1.

+1

-- 
Bye, Peter Korsgaard
