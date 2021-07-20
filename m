From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:28:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: add LRZSZ_CPE_ID_VENDOR
In-Reply-To: <20210718220200.3296878-1-fontaine.fabrice@gmail.com>
References: <20210718220200.3296878-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720202853.198e0e04@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 00:02:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:lrzsz_project:lrzsz is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alrzsz_project%3Alrzsz
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lrzsz/lrzsz.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
