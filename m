From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 13:38:05 +0200
Subject: [Buildroot] [PATCH] Added option to enable Freedreno gallium
 driver in mesa3d
In-Reply-To: <20180411212741.16489-1-andre@ignavus.net>
References: <20180411212741.16489-1-andre@ignavus.net>
Message-ID: <20180412133805.5f97f451@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

Thanks for this new version, this is almost good, but not yet :)

On Thu, 12 Apr 2018 09:27:41 +1200, Andre Renaud wrote:
> From: Andre Renaud <arenaud@designa-electronics.com>
> 

Your Signed-off-by line is missing here, could you resend with this
Signed-off-by line added ?

Also, please change the commit title to:

	mesa3d: add option to enable Freedreno gallium driver

Indeed:

 - We also want the commit log to have the format "<package>:
   <description>"

 - Using a past tense "Added" doesn't make a lot of sense. Your commit
   has not "added" something, it is adding something. So using just
   "add" makes a lot more sense

Could you resend after fixing those minor issues? I had fixed myself
the commit title issue and was about to push your patch, but the
missing Signed-off-by requires you to resend a new version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
