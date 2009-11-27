From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Nov 2009 19:13:49 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <op.u32e97xjyqa4qb@jap-lappis> (Joachim Pihl's message of "Fri\,
	27 Nov 2009 19\:07\:09 +0100")
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk> <op.u32e97xjyqa4qb@jap-lappis>
Message-ID: <87k4xb6dk2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

[Please keep communication on the list instead of mailing me directly]

 >> Notice that your kernel headers version doesn't need to be the same as
 >> the kernel version you're using.

 Joachim> Noted. Tried punching in 2.6.27.x, that failed miserably, but
 Joachim> 2.6.27.39  worked - all the way up to the next hiccup:

Failed in what way? Please provide more details so we can fix the
problem if there is one.

 Joachim> OProfile does not want to build, and a brief search in the
 Joachim> config menus didn't reveal any options containing "bfd". As
 Joachim> far as I could tell from the OProfile pages, it should work
 Joachim> for the PXA processors?

The oprofile package hasn't seen any updates in a very long time (and I
don't use it myself), so chances are that it is broken.

I'll take a look now.

-- 
Bye, Peter Korsgaard
