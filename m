From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:45:07 +0200
Subject: [Buildroot] [PATCH 1/7] package/libvips: add zlib optional
 dependency
In-Reply-To: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
References: <20210404143048.2308010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404164507.0b159141@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Apr 2021 16:30:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zlib is an optional dependency which is enabled by default since version
> 8.4.2 and
> https://github.com/libvips/libvips/commit/5ab0001ec68a5f61396aecd8d2d7a619b1dbe1fa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvips/libvips.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Series applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
