From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 4 Sep 2007 09:39:54 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
References: <20070903062608.3D391A65E5@busybox.net>
	<20070903140903.GA4518@aon.at>
	<002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
Message-ID: <20070904073954.GA11701@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 03, 2007 at 04:29:55PM +0200, Ulf Samuelsson wrote:

>Have been pondering on the larger question for some time.
>How do we decide when to trust patches like this?

This one was obviously incorrect. Please don't apply patches that are
not 100% clean, especially not if somebody else is still talking about
it with the submitter (or if the patch is obviously incorrect).
There are only a very few exceptions like big patches (xorg for one) or
being nice and to provide stubs for somebody else to base on (like
mutt).
