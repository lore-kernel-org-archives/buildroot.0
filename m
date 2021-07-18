From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:35:19 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix building or1k with
 host gcc version < 5
In-Reply-To: <20210609162753.1138390-1-giulio.benetti@benettiengineering.com>
References: <4db92b61-32e1-f4c0-4986-99ab2b1da09d@gmail.com>
 <20210609162753.1138390-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210718223519.61ef0d82@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed,  9 Jun 2021 18:27:53 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add patches to fix building on hosts that provide gcc version < 5
> (i.e. 4.9), otherwise they fail due to missing default '-std=gnu11' option
> on variable declaration inside for loops.
> 
> The patch is pending upstream:
> https://sourceware.org/pipermail/binutils/2021-June/116884.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  ...or1k-fix-building-with-gcc-version-5.patch | 50 +++++++++++++++++++
>  4 files changed, 200 insertions(+)
>  create mode 100644 package/binutils/2.32/0014-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.34/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.35.2/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch
>  create mode 100644 package/binutils/2.36.1/0007-bfd-elf32-or1k-fix-building-with-gcc-version-5.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
