From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:39:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: Bump to v1.5.1
In-Reply-To: <20191025200034.199561-1-titouan.christophe@railnova.eu>
References: <20191025200034.199561-1-titouan.christophe@railnova.eu>
Message-ID: <20191026153938.0c11841c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 22:00:34 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Remove 0002-Makefile-Add-EXTRA_CFLAGS-variable.patch which is now
> applied upstream
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  ...ards-for-older-kernel-u-boot-sources.patch | 13 +++++--
>  ...2-Makefile-Add-EXTRA_CFLAGS-variable.patch | 37 -------------------
>  package/dtc/dtc.hash                          |  2 +-
>  package/dtc/dtc.mk                            |  2 +-
>  4 files changed, 11 insertions(+), 43 deletions(-)
>  delete mode 100644 package/dtc/0002-Makefile-Add-EXTRA_CFLAGS-variable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
