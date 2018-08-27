From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:05:35 +0200
Subject: [Buildroot] [PATCH v4 3/4] docs/images: adding default
 buildroot linux logo
In-Reply-To: <1535118300-26815-3-git-send-email-angelo@amarulasolutions.com>
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
 <1535118300-26815-3-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180827110535.431744f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 15:44:59 +0200, Angelo Compagnucci wrote:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds a default buildroot linux boot up logo that can
> be used in all buildroot defconfigs as a buildroot watermark.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  docs/website/images/logo_linux_clut224.png | Bin 0 -> 6825 bytes

Is docs/website/images/ really the right place for this ? Shouldn't
this go in linux/ instead ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
