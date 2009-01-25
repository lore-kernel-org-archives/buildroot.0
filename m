From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 21:56:56 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <20090125100722.GA14740@zelow.no> (Thomas Lundquist's message of
	"Sun\, 25 Jan 2009 11\:07\:22 +0100")
References: <20090123230218.44A1376564@busybox.osuosl.org>
	<87ocxxi57i.fsf@macbook.be.48ers.dk> <20090125100722.GA14740@zelow.no>
Message-ID: <87tz7ndrzb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

 Thomas> On Sat, Jan 24, 2009 at 07:33:05AM +0100, Peter Korsgaard wrote:
 >> 
 >> That looks odd. Why not simply always install the development stuff to
 >> target, and simply rely on the BR2_HAVE_DEVFILES setting to clean it
 >> up if it isn't desired?

 Thomas> I have to admit I'm a bit sceptic to this. It presumes that
 Thomas> the install scripts behave and we're able to get rid of all
 Thomas> overhead when we want to.

True, but we do that already to a certain extent (E.G. the
Makefile.autotools.in stuff using make install-exec / install-strip),
and we've had (have?) quite some bugs with packages not installing the
same with install-strip versus install-exec or not picking up the
correct strip program and/or arguments.

-- 
Bye, Peter Korsgaard
