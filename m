From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 22:09:30 +0200
Subject: [Buildroot] [PATCH] Revert "toolchain-external: CodeSourcery
 NiosII 2015.11 affected by PR19405"
In-Reply-To: <20170506135420.12274-1-romain.naour@gmail.com>
References: <20170506135420.12274-1-romain.naour@gmail.com>
Message-ID: <20170507220930.137da1d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 15:54:20 +0200, Romain Naour wrote:
> An autobuilder exception has been added to avoid testing qt gui module
> with the CodeSourcery NiosII toolchain. This allow to remove the
> BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 symbol.
> 
> This reverts commit 5dce3c05b5ea38539f6ee6efc24c13db936260dc.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/opencv/Config.in                                           | 7 -------
>  package/opencv3/Config.in                                          | 5 ++---
>  package/pinentry/Config.in                                         | 4 ----
>  package/poppler/Config.in                                          | 4 ----
>  package/qt/Config.in                                               | 7 -------
>  package/qwt/Config.in                                              | 6 +-----
>  toolchain/toolchain-common.in                                      | 4 ----
>  .../toolchain-external-codesourcery-niosII/Config.in               | 1 -
>  8 files changed, 3 insertions(+), 35 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
