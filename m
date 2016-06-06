From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jun 2016 21:40:04 +0200
Subject: [Buildroot] [PATCH] configs/minnowboard_max: bump kernel to
	4.6.1
In-Reply-To: <1465230057-22582-1-git-send-email-vincent.stehle@intel.com>
 ("Vincent =?utf-8?Q?Stehl=C3=A9=22's?= message of "Mon, 6 Jun 2016 18:20:57
 +0200")
References: <1465230057-22582-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <87poruhzsb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@intel.com> writes:

 > Also, rebase kernel config and adapt kernel command line in grub config
 > file to follow mmc numbering change.

 > Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
 > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  board/minnowboard/grub-minnowboard-max.cfg  |  2 +-
 >  board/minnowboard/linux-4.6.config          | 55 +++++++++++++++++++++++++++++
 >  configs/minnowboard_max-graphical_defconfig |  6 ++--
 >  configs/minnowboard_max_defconfig           |  8 ++---

You forgot to remove/rename linux-4.4.config. Committed with that fixed,
thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
