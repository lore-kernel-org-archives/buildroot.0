From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:28:33 +0100
Subject: [Buildroot] [PATCH/next v1] package/libaio: bump version to
 0.3.112
In-Reply-To: <20201202185838.11828-1-ps.report@gmx.net>
References: <20201202185838.11828-1-ps.report@gmx.net>
Message-ID: <20201205212833.28828fe5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Dec 2020 19:58:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
>   (upstream committed [1])
> 
> - remove 0002-Makefile-add-missing-DESTDIR-variable-use.patch
>   (upstream committed [2])
> 
> - remove 0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch
>   (upstream committed [3])
> 
> Changelog (from libaio.spec):
>   - Add async poll support (Christoph Hellwig)
>   - Use canonical DESTDIR= environment variable (Thomas Petazzoni)
>   - Add ability to disable building the shared library (Thomas Petazzoni)
> 
> [1] https://pagure.io/libaio/c/970196192771eeda39fabcc59a5dae9613e871a8.patch
> [2] https://pagure.io/libaio/c/4059161333a14a0c705efecc5765b6cb2a29ae02.patch
> [3] https://pagure.io/libaio/c/de5775ea1b42ea83e305db9c17372e3f0a8dd3a3.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-ENABLE_SHARED-boolean-to-allow-stat.patch | 56 ------------------
>  ...ile-add-missing-DESTDIR-variable-use.patch | 32 -----------
>  ...t-libgcc-to-avoid-unresolved-symbols.patch | 57 -------------------
>  package/libaio/libaio.hash                    |  4 +-
>  package/libaio/libaio.mk                      |  2 +-
>  5 files changed, 3 insertions(+), 148 deletions(-)
>  delete mode 100644 package/libaio/0001-src-Makefile-add-ENABLE_SHARED-boolean-to-allow-stat.patch
>  delete mode 100644 package/libaio/0002-Makefile-add-missing-DESTDIR-variable-use.patch
>  delete mode 100644 package/libaio/0003-Link-against-libgcc-to-avoid-unresolved-symbols.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
