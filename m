From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 25 Jan 2009 11:07:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <87ocxxi57i.fsf@macbook.be.48ers.dk>
References: <20090123230218.44A1376564@busybox.osuosl.org>
	<87ocxxi57i.fsf@macbook.be.48ers.dk>
Message-ID: <20090125100722.GA14740@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 24, 2009 at 07:33:05AM +0100, Peter Korsgaard wrote:
> 
> That looks odd. Why not simply always install the development stuff to
> target, and simply rely on the BR2_HAVE_DEVFILES setting to clean it
> up if it isn't desired?

I have to admit I'm a bit sceptic to this. It presumes that the 
install scripts behave and we're able to get rid of all overhead when
we want to.



Thomas.
