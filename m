From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:09:51 +0100
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: fix
	whitespace
In-Reply-To: <1452304660-12393-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 9 Jan 2016 02:57:40 +0100")
References: <1452304660-12393-1-git-send-email-arnout@mind.be>
Message-ID: <87r3hl425c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The apply-patches.sh script was using a mix of tabs and spaces, and
 > some three-space indentation. Normalize everything to four-space
 > indentation.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
