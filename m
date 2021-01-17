From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:04:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libressl: add
 LIBRESSL_CPE_ID_VENDOR
In-Reply-To: <20210117114910.313746-1-fontaine.fabrice@gmail.com>
References: <20210117114910.313746-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117150422.39d74a45@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 12:49:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:openbsd:libressl is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenbsd%3Alibressl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libressl/libressl.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
