From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:55:13 +0200
Subject: [Buildroot] [PATCH v2] package/exiv2: bump version to 0.27.3
In-Reply-To: <20200713102512.462644-1-nicolas.serafini@sensefly.com>
References: <20200713102512.462644-1-nicolas.serafini@sensefly.com>
Message-ID: <20200713215513.1c85a1e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 12:25:13 +0200
Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:

> Bump version 0.27.3 and remove 0001[1] and 0002[2] local patches that
> has been upstreamed.
> 
> Release notes:
> https://github.com/Exiv2/exiv2/blob/v0.27.3/releasenotes/releasenotes.txt
> 
> [1]: https://github.com/Exiv2/exiv2/commit/b7890776c62398ca1005e8edc32786859d60fcf7
> [2]: https://github.com/Exiv2/exiv2/commit/1b917c3f7dd86336a9f6fda4456422c419dfe88c
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
> 
> ---
> v2: Remove BSD-3-Clause license attached to removed COPYING-CMAKE-SCRIPTS file
> ---
>  ...k-offset-and-size-against-total-size.patch | 32 -------
>  .../0002-fix_1011_jp2_readmetadata_loop.patch | 86 -------------------
>  package/exiv2/exiv2.hash                      |  3 +-
>  package/exiv2/exiv2.mk                        | 17 +---
>  4 files changed, 4 insertions(+), 134 deletions(-)
>  delete mode 100644 package/exiv2/0001-crwimage-Check-offset-and-size-against-total-size.patch
>  delete mode 100644 package/exiv2/0002-fix_1011_jp2_readmetadata_loop.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
