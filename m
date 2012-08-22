From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:45:21 +0200
Subject: [Buildroot] [PATCH] inotify-tools: add license information
In-Reply-To: <1345619321-4644-1-git-send-email-spdawson@gmail.com>
References: <1345619321-4644-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120822194521.48a4060c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 08:08:40 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/inotify-tools/inotify-tools.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
> index 52a1701..7c37929 100644
> --- a/package/inotify-tools/inotify-tools.mk
> +++ b/package/inotify-tools/inotify-tools.mk
> @@ -6,3 +6,5 @@
>  INOTIFY_TOOLS_VERSION = 3.14
>  INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
>  $(eval $(autotools-package))
> +INOTIFY_TOOLS_LICENSE = GPLv2+
> +INOTIFY_TOOLS_LICENSE_FILES = COPYING

I've applied this one, but modified the two licensing-related lines to
be above the $(eval $(autotools-package)).

Also, I am not 100% sure how to decide whether this package is GPLv2 or
GPLv2+. The COPYING file contains the text of the GPLv2, but I haven't
found any other place in the source code where the license was
mentioned. So we don't know whether it is GPLv2 only, or "GPLv2 or
later".

I've applied your patch with GPLv2+, and we'll listen to comments from
others if they have a better idea on how to take the proper decision on
this.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
