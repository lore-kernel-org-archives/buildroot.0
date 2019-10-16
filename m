From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:47:33 +0200
Subject: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.32
In-Reply-To: <20191015170218.GA28628@waldemar-brodkorb.de>
References: <20191015170218.GA28628@waldemar-brodkorb.de>
Message-ID: <20191016214733.014de001@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 19:02:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Remove all patches, since they were already applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...1-statfs.h-sync-generic-header-with-glibc.patch | 169 --------------------
>  .../0002-xtensa-add-custom-bits-poll.h.patch       |  93 -----------
>  ...3-preadv-pwritev-fix-offset-argument-type.patch |  71 ---------
>  .../uclibc/0004-sparc-remove-asm-constraint.patch  |  40 -----
>  ...-PowerPC-sync-with-termios-fix-from-glibc.patch | 172 ---------------------
>  package/uclibc/uclibc.hash                         |   4 +-
>  package/uclibc/uclibc.mk                           |   2 +-
>  7 files changed, 3 insertions(+), 548 deletions(-)
>  delete mode 100644 package/uclibc/0001-statfs.h-sync-generic-header-with-glibc.patch
>  delete mode 100644 package/uclibc/0002-xtensa-add-custom-bits-poll.h.patch
>  delete mode 100644 package/uclibc/0003-preadv-pwritev-fix-offset-argument-type.patch
>  delete mode 100644 package/uclibc/0004-sparc-remove-asm-constraint.patch
>  delete mode 100644 package/uclibc/0005-PowerPC-sync-with-termios-fix-from-glibc.patch

Applied to master, thanks. Glad to see a new uClibc release!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
