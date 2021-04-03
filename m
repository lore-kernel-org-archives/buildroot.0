From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:56:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: add LIBVPX_CPE_ID_VENDOR
In-Reply-To: <20210403085530.2217219-1-fontaine.fabrice@gmail.com>
References: <20210403085530.2217219-1-fontaine.fabrice@gmail.com>
Message-ID: <20210403155629.16d7a97c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Apr 2021 10:55:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:webmproject:libvpx is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebmproject%3Alibvpx
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvpx/libvpx.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
