From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Jul 2011 15:02:39 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: Add missing dependency of
	tst_uuid.o on uuid.h
In-Reply-To: <1310991099-3829-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 18 Jul 2011 14:11:39 +0200")
References: <1310991099-3829-1-git-send-email-arnout@mind.be>
Message-ID: <87aacb7ndc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The missing dependency used to break parallel builds.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks. What is the upstream status of this patch?

-- 
Bye, Peter Korsgaard
