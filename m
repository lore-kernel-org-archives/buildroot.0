From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 23:21:34 +0100
Subject: [Buildroot] [PATCH] binutils: add upstream patch to fix
	--enable-install-libiberty flag
In-Reply-To: <1393193387-1777-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 23 Feb 2014 23:09:47 +0100")
References: <1393193387-1777-1-git-send-email-arnout@mind.be>
Message-ID: <87wqglmpw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Fixes http://autobuild.buildroot.org/results/1ea/1ea98985ce06dc1b7569ef5abe2fc13090fb5f3a
 > The upstream patch patches both configure.ac and configure, so we keep
 > that.

 > It is numbered 001 because it is an upstream patch, so it should come
 > before the buildroot patches.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
