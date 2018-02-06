From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 11:39:02 +0100
Subject: [Buildroot] [PATCH v9 3/3] board: Add Tinker RK3288 board
 support
In-Reply-To: <1517313835-21973-3-git-send-email-jagan@amarulasolutions.com>
 (Jagan Teki's message of "Tue, 30 Jan 2018 13:03:55 +0100")
References: <1517313835-21973-1-git-send-email-jagan@amarulasolutions.com>
 <1517313835-21973-3-git-send-email-jagan@amarulasolutions.com>
Message-ID: <87lgg6tnax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jagan" == Jagan Teki <jagannadh.teki@gmail.com> writes:

 > Add Tinker board, from rk3288 family SOC.
 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
 > ---
 > Changes for v9:
 > - Rebase on master
 > Changes for v8:
 > - Rebase on master
 > Changes for v7:
 > - Rebase on master
 > Changes for v6:
 > - None
 > Changes for v5:
 > - Add host-uboot-tools
 > - Fix commit message
 > - Drop Qt5 configs
 > Changes for v4:
 > - enable BR2_LINUX_KERNEL_INSTALL_TARGET
 > - enable BR2_TARGET_UBOOT_FORMAT_DTB_BINe
 > - Create single u-boot binary
 > - Use linux-4.12 along with same headers

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
