From: Connolly, Padraig <padraig.connolly@intel.com>
Date: Tue, 23 Aug 2016 08:05:15 +0000
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <20160822163337.484cb311@free-electrons.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
 <20160822163337.484cb311@free-electrons.com>
Message-ID: <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Could you elaborate on this preference please, in the previous version for the Galileo the defconfig pulled the kernel in a similar way I have done.  The future plan is once everything is approved, we will update R. Kinsella's repo with the 3.14 kernel and the defconfig will pull from there instead of mine as it did before.  I'm only using my repo as a temp for working on.

Thanks,

Padraig Connolly


-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Monday, August 22, 2016 3:34 PM
To: Connolly, Padraig <padraig.connolly@intel.com>
Cc: buildroot at busybox.net; Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14 kernel

Hello,

On Mon, 22 Aug 2016 13:25:35 +0100, Padraig James Connolly wrote:
> Updating kernel for Galileo board BSP from 3.8 to 3.14  *Changed board 
> defconfig to pull new 3.14 kernel  *New kernel config file for 3.14 
> kernel  *Changed defconfig to use new kernel config  *Removed old 3.8 
> kernel config
> 
>  Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>

Following the comments from Andy, I've marked this patch as Rejected.
We indeed very much prefer defconfig that use the mainline kernel when possible.

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
