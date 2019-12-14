From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 15:13:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libp11: add host-pkgconf
 dependency for host variant
In-Reply-To: <20191214090229.164853-1-fontaine.fabrice@gmail.com>
References: <20191214090229.164853-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214151331.537c8851@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 10:02:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-pkgconf is needed to find host-openssl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/05adf424050cb56f74ae4106b3c9b61f8daff7d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libp11/libp11.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Glad to see that per-package support is
useful :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
