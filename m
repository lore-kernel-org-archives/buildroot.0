From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:13:18 +0200
Subject: [Buildroot] [PATCH] boot/xloader: remove package
In-Reply-To: <1537477502-30073-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537477502-30073-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920231318.7e30e40c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 16:05:02 -0500, Matt Weber wrote:
> U-boot has provided SPL support as a viable replacement for the
> 2nd stage bootloader on TI platforms.  The X-loader project
> hasn't had a commit in the log since 12-05-2011.
> (https://gitorious.org/x-loader/x-loader)
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/Config.in          |  1 -
>  boot/xloader/Config.in  | 15 ---------------
>  boot/xloader/xloader.mk | 32 --------------------------------
>  3 files changed, 48 deletions(-)
>  delete mode 100644 boot/xloader/Config.in
>  delete mode 100644 boot/xloader/xloader.mk

This lacks Config.in.legacy handling.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
