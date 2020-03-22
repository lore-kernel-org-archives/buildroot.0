From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:22:06 +0100
Subject: [Buildroot] [PATCH] package/gcc: remove stray
 or1k-musl-5.4.0-20170218 patches
In-Reply-To: <20200322211540.556085-1-romain.naour@gmail.com>
References: <20200322211540.556085-1-romain.naour@gmail.com>
Message-ID: <20200322222206.1fe0593a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 22:15:39 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> gcc or1k-musl-5.4.0-20170218 was remove from [1] but the
> patch directory was forgotten.
> 
> [1] f424b8afa22f767dc46cde915efc9a01c86f12c8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../100-uclibc-conf.patch                     |  15 -
>  .../301-missing-execinfo_h.patch              |  13 -
>  .../850-libstdcxx-uclibc-c99.patch            | 273 ------------------
>  .../860-cilk-wchar.patch                      |  56 ----
>  ...libgcc-disable-split-stack-nothreads.patch |  14 -
>  5 files changed, 371 deletions(-)
>  delete mode 100644 package/gcc/or1k-musl-5.4.0-20170218/100-uclibc-conf.patch
>  delete mode 100644 package/gcc/or1k-musl-5.4.0-20170218/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/or1k-musl-5.4.0-20170218/850-libstdcxx-uclibc-c99.patch
>  delete mode 100644 package/gcc/or1k-musl-5.4.0-20170218/860-cilk-wchar.patch
>  delete mode 100644 package/gcc/or1k-musl-5.4.0-20170218/930-libgcc-disable-split-stack-nothreads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
