From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:05:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump to version 2.44
In-Reply-To: <20201025093407.4843-1-heiko.thiery@gmail.com>
References: <20201025093407.4843-1-heiko.thiery@gmail.com>
Message-ID: <20201025110527.6678012f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 10:34:07 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> - remove patches that are already upstrem
> - modified and renumbered existing patch
> - add CROSS_COMPILE make arg
> - update hashfile for new version
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...namic-test-compilation-and-execution.patch | 224 ------------------
>  ...isable-building-installing-shared-l.patch} |   4 +-
>  ...-of-tcapsh-static-to-sudotest-target.patch |  55 -----
>  package/libcap/libcap.hash                    |   2 +-
>  package/libcap/libcap.mk                      |   3 +-
>  5 files changed, 6 insertions(+), 282 deletions(-)
>  delete mode 100644 package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
>  rename package/libcap/{0003-libcap-Makefile-disable-building-installing-shared-l.patch => 0001-libcap-Makefile-disable-building-installing-shared-l.patch} (86%)
>  delete mode 100644 package/libcap/0002-Migrate-all-uses-of-tcapsh-static-to-sudotest-target.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
