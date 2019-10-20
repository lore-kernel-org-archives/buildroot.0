From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:38:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/libdvdnav: bump version to 6.0.1
In-Reply-To: <20191020093333.31368-2-bernd.kuhls@t-online.de>
References: <20191020093333.31368-1-bernd.kuhls@t-online.de>
 <20191020093333.31368-2-bernd.kuhls@t-online.de>
Message-ID: <20191020153845.5ddeb6d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 11:33:33 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://code.videolan.org/videolan/libdvdnav/blob/master/ChangeLog
> 
> Removed patch after upstream added a different detection code for OS/2:
> https://code.videolan.org/videolan/libdvdnav/commit/ed3d4c31e16d976b8b95822570d7ea1f921e26ac
> 
> Build-tested using
> support/config-fragments/autobuild/br-nios2-glibc.config
> 
> Added all hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-do-not-match-nios2-as-os2.patch         | 16 ----------------
>  package/libdvdnav/libdvdnav.hash                 |  8 ++++++--
>  package/libdvdnav/libdvdnav.mk                   |  4 +---
>  3 files changed, 7 insertions(+), 21 deletions(-)
>  delete mode 100644 package/libdvdnav/0001-do-not-match-nios2-as-os2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
