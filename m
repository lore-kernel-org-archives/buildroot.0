From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:56:52 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/freeswitch: bump version
 to 1.10.5
In-Reply-To: <20200829204005.2815997-3-bernd.kuhls@t-online.de>
References: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
 <20200829204005.2815997-3-bernd.kuhls@t-online.de>
Message-ID: <20200829225652.6e3c5173@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:40:05 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream removed spandsp and sofia-sip from source and now uses external
> packages, removed patch 0001 which fixed a bug in the internal sofia-sip
> code, removed insecure md5 and sha1 hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-sofia-sip-fix-s2tcase.c.patch        | 38 -------------------
>  package/freeswitch/Config.in                  |  2 +
>  package/freeswitch/freeswitch.hash            | 11 +-----
>  package/freeswitch/freeswitch.mk              |  9 ++---
>  4 files changed, 7 insertions(+), 53 deletions(-)
>  delete mode 100644 package/freeswitch/0001-sofia-sip-fix-s2tcase.c.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
