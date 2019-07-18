From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 20:39:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.11.0
In-Reply-To: <1563373480-22284-1-git-send-email-pjtexier@koncepto.io>
References: <1563373480-22284-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190718203919.587ac217@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jul 2019 16:24:40 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

>  - Remove patches (already in version)
>  - Upstream does not provide tgz tarball anymore, switch to xz.
>  - Update hash for license file due to copyright year change.
>  - See full changelog https://botan.randombit.net/news.html
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  .../botan/0001-remove-mips64-explicit-mabi.patch   | 20 -------
>  ...Fix-compat-issue-with-upcoming-Boost-1-70.patch | 67 ----------------------
>  ...kefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch | 38 ------------
>  package/botan/botan.hash                           |  4 +-
>  package/botan/botan.mk                             |  4 +-
>  5 files changed, 4 insertions(+), 129 deletions(-)
>  delete mode 100644 package/botan/0001-remove-mips64-explicit-mabi.patch
>  delete mode 100644 package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch
>  delete mode 100644 package/botan/0003-makefile.in-move-LDFLAGS-after-EXE_LINKS_TO.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
