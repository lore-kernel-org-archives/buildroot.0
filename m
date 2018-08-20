From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 15:23:19 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lynx: bump version to
 2.8.9rel.1
In-Reply-To: <20180819124400.455-1-bernd.kuhls@t-online.de>
References: <20180819124400.455-1-bernd.kuhls@t-online.de>
Message-ID: <20180820152319.2ee11973@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 14:44:00 +0200, Bernd Kuhls wrote:
> Changelog: http://lynx.invisible-island.net/current/CHANGES
> 
> Removed patch 0001, quoted from Changelog:
> * when cross-compiling, trim LDFLAGS from makefile rule linking makeuctb,
>   because it is a build tool, which should generally use BUILD_LDFLAGS
>   (patch by Thomas Petazzoni)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-t-build-host-tools-with-target-LDFL.patch | 41 -------------------
>  package/lynx/lynx.hash                        |  2 +-
>  package/lynx/lynx.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 43 deletions(-)
>  delete mode 100644 package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
