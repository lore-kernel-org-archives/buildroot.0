From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 12:41:22 +0100
Subject: [Buildroot] [PATCH v2 1/2] libgtk3: rename patches to follow
 the new name structure
In-Reply-To: <1415704522-14201-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1415704522-14201-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415704522-14201-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141111114122.GD4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-11 11:15 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} |    0
>  ...ck.patch => 0002-fix-introspection-check.patch} |    0
>  ...-bridge.patch => 0003-disable-atk-bridge.patch} |    0
>  ... 0004-Fix-undefined-reference-to-get_xkb.patch} |    0
>  ...tch => 0005-do-not-build-extract-strings.patch} |    0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/libgtk3/{libgtk3-0001-no-gtk-doc.patch => 0001-no-gtk-doc.patch} (100%)
>  rename package/libgtk3/{libgtk3-0002-fix-introspection-check.patch => 0002-fix-introspection-check.patch} (100%)
>  rename package/libgtk3/{libgtk3-0003-disable-atk-bridge.patch => 0003-disable-atk-bridge.patch} (100%)
>  rename package/libgtk3/{libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch => 0004-Fix-undefined-reference-to-get_xkb.patch} (100%)
>  rename package/libgtk3/{libgtk3-0005-do-not-build-extract-strings.patch => 0005-do-not-build-extract-strings.patch} (100%)
> 
> diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
> similarity index 100%
> rename from package/libgtk3/libgtk3-0001-no-gtk-doc.patch
> rename to package/libgtk3/0001-no-gtk-doc.patch
> diff --git a/package/libgtk3/libgtk3-0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
> similarity index 100%
> rename from package/libgtk3/libgtk3-0002-fix-introspection-check.patch
> rename to package/libgtk3/0002-fix-introspection-check.patch
> diff --git a/package/libgtk3/libgtk3-0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
> similarity index 100%
> rename from package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
> rename to package/libgtk3/0003-disable-atk-bridge.patch
> diff --git a/package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch b/package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
> similarity index 100%
> rename from package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch
> rename to package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
> diff --git a/package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch b/package/libgtk3/0005-do-not-build-extract-strings.patch
> similarity index 100%
> rename from package/libgtk3/libgtk3-0005-do-not-build-extract-strings.patch
> rename to package/libgtk3/0005-do-not-build-extract-strings.patch
> -- 
> 1.7.1
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
