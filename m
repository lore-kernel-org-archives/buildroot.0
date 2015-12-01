From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:43:52 +0100
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151201174352.2ce85a27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear yegorslists at googlemail.com,

On Tue,  1 Dec 2015 09:52:22 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove obsolete compilation error patch and update jimtcl related patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...mpilation-error-in-src-flash-nor-mini51.c.patch | 30 ----------------------
>  ...auto-configuration-to-force-static-librar.patch | 14 +++-------
>  package/openocd/openocd.hash                       |  6 ++---
>  package/openocd/openocd.mk                         |  4 +--
>  4 files changed, 8 insertions(+), 46 deletions(-)
>  delete mode 100644 package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch

Applied to next (soon to be master), thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
