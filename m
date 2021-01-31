From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:27:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: add
 WEBKITGTK_CPE_ID_VENDOR
In-Reply-To: <20210128171947.4137710-1-fontaine.fabrice@gmail.com>
References: <20210128171947.4137710-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131232736.785cca1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Jan 2021 18:19:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:webkitgtk:webkitgtk is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebkitgtk%3Awebkitgtk
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/webkitgtk/webkitgtk.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
