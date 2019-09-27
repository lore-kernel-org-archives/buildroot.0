From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:47:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to version
 d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
In-Reply-To: <20190925171201.11567-1-fontaine.fabrice@gmail.com>
References: <20190925171201.11567-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927224756.422f9d23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 19:12:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch, not needed since:
>   https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git/commit?id=d8cf8d34c0e45899f108ce966826acb0553b4b85
> - Drop second patch, not needed since:
>   https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git/commit?id=bd23a79e34ec7f058426027fbcc1b493f960da90
> - Add mmc.h as a license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../mmc-utils/0001-fix-mmc-h-includes.patch   | 41 -----------------
>  .../0002-fix-overlapping-with-strncpy.patch   | 44 -------------------
>  package/mmc-utils/mmc-utils.hash              |  3 +-
>  package/mmc-utils/mmc-utils.mk                |  3 +-
>  4 files changed, 4 insertions(+), 87 deletions(-)
>  delete mode 100644 package/mmc-utils/0001-fix-mmc-h-includes.patch
>  delete mode 100644 package/mmc-utils/0002-fix-overlapping-with-strncpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
