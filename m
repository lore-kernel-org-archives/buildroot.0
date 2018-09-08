From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:10:57 +0200
Subject: [Buildroot] [PATCH 1/1] freeswitch: bump version to 1.8.1
In-Reply-To: <20180907185537.839-1-bernd.kuhls@t-online.de>
References: <20180907185537.839-1-bernd.kuhls@t-online.de>
Message-ID: <20180908151057.26f88e82@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Sep 2018 20:55:37 +0200, Bernd Kuhls wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
> Enables openssl-1.1.x compatible compile.
> 
> - add tiff dependency (bundled tiff source is gone)
> - rebase (and git format) 0001-libvpx-cross.patch patch
> - update libs/srtp/LICENSE file hash (updated copyright year)
> 
> [Bernd]
> - bumped to 1.8.1
> - rebased patch 0001 to the tarball release
> - added hashes for libvpx & libyuv license files
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ch => 0001-Fix-cross-compiling-libvpx.patch} |  6 +++---
>  package/freeswitch/Config.in                    |  1 +
>  package/freeswitch/freeswitch.hash              | 17 +++++++++--------
>  package/freeswitch/freeswitch.mk                |  9 ++++-----
>  4 files changed, 17 insertions(+), 16 deletions(-)
>  rename package/freeswitch/{0001-libvpx-cross.patch => 0001-Fix-cross-compiling-libvpx.patch} (88%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
