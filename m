From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 23:23:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump to
 version 1.2.3
In-Reply-To: <20191226215700.210070-1-fontaine.fabrice@gmail.com>
References: <20191226215700.210070-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226232321.56b599b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 22:57:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump fixes the build failure with boost 1.72 thanks to
> https://github.com/arvidn/libtorrent/commit/48fa5343b5d99416ba9606f5f52fba58b93dffe6
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/7d494bff409bbf39ea59df7a2d1cfb3018b4d9a6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
>  package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
