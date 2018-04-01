From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 18:44:02 +0200
Subject: [Buildroot] [PATCH v5] package/snort: new package
In-Reply-To: <20180401151636.12399-1-romain.naour@gmail.com>
References: <20180401151636.12399-1-romain.naour@gmail.com>
Message-ID: <20180401184402.2a19952e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 17:16:36 +0200, Romain Naour wrote:
> From: Sergio Prado <sergio.prado@e-labworks.com>
> 
> Tested on Beaglebone Black.
> 
> Build-tested with test-pkg.
> 
> Patch to fix cross-compilation errors submitted upstream [1].
> 
> [1] https://lists.snort.org/pipermail/snort-devel/2018-January/011025.html
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> [Romain:
>  - split patch by build issues
>  - convert AC_RUN_IFELSE to AC_CHECK_MEMBERS (ThomasP)
>  - convert AC_RUN_IFELSE to AC_COMPILE_IFELSE (ThomasP)
>  - remove most make variable from SNORT_CONF_ENV
>  - remove SNORT_SOURCE default value]
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Sergio, snort install some shared libraries and a snort.pc file.
> Does it make sens to add "SNORT_INSTALL_STAGING = YES"?

Applied to master, thanks Romain for finishing this patch!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
