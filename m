From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:49:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcdio: add
 LIBCDIO_CPE_ID_VENDOR
In-Reply-To: <20210124182200.1042565-1-fontaine.fabrice@gmail.com>
References: <20210124182200.1042565-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214900.19ae1b00@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2021 19:22:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:gnu:libcdio is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibcdio
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcdio/libcdio.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
