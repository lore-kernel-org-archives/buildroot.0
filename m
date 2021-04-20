From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 22:33:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: security bump to
 version 2021.04
In-Reply-To: <20210418194332.3464292-1-fontaine.fabrice@gmail.com>
References: <20210418194332.3464292-1-fontaine.fabrice@gmail.com>
Message-ID: <20210420223327.246d8432@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 21:43:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2021-27097: The boot loader in Das U-Boot before 2021.04-rc2
>   mishandles a modified FIT.
> - Fix CVE-2021-27138: The boot loader in Das U-Boot before 2021.04-rc2
>   mishandles use of unit addresses in a FIT.
> 
> - Update second patch
> - Drop fourth patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-tools-only-in-no-dot-config-targets.patch |  6 ++-
>  ...0004-tools-env-fw_env.h-remove-env.h.patch | 52 -------------------
>  package/uboot-tools/uboot-tools.hash          |  2 +-
>  package/uboot-tools/uboot-tools.mk            |  2 +-
>  4 files changed, 6 insertions(+), 56 deletions(-)
>  delete mode 100644 package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
