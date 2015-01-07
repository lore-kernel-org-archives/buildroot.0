From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:57:43 +0100
Subject: [Buildroot] [PATCH] dmalloc: bump version to 5.5.2
In-Reply-To: <20150107130309.GA13648@vostro>
References: <20150107130309.GA13648@vostro>
Message-ID: <20150107225743.0fa7b276@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Wed, 7 Jan 2015 15:03:09 +0200, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/dmalloc/0001-add-fpic.patch           | 16 ++++------
>  package/dmalloc/0002-mips.patch               | 10 +++---
>  package/dmalloc/0003-fix-parallel-build.patch | 12 +++----
>  package/dmalloc/0004-fix-shlibs.patch         | 46 +++++++++++++++++++++++++++
>  package/dmalloc/dmalloc.mk                    |  2 +-
>  5 files changed, 65 insertions(+), 21 deletions(-)
>  create mode 100644 package/dmalloc/0004-fix-shlibs.patch

Thanks, applied. Thanks to Yann for the testing/review.

Alex, could you work with the dmalloc upstream developers and see if
you can get our 4 patches merged upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
