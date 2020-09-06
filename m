From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 09:50:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/mongrel2: renumber patches
In-Reply-To: <20200905124203.560735-1-fontaine.fabrice@gmail.com>
References: <20200905124203.560735-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906075041.GH14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-05 14:42 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../{0002-Do-not-run-tests.patch => 0001-Do-not-run-tests.patch}  | 0
>  ...ation.patch => 0002-Fix-Makefiles-for-cross-compilation.patch} | 0
>  ...onflict.patch => 0003-Rename-symbol-to-prevent-conflict.patch} | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/mongrel2/{0002-Do-not-run-tests.patch => 0001-Do-not-run-tests.patch} (100%)
>  rename package/mongrel2/{0003-Fix-Makefiles-for-cross-compilation.patch => 0002-Fix-Makefiles-for-cross-compilation.patch} (100%)
>  rename package/mongrel2/{0004-Rename-symbol-to-prevent-conflict.patch => 0003-Rename-symbol-to-prevent-conflict.patch} (100%)
> 
> diff --git a/package/mongrel2/0002-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
> similarity index 100%
> rename from package/mongrel2/0002-Do-not-run-tests.patch
> rename to package/mongrel2/0001-Do-not-run-tests.patch
> diff --git a/package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
> similarity index 100%
> rename from package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch
> rename to package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
> diff --git a/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch b/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
> similarity index 100%
> rename from package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch
> rename to package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
> -- 
> 2.28.0
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
