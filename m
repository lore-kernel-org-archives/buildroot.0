From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:40:47 +0100
Subject: [Buildroot] [PATCH] Buildroot uClibc-0.9.29 patches not present
	in	uClibc-0.9.30
In-Reply-To: <1229806548.30378.10.camel@linux-yrgm.site> (Ulf Samuelsson's
	message of "Sat\, 20 Dec 2008 21\:55\:48 +0100")
References: <1229806548.30378.10.camel@linux-yrgm.site>
Message-ID: <87bpv38c0w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> uClibc-0.9.30 does not build due to uClibc-locale-20081111-*.tgz not
 Ulf> beeing available.

 Ulf> I guess this is the culprit:
 Ulf> ------------------------------------------------------------------------
 Ulf> r23997 | aldot | 2008-11-11 12:05:57 +0100 (Tue, 11 Nov 2008) | 3 lines

 Ulf> - update recommendation for pregenerated locales.
 Ulf> - update name of locale-tarball. We will retroactively fill them in, eventually


 Ulf> It is supposed to be on http://www.uclibc.org/downloads" but
 Ulf> is not there.

There was a thread about this on the uclibc list recently:

http://lists.uclibc.org/pipermail/uclibc/2008-December/041624.html

It would be better to not use the pregenerated locales at all. I have
added an option for this in r24516 (from Bernhard's tree).

-- 
Bye, Peter Korsgaard
