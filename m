From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:34:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: add
 GDK_PIXBUF_CPE_ID_VENDOR
In-Reply-To: <20210111223231.1418551-1-fontaine.fabrice@gmail.com>
References: <20210111223231.1418551-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114233451.07e5f373@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 23:32:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:gnome:gdk-pixbuf is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agdk-pixbuf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
