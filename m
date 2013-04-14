From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Apr 2013 23:22:08 +0200
Subject: [Buildroot] [PATCH] sysvinit: fix linking of sulogin with
	-lcrypt
In-Reply-To: <1363133138-32481-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 13 Mar 2013 01:05:38 +0100")
References: <513FC280.5040008@mind.be>
 <1363133138-32481-1-git-send-email-arnout@mind.be>
Message-ID: <87k3o4olj3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The LCRYPT variable is no longer used; use SULOGINLIBS instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
