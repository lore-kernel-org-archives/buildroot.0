From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 12:47:01 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] zmqpp: fix build with or1k and gcc < 6
In-Reply-To: <20180505094304.6621-1-fontaine.fabrice@gmail.com>
References: <20180505094304.6621-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520124701.38535b44@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 May 2018 11:43:04 +0200, Fabrice Fontaine wrote:
> Use CONFIG variable to disable optimizations when or1k and gcc < 6 are
> detected otherwise set CONFIG to release or debug depending on
> BR2_ENABLE_DEBUG
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/523e58eefba7ef23a09ef53160da22190ccbb098
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Enhance patch by setting CONFIG to debug if BR2_ENABLE_DEBUG is set

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
