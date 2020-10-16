From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 20:12:47 +0200
Subject: [Buildroot] [PATCH] uclibc-ng-test: update to latest git version
In-Reply-To: <20201016040341.nffb6wurjrlbld27@waldemar-brodkorb.de>
References: <20201016040341.nffb6wurjrlbld27@waldemar-brodkorb.de>
Message-ID: <20201016201247.4b04cc70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Oct 2020 06:03:42 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> All patches are upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...scall6-fix-build-with-musl-and-older-kenr.patch | 45 --------------------
>  ...Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch | 43 -------------------
>  ...c-test-nftw.c-fix-build-with-latest-glibc.patch | 42 -------------------
>  ...tst-mqueue4.c-fix-build-with-latest-glibc.patch | 48 ----------------------
>  package/uclibc-ng-test/uclibc-ng-test.mk           |  2 +-
>  5 files changed, 1 insertion(+), 179 deletions(-)
>  delete mode 100644 package/uclibc-ng-test/0001-misc-tst-syscall6-fix-build-with-musl-and-older-kenr.patch
>  delete mode 100644 package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch
>  delete mode 100644 package/uclibc-ng-test/0003-test-misc-test-nftw.c-fix-build-with-latest-glibc.patch
>  delete mode 100644 package/uclibc-ng-test/0004-test-nptl-tst-mqueue4.c-fix-build-with-latest-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
