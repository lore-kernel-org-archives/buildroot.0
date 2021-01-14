From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:35:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: add
 BINUTILS_CPE_ID_VENDOR
In-Reply-To: <20210111224329.1419555-1-fontaine.fabrice@gmail.com>
References: <20210111224329.1419555-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114233522.64bbad0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 23:43:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:gnu:binutils is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Abinutils
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/binutils/binutils.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
