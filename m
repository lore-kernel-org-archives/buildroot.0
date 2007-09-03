From: Rouslan Solomakhin <rouslan@solomakhin.net>
Date: Mon, 3 Sep 2007 11:22:58 -0500 (CDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
References: <20070903062608.3D391A65E5@busybox.net>
	<20070903140903.GA4518@aon.at>
	<002d01c7ee36$f93df3a0$0402a8c0@atmel.com>
Message-ID: <60171.24.207.255.59.1188836578.squirrel@box240.bluehost.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> On Sun, Sep 02, 2007 at 11:26:08PM -0700, ulf at uclibc.org wrote:
> Have been pondering on the larger question for some time.
> How do we decide when to trust patches like this?

Sorry the patch didn't work for you. It solved the problem in my case, for
whatever reason.

Regarding trusting patches: maybe apply them in a temporary copy of the
tree and try to compile it? That would show any patches that break
anything.

Regards,
Rouslan
