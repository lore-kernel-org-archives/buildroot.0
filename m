From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:13:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/pixman: bump version to 0.38.4
In-Reply-To: <20190410185901.9444-1-bernd.kuhls@t-online.de>
References: <20190410185901.9444-1-bernd.kuhls@t-online.de>
Message-ID: <20190411081332.621b122a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 20:59:01 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch 0002, applied upstream
> https://cgit.freedesktop.org/pixman/commit/?id=7c6066b700c7cdd4aeb8be426b14b3a5f0de4b6c
> 
> Added md5 hash provided by upstream and sha256 hashes for tarball and
> license file.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ivate-include-float.h-only-in-C-code.patch | 46 -------------------
>  package/pixman/pixman.hash                    |  8 +++-
>  package/pixman/pixman.mk                      |  2 +-
>  3 files changed, 7 insertions(+), 49 deletions(-)
>  delete mode 100644 package/pixman/0002-pixman-private-include-float.h-only-in-C-code.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
