From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:08:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.33.1
In-Reply-To: <20210624090405.32761-1-mf@go-sys.de>
References: <20210624090405.32761-1-mf@go-sys.de>
Message-ID: <20210626150848.63846b05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2021 11:04:05 +0200
Michael Fischer <mf@go-sys.de> wrote:

> patch 0003: already applied upstream
> patch 0004: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...3-update_passwd-fix-context-variable.patch | 41 -------------
>  ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 -------------------
>  package/busybox/busybox.hash                  |  4 +-
>  package/busybox/busybox.mk                    |  5 +-
>  4 files changed, 3 insertions(+), 105 deletions(-)
>  delete mode 100644 package/busybox/0003-update_passwd-fix-context-variable.patch
>  delete mode 100644 package/busybox/0004-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
