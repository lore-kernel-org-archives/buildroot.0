From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 22 Aug 2012 14:16:15 +0200
Subject: [Buildroot] [PATCH 1/5] barebox: add license information
In-Reply-To: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
References: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120822121615.GC6060@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10:25 Sat 18 Aug     , spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  boot/barebox/barebox.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index e5e2558..3641c1d 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -20,6 +20,9 @@ BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
>  BAREBOX_SITE = http://www.barebox.org/download/
>  endif
>  
> +BAREBOX_LICENSE = GPLv2+
> +BAREBOX_LICENSE_FILES = COPYING
Barebox is GPLv2 only

Best Regards,
J.
