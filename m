From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 May 2012 21:19:06 +0200
Subject: [Buildroot] [PATCH] heirloom-mailx: run makeconfig in configure
	step
In-Reply-To: <1336902259-31422-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 13 May 2012 11:44:18 +0200")
References: <1336902259-31422-1-git-send-email-arnout@mind.be>
Message-ID: <874nri1sgl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The heirloom-mailx Makefile runs makeconfig if this has not been done
 Arnout> before.  In a parallel build, this means makeconfig may be run several
 Arnout> times in parallel because there are two targets that depend on makeconfig.
 Arnout> See for instance
 Arnout> http://autobuild.buildroot.net/results/d24854be69961f71db189f9d804d4bd2cfa078da

Committed, thanks.

-- 
Bye, Peter Korsgaard
