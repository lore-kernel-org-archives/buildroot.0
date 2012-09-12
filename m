From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 18:22:29 +0200
Subject: [Buildroot] [PATCH] iw: add license information
In-Reply-To: <505054B5.3080000@mimc.co.uk>
References: <505054B5.3080000@mimc.co.uk>
Message-ID: <5050B6C5.5050804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 11:24, Mark Jackson wrote:
> Signed-off-by: Mark Jackson<mpfj@newflow.co.uk>
> ---
>   package/iw/iw.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index 9c68093..ba1ab30 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -7,6 +7,8 @@
>   IW_VERSION = 3.6
>   IW_SOURCE = iw-$(IW_VERSION).tar.bz2
>   IW_SITE = http://wireless.kernel.org/download/iw
> +IW_LICENSE = iw license
> +IW_LICENSE_FILES = COPYING
Looks like a MIT license to me.

Regards,
Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
