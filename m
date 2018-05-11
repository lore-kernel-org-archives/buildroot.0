From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 22:40:12 +0200
Subject: [Buildroot] [PATCH] strace: bump to version 4.22
In-Reply-To: <d297d7a102534e460ed89cf33ad9ee85d4e4ecc5.1525967741.git.baruch@tkos.co.il>
References: <d297d7a102534e460ed89cf33ad9ee85d4e4ecc5.1525967741.git.baruch@tkos.co.il>
Message-ID: <20180511224012.04901aa6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 May 2018 18:55:41 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Update license file hash; copyright year update.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/strace/0001-m68k-fix-build.patch | 97 ------------------------
>  package/strace/strace.hash               |  6 +-
>  package/strace/strace.mk                 |  2 +-
>  3 files changed, 4 insertions(+), 101 deletions(-)
>  delete mode 100644 package/strace/0001-m68k-fix-build.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
