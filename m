From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jun 2012 22:14:26 +0200
Subject: [Buildroot] [PATCH] igh-ethercat: use release tarball instead
	of mercurial branch
In-Reply-To: <1340801191-8162-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 27 Jun 2012 14:46:31 +0200")
References: <1340801191-8162-1-git-send-email-arnout@mind.be>
Message-ID: <87obo45x7h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The Mercurial branch may change, which leads to
 Arnout> non-reproducible builds.  So download a released version
 Arnout> instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
