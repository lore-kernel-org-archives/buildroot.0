From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:06:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: add CUPS_CPE_ID_VENDOR
In-Reply-To: <20210117171622.356521-1-fontaine.fabrice@gmail.com>
References: <20210117171622.356521-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118220609.16af6e4e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 18:16:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:cups:cups is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acups%3Acups
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups/cups.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
