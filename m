From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Aug 2012 09:21:21 +0200
Subject: [Buildroot] [PATCH] nanocom: add license information
In-Reply-To: <1343891352-21337-1-git-send-email-spdawson@gmail.com>
References: <1343891352-21337-1-git-send-email-spdawson@gmail.com>
Message-ID: <501A2A71.8090505@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>   package/nanocom/nanocom.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
> index 1e46100..a88daeb 100644
> --- a/package/nanocom/nanocom.mk
> +++ b/package/nanocom/nanocom.mk
> @@ -6,6 +6,8 @@
>   NANOCOM_VERSION = 2.6.1
>   NANOCOM_SOURCE = nanocom.tar.gz
>   NANOCOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nanocom/nanocom/v1.0
> +NANOCOM_LICENSE = GPLv2+
> +NANOCOM_LICENSE_FILES = COPYING
>   
>   # N.B. Don't strip any path components during extraction.
>   define NANOCOM_EXTRACT_CMDS

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
