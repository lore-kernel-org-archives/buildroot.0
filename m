From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:09:43 +0200
Subject: [Buildroot] [RESEND/PATCH] Git/Svn downloaders
Message-ID: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Now that Buildroot 2010.08 is out (nice work on the release by the way!), I've
rebased my patchset for Git and Subversion downloaders on the latest HEAD.

I've also renamed SPIDER_MODE to DL_MODE, which better represents what this
variable is for (per Thomas' recommendation).

Regards,
- Maxime
