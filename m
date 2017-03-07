From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Tue, 7 Mar 2017 14:54:24 +0530
Subject: [Buildroot] [PATCH] package/cairo: improve license information
In-Reply-To: <20170306210218.28867-1-romain.naour@gmail.com>
References: <20170306210218.28867-1-romain.naour@gmail.com>
Message-ID: <a8c8c494-b69c-2d6b-b505-03f113097a38@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Tuesday 07 March 2017 02:32 AM, Romain Naour wrote:
> Cairo can be licenced under MPL and license copy are in COPYING-LGPL-2.1
> and COPYING-MPL-1.1.

As per COPYING file, this dual licensing only applies to library and 
other auxiliary components (tests, utils, etc) may be under different 
licenses.

>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/cairo/cairo.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
> index 761c6f4..137d348 100644
> --- a/package/cairo/cairo.mk
> +++ b/package/cairo/cairo.mk
> @@ -6,8 +6,8 @@
>
>  CAIRO_VERSION = 1.14.8
>  CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
> -CAIRO_LICENSE = LGPLv2.1+
> -CAIRO_LICENSE_FILES = COPYING
> +CAIRO_LICENSE = LGPLv2.1+ or MPL

License string for LGPL should be "LGPLv2.1" because license text 
doesn't have "or (at your option) any later version;" clause.

There are many versions of MPL license and COPYING file specifically 
mentions MPLv1.1

So, license string should be "LGPLv2.1 or MPLv1.1 (library)"

Thanks,
Rahul
