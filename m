From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:00:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: bump to version
 2.35.2
In-Reply-To: <20200608171824.106106-1-fontaine.fabrice@gmail.com>
References: <20200608171824.106106-1-fontaine.fabrice@gmail.com>
Message-ID: <20200610230008.28a09a3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jun 2020 19:18:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop fourth and sixth patches (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0004-include-cleanup-pidfd-inckudes.patch} |   0
>  ...-types.h-before-checking-SYS_pidfd_s.patch |  62 --------
>  ...t-sector-size-ignore-unknown-headers.patch | 138 ------------------
>  package/util-linux/util-linux.hash            |  14 +-
>  package/util-linux/util-linux.mk              |   2 +-
>  5 files changed, 8 insertions(+), 208 deletions(-)
>  rename package/util-linux/{0005-include-cleanup-pidfd-inckudes.patch => 0004-include-cleanup-pidfd-inckudes.patch} (100%)
>  delete mode 100644 package/util-linux/0004-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
>  delete mode 100644 package/util-linux/0006-libfdisk-script-accept-sector-size-ignore-unknown-headers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
