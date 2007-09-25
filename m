From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Sep 2007 21:50:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
In-Reply-To: <1190737019.19731.80.camel@elrond.atmel.sweden> (Ulf Samuelsson's
	message of "Tue\, 25 Sep 2007 18\:16\:59 +0200")
References: <20070925144527.1DC94A4D18@busybox.net>
	<1190737019.19731.80.camel@elrond.atmel.sweden>
Message-ID: <87tzpimsng.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf@atmel.com> writes:

Hi,

 >> Log:
 >> Don't limit 2006 version to Atmel targets (why?)

 Ulf> Just tried to be non-intrusive...
 Ulf> The "normal" version is buggy, and this works for me,
 Ulf> but I have no targets for other architectures.

Ok, but with the dependency noone else could test it. I only
discovered by chance that there actually was a never version.

 Ulf> It may make sense to make it the default,
 Ulf> but someone else needs to test that.

I think we should actually use
ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.1.0.tar.bz2 instead
- That seems to be the latest release instead of some random snapshot.

-- 
Bye, Peter Korsgaard
