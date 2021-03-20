From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:02:40 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone_qt5: add overlay to
 defconfig
In-Reply-To: <20210319145907.464593-1-buildroot@heine.tech>
References: <20210319145907.464593-1-buildroot@heine.tech>
Message-ID: <20210320210240.778bdb53@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Mar 2021 15:59:07 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> commit 8efc5dce98f9795d97b7a3452f9be4a774032379 added an overlay but
> forgot to add it to the related defconfig.
> 
> Fixes: missing overlay data in image
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  configs/beaglebone_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
