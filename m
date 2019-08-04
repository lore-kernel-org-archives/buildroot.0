From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:15:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/xorriso: bump version to 1.5.0
In-Reply-To: <20190804080649.14170-1-bernd.kuhls@t-online.de>
References: <20190804080649.14170-1-bernd.kuhls@t-online.de>
Message-ID: <20190804111545.7eec727f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 10:06:49 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch for sys/xattr.h handling and replaced it with the new
> upstream-provided configure option --disable-xattr-h-pref-attr
> https://dev.lovelyhq.com/libburnia/libisofs/commit/848e039e6d5222b07da7ec810ce4cca1c60bd935
> 
> Removed autoreconf, not needed anymore.
> 
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xorriso/0001-use-sys-xattr.h.patch | 33 ----------------------
>  package/xorriso/xorriso.hash               |  4 ++-
>  package/xorriso/xorriso.mk                 | 19 ++++---------
>  3 files changed, 9 insertions(+), 47 deletions(-)
>  delete mode 100644 package/xorriso/0001-use-sys-xattr.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
