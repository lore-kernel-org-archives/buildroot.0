From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Nov 2014 18:40:50 +0100
Subject: [Buildroot] [PATCH v4 1/2] elfutils: rename patches to follow
 the new name structure
In-Reply-To: <1415706464-15288-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1415706464-15288-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415706464-15288-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141113174050.GA3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-11 11:47 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I initially only gave my Reviewed-by, but my Acked-by is OK, too.

Regards,
Yann E. MORIN.

> ---
>  ...isable-progs.patch => 0001-disable-progs.patch} |    0
>  ...-argp-support.patch => 0002-argp-support.patch} |    0
>  ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |    0
>  .../{elfutils-04-fts.patch => 0004-fts.patch}      |    0
>  ...s-05-disable-po.patch => 0005-disable-po.patch} |    0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (100%)
>  rename package/elfutils/{elfutils-02-argp-support.patch => 0002-argp-support.patch} (100%)
>  rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (100%)
>  rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (100%)
>  rename package/elfutils/{elfutils-05-disable-po.patch => 0005-disable-po.patch} (100%)
> 
> diff --git a/package/elfutils/elfutils-01-disable-progs.patch b/package/elfutils/0001-disable-progs.patch
> similarity index 100%
> rename from package/elfutils/elfutils-01-disable-progs.patch
> rename to package/elfutils/0001-disable-progs.patch
> diff --git a/package/elfutils/elfutils-02-argp-support.patch b/package/elfutils/0002-argp-support.patch
> similarity index 100%
> rename from package/elfutils/elfutils-02-argp-support.patch
> rename to package/elfutils/0002-argp-support.patch
> diff --git a/package/elfutils/elfutils-03-memcpy-def.patch b/package/elfutils/0003-memcpy-def.patch
> similarity index 100%
> rename from package/elfutils/elfutils-03-memcpy-def.patch
> rename to package/elfutils/0003-memcpy-def.patch
> diff --git a/package/elfutils/elfutils-04-fts.patch b/package/elfutils/0004-fts.patch
> similarity index 100%
> rename from package/elfutils/elfutils-04-fts.patch
> rename to package/elfutils/0004-fts.patch
> diff --git a/package/elfutils/elfutils-05-disable-po.patch b/package/elfutils/0005-disable-po.patch
> similarity index 100%
> rename from package/elfutils/elfutils-05-disable-po.patch
> rename to package/elfutils/0005-disable-po.patch
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
