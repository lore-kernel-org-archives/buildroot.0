From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 12:21:11 +0100
Subject: [Buildroot] [PATCH v3 1/2] elfutils: rename patches to follow
 the new name structure
In-Reply-To: <1415703637-11831-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1415703637-11831-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415703637-11831-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141111112111.GB4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-11 11:00 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
