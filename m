From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:53:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: drop unrecogized
 options
In-Reply-To: <20210322195416.1471536-1-fontaine.fabrice@gmail.com>
References: <20210322195416.1471536-1-fontaine.fabrice@gmail.com>
Message-ID: <20210328225317.72718009@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 20:54:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --without-zip has been dropped since version 8.4.2 and
> https://github.com/libvips/libvips/commit/5ab0001ec68a5f61396aecd8d2d7a619b1dbe1fa
> 
> --without-python has been dropped since version 8.6.0 and
> https://github.com/libvips/libvips/commit/fddd277995cf8ffb434eeaf2ee27fe22d921bc59
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvips/libvips.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
