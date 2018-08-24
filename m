From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:16:43 +0200
Subject: [Buildroot] [PATCH] package/sam-ba: bump to version 2.18
In-Reply-To: <1535118705-4279-1-git-send-email-angelo@amarulasolutions.com>
References: <1535118705-4279-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180824231643.2de91237@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 15:51:45 +0200, Angelo Compagnucci wrote:
> This patch bumps the sam-ba package to version 2.18 and
> adds hashes for license files.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Applied to next, thanks!

> +SAM_BA_SOURCE = sam-ba_cdc_linux.zip

What a stupid file name, with no version in it :-/ Thankfully, with the
hash, we will notice if we bump the version that the old file present
in the local download folder is wrong, and trigger a re-download. But
still, that's silly :-/

I'll complain to Microchip about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
