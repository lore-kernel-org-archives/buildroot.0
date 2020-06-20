From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:10:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: bumpv ersion to
 1.2.3.1
In-Reply-To: <20200620181726.1938758-1-bernd.kuhls@t-online.de>
References: <20200620181726.1938758-1-bernd.kuhls@t-online.de>
Message-ID: <20200620221036.5ab861c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 20:17:26 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch which was committed upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-dlmisc.c-fix-uclibc-build.patch      | 37 -------------------
>  package/alsa-lib/alsa-lib.hash                |  2 +-
>  package/alsa-lib/alsa-lib.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/alsa-lib/0002-dlmisc.c-fix-uclibc-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
