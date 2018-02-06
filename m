From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 15:54:17 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses: bump to 6.1
In-Reply-To: <20180206134603.19957-1-aduskett@gmail.com>
References: <20180206134603.19957-1-aduskett@gmail.com>
Message-ID: <20180206155417.7b8b66bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 08:46:03 -0500, Adam Duskett wrote:
> Remove 0002-recognise-uclinux.patch as it has been applies upstream.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/ncurses/0001-gcc-5.x-MKlib_gen.patch |  5 +++--
>  package/ncurses/0002-recognise-uclinux.patch | 29 ----------------------------
>  package/ncurses/ncurses.hash                 |  2 +-
>  package/ncurses/ncurses.mk                   |  2 +-
>  4 files changed, 5 insertions(+), 33 deletions(-)
>  delete mode 100644 package/ncurses/0002-recognise-uclinux.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
