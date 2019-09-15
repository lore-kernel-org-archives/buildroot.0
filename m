From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:33:55 +0200
Subject: [Buildroot] [PATCH] libpjsip: bump to 2.9
In-Reply-To: <20190905100109.16456-1-luca@lucaceresoli.net>
References: <20190905100109.16456-1-luca@lucaceresoli.net>
Message-ID: <20190915223355.04e136ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

On Thu,  5 Sep 2019 12:01:09 +0200
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> Updates:
>  - remove patch now upstream
>  - remove --disable-oss, not supported anymore
>  - 2.9 supports gnutls, add optional dependency
>  - bonus: switch to https for downloading
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  ...1-Fixed-possible-function-name-clash.patch | 26 -------------------
>  package/libpjsip/libpjsip.hash                |  6 ++---
>  package/libpjsip/libpjsip.mk                  |  8 +++---
>  3 files changed, 8 insertions(+), 32 deletions(-)
>  delete mode 100644 package/libpjsip/0001-Fixed-possible-function-name-clash.patch

Applied to master, thanks. Small nit: we now like to prefix the commit
title of such patches with "package/libpjsip" and not just "pjsip".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
