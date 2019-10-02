From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:05:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/powertop: bump to version 2.11
In-Reply-To: <20191002180017.7697-1-fontaine.fabrice@gmail.com>
References: <20191002180017.7697-1-fontaine.fabrice@gmail.com>
Message-ID: <20191002210506.4d2c7e15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 20:00:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop second patch (not needed since
> https://github.com/fenrus75/powertop/commit/ac576038b25a82cf8729b738e004ea2b306da3cc)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-wakeup_xxx.h-include-limits.h.patch  | 54 -------------------
>  package/powertop/powertop.hash                |  2 +-
>  package/powertop/powertop.mk                  |  4 +-
>  3 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 package/powertop/0002-wakeup_xxx.h-include-limits.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
