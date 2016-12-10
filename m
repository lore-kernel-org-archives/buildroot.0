From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:59:48 +0100
Subject: [Buildroot] [PATCH] uclibc: add various upstream patches
In-Reply-To: <20161210144442.GA11098@waldemar-brodkorb.de>
References: <20161210144442.GA11098@waldemar-brodkorb.de>
Message-ID: <20161210155948.610f38fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 15:44:42 +0100, Waldemar Brodkorb wrote:
> Fix some static linking issues for Xtensa/Blackfin.
> Optimize the size for non-threaded static binaries and
> fix static C/C++ applications when running on the target.
> Fix noMMU madvise declarations.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...s-linux-common-madvise.c-disable-on-noMMU.patch | 31 ++++++++
>  ...-mman.h-remove-madvise-posix_madvise-prot.patch | 36 ++++++++++
>  package/uclibc/0003-bfin-fix-a-gcc-warning.patch   | 25 +++++++
>  ...4-fix-static-linking-for-FDPIC-toolchains.patch | 49 +++++++++++++
>  .../uclibc/0005-xtensa-fix-static-linking.patch    | 60 ++++++++++++++++
>  ...ads-optimize-single-threaded-applications.patch | 83 ++++++++++++++++++++++
>  6 files changed, 284 insertions(+)
>  create mode 100644 package/uclibc/0001-libc-sysdeps-linux-common-madvise.c-disable-on-noMMU.patch
>  create mode 100644 package/uclibc/0002-include-sys-mman.h-remove-madvise-posix_madvise-prot.patch
>  create mode 100644 package/uclibc/0003-bfin-fix-a-gcc-warning.patch
>  create mode 100644 package/uclibc/0004-fix-static-linking-for-FDPIC-toolchains.patch
>  create mode 100644 package/uclibc/0005-xtensa-fix-static-linking.patch
>  create mode 100644 package/uclibc/0006-threads-optimize-single-threaded-applications.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
