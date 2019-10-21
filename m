From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:41:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/screen: bump version to 4.7.0
In-Reply-To: <20191021175140.12332-1-bernd.kuhls@t-online.de>
References: <20191021175140.12332-1-bernd.kuhls@t-online.de>
Message-ID: <20191021214146.224885aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 19:51:40 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2019-10/msg00000.html
> 
> Removed patches applied upstream:
> 
> - 0001-compiler-sanity-checks.patch
> https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=6b320186db7df1e58fdd2c836af54c86cc596981
> 
> - 0003-cross-compilation-AC_TRY_RUN.patch
> https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=abba47ce4206506c49858d944e904fff86ae65cc
> 
> - 0004-cross-compilation-ignore-host-fs.patch
> https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=c573b89139e7a068f5573abd565605bed60f293f
> 
> - 0005-avoid-identifying-as-SVR4.patch
> https://git.savannah.gnu.org/cgit/screen.git/commit/?h=v.4.7.0&id=ec90292592dd2c9d5c108390841e3df24e377ed5
> 
> Rebased 0001-no-memcpy-fallback.patch
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../screen/0001-compiler-sanity-checks.patch  |  62 --------
>  ...ck.patch => 0001-no-memcpy-fallback.patch} |   4 +-
>  ...ch => 0002-install-no-backup-binary.patch} |   0
>  .../0003-cross-compilation-AC_TRY_RUN.patch   | 125 -----------------
>  ....patch => 0003-install-always-chmod.patch} |   0
>  ...004-cross-compilation-ignore-host-fs.patch | 132 ------------------
>  ...=> 0004-install-nonversioned-binary.patch} |   0  
>  .../0005-avoid-identifying-as-SVR4.patch      |  54 -------
>  ...ched_h.patch => 0005-rename-sched_h.patch} |   0
>  ...> 0006-comm-h-now-depends-on-term-h.patch} |   0  
>  ...needed-for-list_-display-generic-.o.patch} |   0
>  package/screen/screen.hash                    |   4 +-
>  package/screen/screen.mk                      |   2 +-
>  13 files changed, 6 insertions(+), 377 deletions(-)
>  delete mode 100644 package/screen/0001-compiler-sanity-checks.patch
>  rename package/screen/{0002-no-memcpy-fallback.patch => 0001-no-memcpy-fallback.patch} (96%)
>  rename package/screen/{0006-install-no-backup-binary.patch => 0002-install-no-backup-binary.patch} (100%)
>  delete mode 100644 package/screen/0003-cross-compilation-AC_TRY_RUN.patch
>  rename package/screen/{0007-install-always-chmod.patch => 0003-install-always-chmod.patch} (100%)
>  delete mode 100644 package/screen/0004-cross-compilation-ignore-host-fs.patch
>  rename package/screen/{0008-install-nonversioned-binary.patch => 0004-install-nonversioned-binary.patch} (100%)
>  delete mode 100644 package/screen/0005-avoid-identifying-as-SVR4.patch
>  rename package/screen/{0009-rename-sched_h.patch => 0005-rename-sched_h.patch} (100%)
>  rename package/screen/{0010-comm-h-now-depends-on-term-h.patch => 0006-comm-h-now-depends-on-term-h.patch} (100%)
>  rename package/screen/{0011-comm.h-needed-for-list_-display-generic-.o.patch => 0007-comm.h-needed-for-list_-display-generic-.o.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
