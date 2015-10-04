From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 4 Oct 2015 11:48:06 +0200
Subject: [Buildroot] [PATCH 16/19] Makefile.in: remove now-unused
 TARGET_CC/CXX_NOCCACHE
In-Reply-To: <1442777319-24164-3-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
 <1442777319-24164-3-git-send-email-arnout@mind.be>
Message-ID: <5610F5D6.7030800@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Le 20/09/2015 21:28, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  package/Makefile.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 4b1ce7f..7dc0eac 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -186,9 +186,6 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
>  TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
>  TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
>  
> -TARGET_CC_NOCCACHE  := $(TARGET_CC)
> -TARGET_CXX_NOCCACHE := $(TARGET_CXX)
> -
>  ifeq ($(BR2_STRIP_strip),y)
>  STRIP_STRIP_DEBUG := --strip-debug
>  STRIP_STRIP_UNNEEDED := --strip-unneeded
> 
