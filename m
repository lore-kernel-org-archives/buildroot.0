From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 11:25:31 +0200
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
 <20160822163337.484cb311@free-electrons.com>
 <E704BB48EC9FDF4FA0A7A278C2546ACFE25B11@irsmsx105.ger.corp.intel.com>
Message-ID: <20160823112531.13f75bab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 08:05:15 +0000, Connolly, Padraig wrote:

> Could you elaborate on this preference please, in the previous
> version for the Galileo the defconfig pulled the kernel in a similar
> way I have done.  The future plan is once everything is approved, we
> will update R. Kinsella's repo with the 3.14 kernel and the defconfig
> will pull from there instead of mine as it did before.  I'm only
> using my repo as a temp for working on.

It's pretty simple:

 - If a platform has reasonable support in the mainline Linux kernel,
   then we prefer if our defconfigs use the mainline Linux kernel. By
   "reasonable" support, I mean support with sufficient features for
   the platform to actually be useful.

 - If a platform doesn't have reasonable support in the mainline Linux
   kernel, then we accept defconfigs that use other Linux kernel trees
   (from vendors, or community maintained, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
