From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:57:28 +0100
Subject: [Buildroot] [PATCH] configs/imx6sabre: Create distinct
 pre-processed mkimage config files
In-Reply-To: <1542912921-28407-1-git-send-email-festevam@gmail.com> (Fabio
 Estevam's message of "Thu, 22 Nov 2018 16:55:21 -0200")
References: <1542912921-28407-1-git-send-email-festevam@gmail.com>
Message-ID: <87y39fvksn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Commit 0c4bccf9e882 ("configs/imxsabre: Fix U-Boot parallel build issue")
 > tried to fix the parallel build issue, but the real fix was developed
 > later by Trent Piepho later, so add such commit to fix Buildroot
 > build failures on rel_imx_4.9.x_1.0.0_ga NXP branch.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/123771053
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/123771054
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/123771055

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
