From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] libtirpc: bump to version 1.0.3
In-Reply-To: <20180609195522.1958-1-fontaine.fabrice@gmail.com>
References: <20180609195522.1958-1-fontaine.fabrice@gmail.com>
Message-ID: <20180610145740.1a6487c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jun 2018 21:55:22 +0200, Fabrice Fontaine wrote:
> - Remove 0006-include-stdint.h-for-uintptr_t.patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0006-include-stdint.h-for-uintptr_t.patch      | 31 ----------------------
>  package/libtirpc/libtirpc.hash                     |  5 ++--
>  package/libtirpc/libtirpc.mk                       |  2 +-
>  3 files changed, 4 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libtirpc/0006-include-stdint.h-for-uintptr_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
