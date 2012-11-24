From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 00:15:24 +0100
Subject: [Buildroot] [PATCH 33/33] sylpheed: add license info
In-Reply-To: <1353543503-8952-34-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-34-git-send-email-s.martin49@gmail.com>
Message-ID: <50B1550C.7080709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/sylpheed/sylpheed.mk | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
> index 3ac2e1e..149c2a3 100644
> --- a/package/sylpheed/sylpheed.mk
> +++ b/package/sylpheed/sylpheed.mk
> @@ -8,6 +8,8 @@ SYLPHEED_VERSION_MINOR = 0
>   SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
>   SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
>   SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
> +SYLPHEED_LICENSE = GPLv2, except the libraries which are released under LGPLv2.1

  Both of them are +, so: GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)


  Regards,
  Arnout

> +SYLPHEED_LICENSE_FILES = COPIYNG COPYING.LIB
>
>   SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
