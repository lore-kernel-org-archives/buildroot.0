From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 15:22:41 +0200
Subject: [Buildroot] [PATCH] webp: bump to version 0.4.3
In-Reply-To: <1428064160-9888-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428064160-9888-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150403152241.22daf2a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  3 Apr 2015 09:29:20 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webp/webp.hash | 2 ++
>  package/webp/webp.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>  create mode 100644 package/webp/webp.hash
> 
> diff --git a/package/webp/webp.hash b/package/webp/webp.hash
> new file mode 100644
> index 0000000..328f263
> --- /dev/null
> +++ b/package/webp/webp.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4	libwebp-0.4.3.tar.gz
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> index 1fece6d..5f2cab7 100644
> --- a/package/webp/webp.mk
> +++ b/package/webp/webp.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -WEBP_VERSION = 0.3.1
> +WEBP_VERSION = 0.4.3
>  WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
> -WEBP_SITE = https://webp.googlecode.com/files
> +WEBP_SITE = http://downloads.webmproject.org/releases/webp

Yeah, one less project hosted on Google Code!

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
