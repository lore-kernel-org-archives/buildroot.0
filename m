From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:16:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/xvkbd: bump to version 4.1
In-Reply-To: <20200614205231.893919-1-fontaine.fabrice@gmail.com>
References: <20200614205231.893919-1-fontaine.fabrice@gmail.com>
Message-ID: <20200618221642.2b54e8ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 22:52:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version) and so autoreconf
> - Update hash of README (update in year, version, miscellaneous
>   information)
> - Update indentaton in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Makefile-am-fix-install-data-hook.patch | 27 -------------------
>  package/xvkbd/xvkbd.hash                      |  6 ++---
>  package/xvkbd/xvkbd.mk                        |  4 +--
>  3 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 package/xvkbd/0001-Makefile-am-fix-install-data-hook.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
