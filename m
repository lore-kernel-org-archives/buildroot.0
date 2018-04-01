From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 13:58:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.9
In-Reply-To: <20180401074822.15607-1-bernd.kuhls@t-online.de>
References: <20180401074822.15607-1-bernd.kuhls@t-online.de>
Message-ID: <20180401135815.7a389997@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 09:48:22 +0200, Bernd Kuhls wrote:
> Changelog:
> https://sourceforge.net/projects/freetype/files/freetype2/2.9/
> 
> Upstream changed its project URL to https in docs/FTL.TXT. We do the
> same in Config.in and update the license hash for docs/FTL.TXT.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freetype/Config.in     |  2 +-
>  package/freetype/freetype.hash | 10 +++++-----
>  package/freetype/freetype.mk   |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
