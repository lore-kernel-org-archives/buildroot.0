From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Dec 2014 16:57:03 +0100
Subject: [Buildroot] [PATCH 2/5] libxmlrpc: rename patches to the new
 convention
In-Reply-To: <1419688038-15640-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419688038-15640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1419688038-15640-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141227155703.GF4098@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-27 14:47 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...xmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} | 0
>  ...2-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} | 0
>  .../{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch}  | 0
>  ...4-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} | 0
>  4 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/libxmlrpc/{libxmlrpc-0001-fix-gennmtab-build.patch => 0001-fix-gennmtab-build.patch} (100%)
>  rename package/libxmlrpc/{libxmlrpc-0002-fix-non-cplusplus-build.patch => 0002-fix-non-cplusplus-build.patch} (100%)
>  rename package/libxmlrpc/{libxmlrpc-0003-non-wchar-build.patch => 0003-non-wchar-build.patch} (100%)
>  rename package/libxmlrpc/{libxmlrpc-0004-use-correct-curl-config.patch => 0004-use-correct-curl-config.patch} (100%)
> 
> diff --git a/package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
> similarity index 100%
> rename from package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch
> rename to package/libxmlrpc/0001-fix-gennmtab-build.patch
> diff --git a/package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
> similarity index 100%
> rename from package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch
> rename to package/libxmlrpc/0002-fix-non-cplusplus-build.patch
> diff --git a/package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch b/package/libxmlrpc/0003-non-wchar-build.patch
> similarity index 100%
> rename from package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch
> rename to package/libxmlrpc/0003-non-wchar-build.patch
> diff --git a/package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
> similarity index 100%
> rename from package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch
> rename to package/libxmlrpc/0004-use-correct-curl-config.patch
> -- 
> 2.1.0
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
