From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:59:28 +0200
Subject: [Buildroot] [PATCH 1/3] busybox: remove musl specific tweaks
In-Reply-To: <ea3c437cb4b462525feff0325c137d4b27717422.1525791919.git.baruch@tkos.co.il>
References: <ea3c437cb4b462525feff0325c137d4b27717422.1525791919.git.baruch@tkos.co.il>
Message-ID: <20180513225928.02398e14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 18:05:17 +0300, Baruch Siach wrote:
> Busybox build fine under current musl using its provided shadow
> passwords and utmp/wtmp support.
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/busybox/busybox.mk | 16 ----------------
>  1 file changed, 16 deletions(-)

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
