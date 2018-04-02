From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 10:59:45 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: bump to version 3.0.0
In-Reply-To: <20180401201946.13957-1-fontaine.fabrice@gmail.com>
References: <20180401201946.13957-1-fontaine.fabrice@gmail.com>
Message-ID: <20180402105945.1c4debba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 22:19:46 +0200, Fabrice Fontaine wrote:
>  - Remove both patches (applied upstream)
>  - Remove --disable-python as python support has been removed
>  (https://github.com/lxc/lxc/commit/e144a06bd792f99c96395a9d4c16cf7c656fb99d)
>  - Remove lua optional dependency as lua support has been removed
>  (https://github.com/lxc/lxc/commit/b52a5bef6fa56481a6d817f4c73cb91ed012fe2c)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-compilation-on-toolchain-without-prlimit.patch | 98 ----------------------
>  ...-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch | 49 -----------
>  package/lxc/lxc.hash                               |  2 +-
>  package/lxc/lxc.mk                                 | 17 +---
>  4 files changed, 3 insertions(+), 163 deletions(-)
>  delete mode 100644 package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
>  delete mode 100644 package/lxc/0002-lxc-start.c-Fix-legacy-PR_-G-S-ET_NO_NEW_PRIVS-handl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
