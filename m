From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 17:57:13 +0100
Subject: [Buildroot] [PATCH 1/3] package/owfs: drop unneeded first patch
In-Reply-To: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
References: <20190324221019.10193-1-fontaine.fabrice@gmail.com>
Message-ID: <20190325175714.0553de84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Mar 2019 23:10:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch is not needed since version 3.1p2 and
> https://github.com/owfs/owfs/commit/2982df8ca648bd9cec4d820151046b044ef504e0
> because localtime_r is now correctly checked
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-configure.ac-check-for-localtime_r.patch | 35 -------------------
>  ...1-include-sys-sysmacros.h-for-major.patch} |  0
>  package/owfs/owfs.mk                          |  2 +-
>  3 files changed, 1 insertion(+), 36 deletions(-)
>  delete mode 100644 package/owfs/0001-configure.ac-check-for-localtime_r.patch
>  rename package/owfs/{0002-include-sys-sysmacros.h-for-major.patch => 0001-include-sys-sysmacros.h-for-major.patch} (100%)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
