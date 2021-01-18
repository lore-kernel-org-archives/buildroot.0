From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:06:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: add
 IMAGEMAGICK_CPE_ID_VENDOR
In-Reply-To: <20210117181242.367792-1-fontaine.fabrice@gmail.com>
References: <20210117181242.367792-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118220645.27dadfda@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 19:12:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:imagemagick:imagemagick is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aimagemagick%3Aimagemagick
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/imagemagick/imagemagick.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
