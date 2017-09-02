From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Sep 2017 19:44:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/netatalk: remove patch applied
 upstream
In-Reply-To: <20170902170313.13215-1-bernd.kuhls@t-online.de>
References: <20170902170313.13215-1-bernd.kuhls@t-online.de>
Message-ID: <20170902174427.GB3396@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-09-02 19:03 +0200, Bernd Kuhls spake thusly:
> Link to upstream commit:
> https://sourceforge.net/p/netatalk/code/ci/d48ecb55ac4c916cd78bbaf4de53a04abf6d47fb/
> 
> Fixes
> http://autobuild.buildroot.net/results/0a7/0a7c94e074da5a4944f2046cd33fdcc51d3884e5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Usually, I like that the person that sent a patch that broke the build
is in Cc of the fix. That'll teach them! Hehe! ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/netatalk/0002-no-acl.patch | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 package/netatalk/0002-no-acl.patch
> 
> diff --git a/package/netatalk/0002-no-acl.patch b/package/netatalk/0002-no-acl.patch
> deleted file mode 100644
> index 165141b47..000000000
> --- a/package/netatalk/0002-no-acl.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Fix builds without acl, from http://sourceforge.net/p/netatalk/bugs/574/
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -diff -Nura netatalk-3.1.7.orig/include/atalk/acl.h netatalk-3.1.7/include/atalk/acl.h
> ---- netatalk-3.1.7.orig/include/atalk/acl.h	2014-12-03 17:34:49.895524464 -0300
> -+++ netatalk-3.1.7/include/atalk/acl.h	2014-12-03 17:34:58.735243283 -0300
> -@@ -61,6 +61,7 @@
> - #else /* HAVE_ACLS=no */
> - 
> - #define O_NETATALK_ACL 0
> -+#define O_IGNORE 0
> - #define chmod_acl chmod
> - 
> - #endif /* HAVE_ACLS */
> -- 
> 2.11.0
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
