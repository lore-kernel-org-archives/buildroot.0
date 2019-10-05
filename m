From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:33:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.92.3
In-Reply-To: <20190929071718.23306-1-bernd.kuhls@t-online.de>
References: <20190929071718.23306-1-bernd.kuhls@t-online.de>
Message-ID: <20191005223349.07752ad9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 09:17:18 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ix-buffer-overflow-in-string_vformat.patch | 44 -------------------
>  package/exim/exim.hash                        |  2 +-
>  package/exim/exim.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 46 deletions(-)
>  delete mode 100644 package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
