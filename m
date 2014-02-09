From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Feb 2014 11:03:59 +0100
Subject: [Buildroot] [PATCH 2/3] infra: replace BUILDROOT_DL_DIR with
	BR2_DL_DIR.
In-Reply-To: <1391527132-20103-2-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 4 Feb 2014 16:18:51 +0100")
References: <1391527132-20103-1-git-send-email-arnout@mind.be>
 <1391527132-20103-2-git-send-email-arnout@mind.be>
Message-ID: <87k3d438mo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > To make the naming consistent (all user-visible options should be
 > prefixed BR2_).

 > An entry is added to Makefile.legacy to warn users who have set
 > BUILDROOT_DL_DIR but not BR2_DL_DIR.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks. Lets hope Thomas' has updated his autobuilder script
to also set BR2_DL_DIR.

-- 
Bye, Peter Korsgaard
