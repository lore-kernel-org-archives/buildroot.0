From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:39:02 +0100
Subject: [Buildroot] [PATCH] package/gcc: bump to version 8.4.0
In-Reply-To: <20200309235030.12587-1-romain.naour@smile.fr>
References: <20200309235030.12587-1-romain.naour@smile.fr>
Message-ID: <20200322153902.3cb8edde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 00:50:30 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Remove upstream patch [1].
> Rebase and rename 0002-xtensa-fix-PR-target-91880.patch
> 
> Tested using gitlab w/ Qemu runtime testing series [2] [3].
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=fba5d9b4c0f4488281efbeef56c100bb52e55165
> [2] https://gitlab.com/kubu93/buildroot/pipelines/124684030
> [3] http://patchwork.ozlabs.org/project/buildroot/list/?series=159088
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...nsa-backport-fix-for-PR-target-90922.patch | 43 -------------------
>  .../0001-xtensa-fix-PR-target-91880.patch}    | 10 +++--
>  package/gcc/Config.in.host                    |  2 +-
>  package/gcc/gcc.hash                          |  4 +-
>  4 files changed, 9 insertions(+), 50 deletions(-)
>  delete mode 100644 package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
>  rename package/gcc/{8.3.0/0002-xtensa-fix-PR-target-91880.patch => 8.4.0/0001-xtensa-fix-PR-target-91880.patch} (86%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
