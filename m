From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:26:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-vfs-rar: bump version to
 2.2.3-Leia
In-Reply-To: <20200329122259.442023-1-bernd.kuhls@t-online.de>
References: <20200329122259.442023-1-bernd.kuhls@t-online.de>
Message-ID: <20200330082651.75341409@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Mar 2020 14:22:59 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated hash of lib/UnrarXLib/license.txt due to upstream changes:
> https://github.com/xbmc/vfs.rar/commits/Leia/lib/UnrarXLib/license.txt
> 
> Changed addon license file to LICENSE.md.
> 
> Updated dependencies due to upstream commit:
> https://github.com/xbmc/vfs.rar/commit/6c7a62439eac2b2afeb2bf8c241836cd2ab2b93e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-vfs-rar/Config.in         | 2 +-
>  package/kodi-vfs-rar/kodi-vfs-rar.hash | 6 +++---
>  package/kodi-vfs-rar/kodi-vfs-rar.mk   | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
