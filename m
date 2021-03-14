From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 13:33:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/lua-curl: bump to version 0.3.13
In-Reply-To: <20210313071145.1558401-1-francois.perrad@gadz.org>
References: <20210313071145.1558401-1-francois.perrad@gadz.org>
Message-ID: <20210314123318.GR2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-03-13 08:11 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lua-curl/lua-curl.hash | 4 ++--
>  package/lua-curl/lua-curl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
> index 5210ceb0f..836e2cb6f 100644
> --- a/package/lua-curl/lua-curl.hash
> +++ b/package/lua-curl/lua-curl.hash
> @@ -1,3 +1,3 @@
>  # computed by luarocks/buildroot
> -sha256 b6b860cd416ad883f2c7c2e1696aceda60c96036f660fb8c0236a5cc3d961c04  lua-curl-0.3.12-1.src.rock
> -sha256 0f92f4c4665aadffb023de44b16022282040fe4409d5cd3148f1812dec30cdff  Lua-cURLv3-0.3.12/LICENSE
> +sha256 6b2cc48621fac3cb7c1669705475e67a6932829ba46efb9ac5864604848f8ea2  lua-curl-0.3.13-1.src.rock
> +sha256 0f92f4c4665aadffb023de44b16022282040fe4409d5cd3148f1812dec30cdff  Lua-cURLv3-0.3.13/LICENSE
> diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
> index 37fbf30cc..2120d33ab 100644
> --- a/package/lua-curl/lua-curl.mk
> +++ b/package/lua-curl/lua-curl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUA_CURL_VERSION_UPSTREAM = 0.3.12
> +LUA_CURL_VERSION_UPSTREAM = 0.3.13
>  LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
>  LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
>  LUA_CURL_LICENSE = MIT
> -- 
> 2.27.0
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
