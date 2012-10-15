From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Oct 2012 09:29:20 +0200
Subject: [Buildroot] [PATCH] pkg-infra: correct the source name for
	host-only packages
In-Reply-To: <1350227854-6823-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 14 Oct 2012 17:17:34 +0200")
References: <1350227854-6823-1-git-send-email-arnout@mind.be>
Message-ID: <87obk4xkfj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Host-only package that don't define their <PKG>_SOURCE variable would
 Arnout> default to host-<pkg>-<version>.tar.gz.  It's more logical to remove
 Arnout> the host- prefix in this case.

 Arnout> This problem is most apparent with host-only packages downloaded from
 Arnout> version control, because they never define <PKG>_SOURCE.

 Arnout> Reported by Thomas Petazzoni and initial analysis by Luca Ceresoli.

Committed, thanks.

-- 
Bye, Peter Korsgaard
