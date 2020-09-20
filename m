From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:43:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/matio: bump to version 1.5.18
In-Reply-To: <20200920101908.1167169-1-fontaine.fabrice@gmail.com>
References: <20200920101908.1167169-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920154327.1320c03b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 12:19:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - Update hash of COPYING (update in year:
>   https://github.com/tbeu/matio/commit/4638154d738ae1cae3ebac6b86ddcde63e69a92f)
> 
> https://github.com/tbeu/matio/releases/tag/v1.5.18
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Avoid-uninitialized-memory.patch     | 27 -----------
>  .../0002-Fix-illegal-memory-access.patch      | 47 -------------------
>  .../0003-Fix-illegal-memory-access.patch      | 46 ------------------
>  package/matio/0004-Fix-memory-leak.patch      | 39 ---------------
>  package/matio/matio.hash                      |  6 +--
>  package/matio/matio.mk                        | 11 +----
>  6 files changed, 4 insertions(+), 172 deletions(-)
>  delete mode 100644 package/matio/0001-Avoid-uninitialized-memory.patch
>  delete mode 100644 package/matio/0002-Fix-illegal-memory-access.patch
>  delete mode 100644 package/matio/0003-Fix-illegal-memory-access.patch
>  delete mode 100644 package/matio/0004-Fix-memory-leak.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
