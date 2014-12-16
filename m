From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Dec 2014 18:46:43 +0100
Subject: [Buildroot] [PATCH 2/2] package/Config.in: fix alphabetical
	order
In-Reply-To: <1418458681-5342-2-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1418458681-5342-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1418458681-5342-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20141216174643.GD4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2014-12-13 09:18 +0100, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Config.in |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7300443..81bb9e3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -303,9 +303,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  endif
>  	source "package/dmidecode/Config.in"
>  	source "package/dmraid/Config.in"
> +	source "package/dtv-scan-tables/Config.in"
>  	source "package/dvb-apps/Config.in"
>  	source "package/dvbsnoop/Config.in"
> -	source "package/dtv-scan-tables/Config.in"
>  	source "package/eeprog/Config.in"
>  	source "package/eudev/Config.in"
>  	source "package/evemu/Config.in"
> @@ -424,7 +424,6 @@ menu "Lua libraries/modules"
>  	source "package/lua-messagepack/Config.in"
>  	source "package/lua-msgpack-native/Config.in"
>  	source "package/lua-testmore/Config.in"
> -	source "package/luasql-sqlite3/Config.in"
>  	source "package/luabitop/Config.in"
>  	source "package/luacrypto/Config.in"
>  	source "package/luaexpat/Config.in"
> @@ -435,6 +434,7 @@ menu "Lua libraries/modules"
>  	source "package/luaposix/Config.in"
>  	source "package/luasec/Config.in"
>  	source "package/luasocket/Config.in"
> +	source "package/luasql-sqlite3/Config.in"
>  	source "package/lunit/Config.in"
>  	source "package/lzlib/Config.in"
>  	source "package/orbit/Config.in"
> @@ -460,8 +460,8 @@ menu "Perl libraries/modules"
>  	source "package/perl-try-tiny/Config.in"
>  	source "package/perl-xml-libxml/Config.in"
>  	source "package/perl-xml-namespacesupport/Config.in"
> -	source "package/perl-xml-sax-base/Config.in"
>  	source "package/perl-xml-sax/Config.in"
> +	source "package/perl-xml-sax-base/Config.in"
>  endmenu
>  endif
>  	source "package/php/Config.in"
> @@ -837,9 +837,9 @@ menu "Networking"
>  	source "package/libosip2/Config.in"
>  	source "package/libpcap/Config.in"
>  	source "package/librsync/Config.in"
> -	source "package/libsocketcan/Config.in"
>  	source "package/libshairplay/Config.in"
>  	source "package/libshout/Config.in"
> +	source "package/libsocketcan/Config.in"
>  	source "package/libsoup/Config.in"
>  	source "package/libstrophe/Config.in"
>  	source "package/libtirpc/Config.in"
> @@ -1236,8 +1236,8 @@ endif
>  	source "package/numactl/Config.in"
>  	source "package/nut/Config.in"
>  	source "package/openvmtools/Config.in"
> -	source "package/powerpc-utils/Config.in"
>  	source "package/polkit/Config.in"
> +	source "package/powerpc-utils/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/procps-ng/Config.in"
>  	source "package/psmisc/Config.in"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
