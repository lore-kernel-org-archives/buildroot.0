From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 22:23:16 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/kmod: bump to version 27
In-Reply-To: <20200223170106.1995474-1-fontaine.fabrice@gmail.com>
References: <20200223170106.1995474-1-fontaine.fabrice@gmail.com>
Message-ID: <20200224222316.0fb9a5e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Feb 2020 18:01:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second and third patches (already in version)
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-undefined-symbols-when-building-the.patch | 75 -------------------
>  ...3-Makefile.am-filter-Wl-no-undefined.patch | 43 -----------
>  package/kmod/kmod.hash                        |  6 +-
>  package/kmod/kmod.mk                          |  4 +-
>  4 files changed, 4 insertions(+), 124 deletions(-)
>  delete mode 100644 package/kmod/0002-Do-not-check-for-undefined-symbols-when-building-the.patch
>  delete mode 100644 package/kmod/0003-Makefile.am-filter-Wl-no-undefined.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
