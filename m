From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Dec 2015 23:48:23 +0100
Subject: [Buildroot] [PATCH] busybox: add another upstream patch to fix
	unzip
In-Reply-To: <1449001829-26507-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 1 Dec 2015 21:30:29 +0100")
References: <1449001829-26507-1-git-send-email-arnout@mind.be>
Message-ID: <87egf4eabs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > 0002-unzip.patch which was added in 69516e0 to fix a segmentation
 > fault in the gunzip applet. However, it introduced a new issue that
 > made the unzipping of some files fail.

 > Add an upstream patch that fixes this new issue.

 > Fixes #8501.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Jason Rush <rush0033@hotmail.com>
 > ---
 > Jason, could you apply this patch to your buildroot tree, rebuild
 > busybox, and add your Tested-by if it solves the issue?

Committed after changing the subject to use (g)unzip, thanks.

I'll also cherry pick it for the 2015.11.x branch.

-- 
Bye, Peter Korsgaard
