From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Aug 2012 14:50:04 +0200
Subject: [Buildroot] [PATCH] fontconfig: add license info [v2]
In-Reply-To: <1345596860-3362-1-git-send-email-danomimanchego123@gmail.com>
References: <1345596860-3362-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <5034D57C.7070605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   package/fontconfig/fontconfig.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index 843b34f..9845656 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -6,6 +6,8 @@
>   FONTCONFIG_VERSION = 2.6.0
>   FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
>   FONTCONFIG_SITE = http://fontconfig.org/release
> +FONTCONFIG_LICENSE = fontconfig license
> +FONTCONFIG_LICENSE_FILES = COPYING
>   FONTCONFIG_AUTORECONF = YES
>   FONTCONFIG_INSTALL_STAGING = YES
>   # This package does not like using the target cflags for some reason.

I agree with Thomas' comments on your v1 patch.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
