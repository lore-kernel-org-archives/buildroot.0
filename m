From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:48:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/openswan: add
 OPENSWAN_CPE_ID_VENDOR
In-Reply-To: <20210124175833.1030125-1-fontaine.fabrice@gmail.com>
References: <20210124175833.1030125-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214853.726b8146@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2021 18:58:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:xelerance:openswan is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axelerance%3Aopenswan
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openswan/openswan.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
