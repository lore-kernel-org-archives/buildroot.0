From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 22:46:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: fix build with
 gawk 5.0
In-Reply-To: <20190901100733.26379-1-bernd.kuhls@t-online.de>
References: <20190901100733.26379-1-bernd.kuhls@t-online.de>
Message-ID: <20190907224629.54b3dee8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Sep 2019 12:07:33 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/e81/e815bed0e7b3d9cbf50ebf605666a50e7032e5a1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libgpg-error/0001-gawk5-support.patch | 162 ++++++++++++++++++
>  package/libgpg-error/libgpg-error.mk          |   2 +
>  2 files changed, 164 insertions(+)
>  create mode 100644 package/libgpg-error/0001-gawk5-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
