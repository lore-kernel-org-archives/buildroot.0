From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Wed, 02 Mar 2011 09:18:15 +0100
Subject: [Buildroot] [PATCH] lua: enables lua to be built for host
In-Reply-To: <4D4BC3EF.5090408@free.fr>
References: <4D4BC3EF.5090408@free.fr>
Message-ID: <4D6DFD47.50909@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping.


Le 04/02/2011 10:16, Guillaume Gardet a ?crit :
> This patch enables lua to be built for host.
>
> Signed-off-by: Guillaume GARDET <guillaume.gardet@free.fr>
> ---
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 598eea1..a3b16d9 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -122,3 +122,4 @@ define LUA_CLEAN_CMDS
>  endef
>
>  $(eval $(call GENTARGETS,package,lua))
> +$(eval $(call GENTARGETS,package,lua,host))
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
