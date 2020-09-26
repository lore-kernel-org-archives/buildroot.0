From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:44:08 +0200
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.3.6
In-Reply-To: <20200925181717.905681-1-francois.perrad@gadz.org>
References: <20200925181717.905681-1-francois.perrad@gadz.org>
Message-ID: <20200926154408.5cdd4115@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 20:17:17 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../lua/5.3.5/0003-fix-revision-number.patch  | 31 -------------------
>  .../lua/{5.3.5 => 5.3.6}/0001-root-path.patch |  0
>  .../0002-shared-libs-for-lua.patch            |  0
>  .../lua/{5.3.5 => 5.3.6}/0011-linenoise.patch |  0
>  package/lua/lua.hash                          |  5 +--
>  package/lua/lua.mk                            |  2 +-
>  6 files changed, 4 insertions(+), 34 deletions(-)
>  delete mode 100644 package/lua/5.3.5/0003-fix-revision-number.patch
>  rename package/lua/{5.3.5 => 5.3.6}/0001-root-path.patch (100%)
>  rename package/lua/{5.3.5 => 5.3.6}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.3.5 => 5.3.6}/0011-linenoise.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
