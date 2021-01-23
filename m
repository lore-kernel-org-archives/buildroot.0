From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:35:16 +0100
Subject: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: add CPE variables
In-Reply-To: <20210121221046.2372389-1-fontaine.fabrice@gmail.com>
References: <20210121221046.2372389-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123213516.63db3b41@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Jan 2021 23:10:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:linux_sam:at91bootstrap is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinux_sam%3Aat91bootstrap
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  boot/at91bootstrap3/at91bootstrap3.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
