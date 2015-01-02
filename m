From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:38:21 +0100
Subject: [Buildroot] [PATCH 03/10] package/libsvgtiny: enable shared
 library build
In-Reply-To: <1419717508-11627-4-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150102123821.6f1b3e74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 22:58:21 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libsvgtiny/libsvgtiny.mk | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
> index a2d494e..6cb666f 100644
> --- a/package/libsvgtiny/libsvgtiny.mk
> +++ b/package/libsvgtiny/libsvgtiny.mk
> @@ -11,18 +11,28 @@ LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
>  LIBSVGTINY_LICENSE = MIT
>  LIBSVGTINY_LICENSE_FILES = README
>  
> +# Prefer shared libraries if available

This comment was not really clear, so I reworded it a little bit and
applied your patch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
