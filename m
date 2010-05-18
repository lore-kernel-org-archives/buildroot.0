From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 May 2010 14:16:55 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	2010-05-15-fixes
In-Reply-To: <87tyq5xw1o.fsf@macbook.be.48ers.dk>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	<87tyq5xw1o.fsf@macbook.be.48ers.dk>
Message-ID: <20100518141655.5b1519fa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 May 2010 13:56:51 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I wanted to pull this, but that's not what I got:
> 
> E.G. the branch also contained your older pull request, including the
> avahi ipv6 dependency that I NACKed.
> 
> Could you fix that and send a new pull request, please?

Argh, yes, of course. In fact, it's because I started my second branch
on top of the first, because some of the fixes of the second branch
depend on fixes on the first branch.

The easiest is probably that I merge both branches, get rid of the
unwanted Avahi IPv6 fix, and send a new pull request for the whole
thing. Would that be ok for you ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
