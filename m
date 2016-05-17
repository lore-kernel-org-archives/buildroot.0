From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:28:15 +0200
Subject: [Buildroot] [PATCH v2] package/gcc: 4.8.x to 5.x: backport a
 fix for building gcc with gcc-6
In-Reply-To: <1463371428-5117-1-git-send-email-s.martin49@gmail.com>
References: <1463371428-5117-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160517222815.7e539789@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 06:03:48 +0200, Samuel Martin wrote:
> When the host system compiler is gcc-6, this patch is needed to build
> Buildroot toolchain and cleanly apply on gcc version 4.8.x to 5.x (not
> needed for 4.7.x series).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - rename patches {ThomasP)
> ---
>  package/gcc/4.8.5/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  package/gcc/4.9.3/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  package/gcc/5.3.0/130-fix_build_with_gcc-6.patch   | 153 +++++++++++++++++++++
>  .../gcc/arc-2015.12/130-fix_build_with_gcc-6.patch | 153 +++++++++++++++++++++
>  4 files changed, 612 insertions(+)
>  create mode 100644 package/gcc/4.8.5/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/4.9.3/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/5.3.0/130-fix_build_with_gcc-6.patch
>  create mode 100644 package/gcc/arc-2015.12/130-fix_build_with_gcc-6.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
