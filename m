From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Dec 2012 17:14:27 -0800
Subject: [Buildroot] [PATCH] pkg-infra: add <pkg>-extract and
	<pkg>-patch targets to OVERRIDE support
In-Reply-To: <1354835760-9357-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 7 Dec 2012 00:16:00 +0100")
References: <1354835760-9357-1-git-send-email-arnout@mind.be>
Message-ID: <874njy1x58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

Hi,

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The legal-info target (and possibly others as well) depends on
 Arnout> <pkg>-extract to make sure the license file is available.  However,
 Arnout> when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
 Arnout> doesn't exist.

 Arnout> To solve this, we add <pkg>-extract which depends on <pkg>-rsync.
 Arnout> While we're at it, we do the same for <pkg>-patch.  That avoids the
 Arnout> same problem in the future if something starts depending on
 Arnout> <pkg>-patch.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Arnout> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
