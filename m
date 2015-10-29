From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Oct 2015 19:29:27 +0100
Subject: [Buildroot] [PATCH 2/2] libv4l: bump version to 1.8.1
In-Reply-To: <1446125625-7009-2-git-send-email-Vincent.Riera@imgtec.com>
References: <y>
	<1446125625-7009-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151029192927.6cb9cc7b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Thu, 29 Oct 2015 13:33:45 +0000, Vicente Olivert Riera <Vincent.Riera@imgtec.com> wrote:

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libv4l/libv4l.hash |    2 +-
>  package/libv4l/libv4l.mk   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
> index 1395eda..d79ccbc 100644
> --- a/package/libv4l/libv4l.hash
> +++ b/package/libv4l/libv4l.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 50c7be033636d878e902dad0a207fc9f6d831bec27f1b410f1102acddaa5565e  v4l-utils-1.8.0.tar.bz2
> +sha256 2f6219b03f19ea07c100e860238d5cdbfcbcfe440a14477e75137cc073431b33  v4l-utils-1.8.1.tar.bz2
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index 89d1d00..ceb1666 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBV4L_VERSION = 1.8.0
> +LIBV4L_VERSION = 1.8.1
>  LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
>  LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
>  LIBV4L_INSTALL_STAGING = YES

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
