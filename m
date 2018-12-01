From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:50:49 +0100
Subject: [Buildroot] [PATCH 1/2] quagga: fix BR2_PACKAGE_QUAGGA_TCP_ZEBRA
In-Reply-To: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
References: <20181201183151.3853-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201215049.52b88dc8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 19:31:50 +0100, Fabrice Fontaine wrote:
> Since bump to version 0.99.21 and commit
> b20c77321fa87f880ead2f27ecf19fd7c4f436da, BR2_PACKAGE_QUAGGA_TCP_ZEBRA
> has been wrongly rename into BR2_PACKAGE_QUAGGA_TCP_ZERBRA
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quagga/quagga.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
