From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:52:30 +0100
Subject: [Buildroot] [PATCH 3/4] docs/images: adding default buildroot
 linux logo
In-Reply-To: <1505819034-29610-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
 <1505819034-29610-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180206155230.3af0f81f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Sep 2017 13:03:53 +0200, Angelo Compagnucci wrote:
> This patch adds a default buildroot linux boot up logo that can
> be used in all buildroot defconfigs as a buildroot watermark.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/images/logo_linux_clut224.ppm | 84 ++++++++++++++++++++++++++++++

I think it would be more natural to store this file as a PNG instead,
and use the convert capabilities that your PATCH 2/4 is adding.

Could you respin after taking into account the comments on PATCH 2/4
and 3/4 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
