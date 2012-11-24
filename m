From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 00:08:04 +0100
Subject: [Buildroot] [PATCH 22/33] libmad: add license info
In-Reply-To: <1353543503-8952-23-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-23-git-send-email-s.martin49@gmail.com>
Message-ID: <50B15354.2040607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/libmad/libmad.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
> index 6999b66..1ce52ec 100644
> --- a/package/libmad/libmad.mk
> +++ b/package/libmad/libmad.mk
> @@ -8,6 +8,8 @@ LIBMAD_VERSION = 0.15.1b
>   LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
>   LIBMAD_INSTALL_STAGING = YES
>   LIBMAD_LIBTOOL_PATCH = NO
> +LIBMAD_LICENSE = GPLv2

  It's GPLv2+


  Regards,
  Arnout

> +LIBMAD_LICENSE_FILES = COPYING
>
>   define LIBMAD_PREVENT_AUTOMAKE
>   	# Prevent automake from running.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
