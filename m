From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 23:49:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/lightning: bump version to 2.1.0
In-Reply-To: <1454189857-31490-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454189857-31490-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131234915.7396a0b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 22:37:37 +0100, Bernd Kuhls wrote:
> Removed autoreconf and both patches after upstream commits:
> http://git.savannah.gnu.org/cgit/lightning.git/commit/configure.ac?id=e98640e1ac160034fe65346f68c5ade90d6b2032
> http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=361caf28545aa0c2b2ab8d1cbd334fbdd952f373
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-cross-compilation-configure-fixes.patch   | 40 ----------------
>  .../0002-ppc-disassembler-build-fix.patch          | 53 ----------------------
>  package/lightning/lightning.hash                   |  2 +-
>  package/lightning/lightning.mk                     |  5 +-
>  4 files changed, 2 insertions(+), 98 deletions(-)
>  delete mode 100644 package/lightning/0001-cross-compilation-configure-fixes.patch
>  delete mode 100644 package/lightning/0002-ppc-disassembler-build-fix.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
