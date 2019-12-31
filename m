From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:31:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/sdl_mixer: add hash for license
 file
In-Reply-To: <20191230210953.1144882-2-fontaine.fabrice@gmail.com>
References: <20191230210953.1144882-1-fontaine.fabrice@gmail.com>
 <20191230210953.1144882-2-fontaine.fabrice@gmail.com>
Message-ID: <20191231083125.GZ26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-30 22:09 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl_mixer/sdl_mixer.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sdl_mixer/sdl_mixer.hash b/package/sdl_mixer/sdl_mixer.hash
> index cfe8b07cb0..5d7e7836cd 100644
> --- a/package/sdl_mixer/sdl_mixer.hash
> +++ b/package/sdl_mixer/sdl_mixer.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256	1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a	SDL_mixer-1.2.12.tar.gz
> +sha256	bc4c3bc32b311044d81c32b5e5402a6bc971a3b235850bb63445ec14bb6fe59e	COPYING
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
