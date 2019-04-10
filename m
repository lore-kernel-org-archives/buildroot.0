From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:25:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump version to 4.0.0
In-Reply-To: <20190407195940.5655-1-bernd.kuhls@t-online.de>
References: <20190407195940.5655-1-bernd.kuhls@t-online.de>
Message-ID: <20190410192522.7c51b4b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Apr 2019 21:59:40 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch 0002, applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-libnfs.c-include-time.h-in-libnfs.c.patch | 35 -------------------
>  package/libnfs/libnfs.hash                    |  2 +-
>  package/libnfs/libnfs.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
