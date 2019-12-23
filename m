From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:46:08 +0100
Subject: [Buildroot] [PATCH 2/2] package/libnss: remove patch
In-Reply-To: <20191212140118.90730-3-giulio.benetti@benettiengineering.com>
References: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
 <20191212140118.90730-3-giulio.benetti@benettiengineering.com>
Message-ID: <20191223234608.4349c887@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Dec 2019 15:01:18 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Remove uClibc fix patch since its change has been upstreamed despite the
> comment contained in patch.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ... 0001-add-zlib-include-dir-variable.patch} |  0
>  package/libnss/0001-fix-uclibc-build.patch    | 22 -------------------
>  ...uild-failure-due-to-missing-posix-s.patch} |  0
>  ...ix-PowerPc-build-sys-auxv.h-failure.patch} |  0
>  ...nsinstall.c-build-failure-on-RHEL-7.patch} |  0
>  5 files changed, 22 deletions(-)
>  rename package/libnss/{0002-add-zlib-include-dir-variable.patch => 0001-add-zlib-include-dir-variable.patch} (100%)
>  delete mode 100644 package/libnss/0001-fix-uclibc-build.patch
>  rename package/libnss/{0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch => 0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch} (100%)
>  rename package/libnss/{0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)
>  rename package/libnss/{0005-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch => 0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
