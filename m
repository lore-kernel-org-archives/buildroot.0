From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 13:43:10 +0200
Subject: [Buildroot] [PATCH 09/10] libglib2: bump to version 2.56.1
In-Reply-To: <20180407113838.13220-1-fontaine.fabrice@gmail.com>
References: <20180407113838.13220-1-fontaine.fabrice@gmail.com>
Message-ID: <20180407134310.540aba8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 13:38:38 +0200, Fabrice Fontaine wrote:
> Add myself to DEVELOPERS
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/58d98c26ca0214e195d5de193b82445a856b9b7e (see https://github.com/GNOME/glib/commit/e2c16df4b5e6d31b6513bebb4a2bc1c5075fff47#diff-cd235eb1f377a526e7e78471ff2d4d6a)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for this patch! However, I just pushed a commit that backports
the fix, I hadn't noticed a 2.56.1 had been released with it.

Could you rebase on top of the latest master ? Also, having the
DEVELOPERS change has part of a separate commit would be better.

Finally, your patch is labeled PATCH 09/10, but we haven't seen any of
the other 9 patches in the series. Is this expected ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
