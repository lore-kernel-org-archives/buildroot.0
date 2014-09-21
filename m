From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:06:25 +0200
Subject: [Buildroot] [PATCH] swig : bump to version 2.0.12
In-Reply-To: <1411110831-27676-2-git-send-email-jeremy.rosen@openwide.fr>
References: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
 <1411110831-27676-2-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140921200625.59299e4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Fri, 19 Sep 2014 09:13:50 +0200, J?r?my Rosen wrote:
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>  package/swig/swig.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index 79839ea..5efc81c 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -SWIG_VERSION = 2.0.10
> +SWIG_MAJOR = 2.0
> +SWIG_VERSION = $(SWIG_MAJOR).12

This the SWIG_MAJOR variable would only be needed by your next patch
that is not ready to be applied, I've reverted to using just
SWIG_VERSION and applied your bump.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
