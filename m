From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 18:55:22 +0100
Subject: [Buildroot] [PATCH 1/2] libcap: rename existing patch
In-Reply-To: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383328047-28945-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102175522.GE3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-01 18:47 +0100, Thomas Petazzoni spake thusly:
> libcap currently has one patch, but it is named using the old naming
> strategy, which includes the package version, but not a patch
> number. This commit switches this to use the new patch naming
> strategy.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  .../{libcap-2.22-build-system.patch => libcap-01-build-system.patch}      | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/libcap/{libcap-2.22-build-system.patch => libcap-01-build-system.patch} (100%)
> 
> diff --git a/package/libcap/libcap-2.22-build-system.patch b/package/libcap/libcap-01-build-system.patch
> similarity index 100%
> rename from package/libcap/libcap-2.22-build-system.patch
> rename to package/libcap/libcap-01-build-system.patch
> -- 
> 1.8.1.2
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
