From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 09 Dec 2012 16:05:49 +0100
Subject: [Buildroot] [PATCH] fbv: add license info
In-Reply-To: <1354875156-28654-1-git-send-email-sho@relinux.de>
References: <1354875156-28654-1-git-send-email-sho@relinux.de>
Message-ID: <50C4A8CD.2090407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/12 11:12, Stephan Hoffmann wrote:
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>
> ---
>   package/fbv/fbv.mk |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
> index 7949e99..f697fe8 100644
> --- a/package/fbv/fbv.mk
> +++ b/package/fbv/fbv.mk
> @@ -7,6 +7,9 @@ FBV_VERSION:=1.0b
>   FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
>   FBV_SITE:=http://s-tech.elsat.net.pl/fbv
>
> +FBV_LICENSE = GPLv2

  Although the README and COPYING files claim it's version 2, all source files
say version 2 or later.

  I'm not sure what to do here.  The safe option is:

FBV_LICENSE = GPLv2 (or later?)


> +FBV_LICENSE_FILES = COPYING

  That file is just referring to the GNU website, so it doesn't help much
to use that as the license file. Still, it's better than nothing I guess.


  Regards,
  Arnout

> +
>   ### image format dependencies and configure options
>   FBV_DEPENDENCIES = # empty
>   FBV_CONFIGURE_OPTS = # empty

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
