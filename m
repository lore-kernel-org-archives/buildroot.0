From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:00:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/hiredis: add
 HIREDIS_CPE_ID_VENDOR
In-Reply-To: <20210115074238.2076460-1-fontaine.fabrice@gmail.com>
References: <20210115074238.2076460-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116220041.722e8af6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Jan 2021 08:42:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:redislabs:hiredis is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredislabs%3Ahiredis
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hiredis/hiredis.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
