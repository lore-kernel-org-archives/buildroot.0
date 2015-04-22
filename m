From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Apr 2015 16:29:28 +0200
Subject: [Buildroot] [PATCH] ltris: fix typo
In-Reply-To: <1429711573-8846-1-git-send-email-luca@lucaceresoli.net>
References: <1429711573-8846-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <5537B048.1010806@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/ltris/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ltris/Config.in b/package/ltris/Config.in
> index bf5240d..779ef4b 100644
> --- a/package/ltris/Config.in
> +++ b/package/ltris/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_LTRIS
>   	help
>   	  LTris as a tetris clone, using SDL. It optionally requires
>   	  SDL_mixer for audio support.  A display with minimum 640x480
> -	  resolution and a keyboard are recommanded.
> +	  resolution and a keyboard are recommended.

Forget it, there's another typo. V2 incoming.


-- 
Luca
