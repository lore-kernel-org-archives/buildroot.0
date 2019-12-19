From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:19:53 +0100
Subject: [Buildroot] [PATCH v2 0/4] package/xenomai: Fixes, updates,
 enhancements
In-Reply-To: <cover.1576743874.git.jan.kiszka@siemens.com>
References: <cover.1576743874.git.jan.kiszka@siemens.com>
Message-ID: <20191219181953.GM26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2019-12-19 09:24 +0100, Jan Kiszka spake thusly:
> Changes in v2:
>  - add option to choose git, rather then overloading BR2_PACKAGE_XENOMAI_VERSION
>  - use XENOMAI_AUTORECONF for git
>  - de-capitalize patch subjects
> 
> Jan
> 
> Jan Kiszka (4):
>   package/xenomai: smokey's not a skin
>   package/xenomai: bump version to 3.0.10
>   package/xenomai: allow to pull git revisions
>   package/xenomai: clean up wrappers cleanup

I've applied 1-4-2 in this order, and left 3 out for later review for
the moment.

I'll reply to patch 1 with further comment.

Thanks!

Regards,
Yann E. MORIN.

>  package/xenomai/Config.in    | 28 ++++++++++++++++++++++------
>  package/xenomai/xenomai.hash |  2 +-
>  package/xenomai/xenomai.mk   | 41 +++++++++++++++++++++++------------------
>  3 files changed, 46 insertions(+), 25 deletions(-)
> 
> -- 
> 2.16.4
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
