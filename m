From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:33:37 +0200
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
Message-ID: <20160822163337.484cb311@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 13:25:35 +0100, Padraig James Connolly wrote:
> Updating kernel for Galileo board BSP from 3.8 to 3.14
>  *Changed board defconfig to pull new 3.14 kernel
>  *New kernel config file for 3.14 kernel
>  *Changed defconfig to use new kernel config
>  *Removed old 3.8 kernel config
> 
>  Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>

Following the comments from Andy, I've marked this patch as Rejected.
We indeed very much prefer defconfig that use the mainline kernel when
possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
