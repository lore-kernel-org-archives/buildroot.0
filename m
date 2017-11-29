From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:37:20 +0100
Subject: [Buildroot] [PATCH next] uclibc: update to 1.0.27
In-Reply-To: <20171128064757.GA27901@waldemar-brodkorb.de>
References: <20171128064757.GA27901@waldemar-brodkorb.de>
Message-ID: <20171129213720.56c5d87c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 07:47:57 +0100, Waldemar Brodkorb wrote:
> All patches are upstream.
> C-sky support added. Lot of or1k NPTL bugfixes.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/0001-fix-issues-with-gdb-8.0.patch  |  72 ---------------
>  ...handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch |  42 ---------
>  ...03-convert-accept4-to-use-cancel.h-macros.patch | 102 ---------------------
>  package/uclibc/uclibc.hash                         |   2 +-
>  package/uclibc/uclibc.mk                           |   2 +-
>  5 files changed, 2 insertions(+), 218 deletions(-)
>  delete mode 100644 package/uclibc/0001-fix-issues-with-gdb-8.0.patch
>  delete mode 100644 package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch
>  delete mode 100644 package/uclibc/0003-convert-accept4-to-use-cancel.h-macros.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
