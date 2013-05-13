From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 May 2013 08:38:45 +0200
Subject: [Buildroot] [PATCH v2] libsigsegv: fix build on x86_64
	(probably others too)
In-Reply-To: <1368398765-21744-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 13 May 2013 00:46:05 +0200")
References: <1368397257-3061-1-git-send-email-arnout@mind.be>
 <1368398765-21744-1-git-send-email-arnout@mind.be>
Message-ID: <87txm7tmdm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The configure script doesn't detect that the target is posix-compliant
 Arnout> and tries to use a custom version of segfault analysis that actually
 Arnout> doesn't build. Most likely, it's because the configure script doesn't
 Arnout> support linux-3.x. Anyway, we can just tell configure that we're
 Arnout> posix-compliant.

Committed, thanks.

-- 
Bye, Peter Korsgaard
