From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 23:31:13 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: export PATH
In-Reply-To: <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20131111233113.2e11fd88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 11 Nov 2013 21:59:46 +0100, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 4010c65..d587b4f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -294,6 +294,7 @@ export STAGING_DIR
>  export HOST_DIR
>  export BINARIES_DIR
>  export BASE_DIR
> +export PATH:=$(BR2_PATH)

Why?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
