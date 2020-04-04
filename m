From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 15:27:42 +0200
Subject: [Buildroot] [PATCH v1] package/sysdig: update upstream URL in
 Config.in
In-Reply-To: <20200403185531.500-1-ps.report@gmx.net>
References: <20200403185531.500-1-ps.report@gmx.net>
Message-ID: <20200404132742.GE22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-04-03 20:55 +0200, Peter Seiderer spake thusly:
> Fixes #12746 ([1]).
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=12746
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've extended the commit log, switched to usign the wiki instead of the
git repo, and pushed to master. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysdig/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index c37d8d05cc..5c22bb0b52 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -23,7 +23,7 @@ config BR2_PACKAGE_SYSDIG
>  	  Think of it as strace + tcpdump + lsof + awesome sauce.
>  	  With a little Lua cherry on top.
>  
> -	  http://sysdig.org
> +	  https://github.com/draios/sysdig
>  
>  comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
> -- 
> 2.26.0
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
