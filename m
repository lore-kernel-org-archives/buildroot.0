From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:19:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/rhash: bump to version 1.4.2
In-Reply-To: <20210715212305.17382-1-fontaine.fabrice@gmail.com>
References: <20210715212305.17382-1-fontaine.fabrice@gmail.com>
Message-ID: <20210719231924.00e00fd9@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 15 Jul 2021 23:23:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> https://github.com/rhash/RHash/releases/tag/v1.4.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-configure-allow-cross-compilation.patch | 57 -------------------
>  .../0002-configure-add-uclinux-target.patch   | 36 ------------
>  package/rhash/rhash.hash                      |  6 +-
>  package/rhash/rhash.mk                        |  2 +-
>  4 files changed, 4 insertions(+), 97 deletions(-)
>  delete mode 100644 package/rhash/0001-configure-allow-cross-compilation.patch
>  delete mode 100644 package/rhash/0002-configure-add-uclinux-target.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
