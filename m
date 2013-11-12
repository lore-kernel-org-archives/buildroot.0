From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 23:06:57 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
	in favor of pkgdir
In-Reply-To: <52824AB9.6070907@mind.be> (Arnout Vandecappelle's message of
 "Tue, 12 Nov 2013 16:35:21 +0100")
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina> <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
 <5282302C.7000005@mind.be>
 <CAAXf6LVJ+0c2Qgo7P1wNWejtvRm8meq_3vjwjJnuMBAoVbJE8A@mail.gmail.com>
 <52824AB9.6070907@mind.be>
Message-ID: <877gcd46m6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

>>> As I mentioned before, I would prefer to not reuse the same name with a
>>> different meaning, because it may confuse users who have custom
>>> modifications that rely on that variable. So instead I'd remove the
>>> <foo>_DIR completely (so that it's pretty clear that this variable is empty
>>> if anybody still uses it), and instead use e.g. <foo>_BR_DIR for this
>>> purpose.
>> 
>> In that case I would prefer something like <foo>_PKG_DIR, instead of BR.

>  OK.

>  But for consistency with BUILDDIR and SRCDIR, I'd prefer PKGDIR.

Or <foo>_BUILD_DIR / _SRC_DIR.

</bikeshed>

-- 
Bye, Peter Korsgaard
