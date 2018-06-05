From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 10:38:36 +0200
Subject: [Buildroot] [PATCH] python-websockets: bump to version 5.0.1
In-Reply-To: <20180605081522.14753-1-yegorslists@googlemail.com>
References: <20180605081522.14753-1-yegorslists@googlemail.com>
Message-ID: <20180605103836.4063764c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 10:15:22 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstream patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0b59939faaefc12cd7da4f26ab86659ac031b008/
> http://autobuild.buildroot.net/results/c0196693cfdbf10b429c5c03684d5308a68c8509/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...ehavior-of-recv-in-the-CLOSING-state.patch | 261 ------------------
>  .../python-websockets/python-websockets.hash  |   4 +-
>  .../python-websockets/python-websockets.mk    |   4 +-
>  3 files changed, 4 insertions(+), 265 deletions(-)
>  delete mode 100644 package/python-websockets/0001-Fix-behavior-of-recv-in-the-CLOSING-state.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
