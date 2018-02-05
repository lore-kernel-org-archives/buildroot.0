From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 18:18:26 +0100
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.15
In-Reply-To: <20180205083141.7726-1-martink@posteo.de>
References: <20180205083141.7726-1-martink@posteo.de>
Message-ID: <20180205181826.7d989d69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Feb 2018 09:31:41 +0100, Martin Kepplinger wrote:
> This updates x11vnc from 0.9.14 to 0.9.15. The cherry-picked patch is now
> part of the release.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  ...r-detection-when-using-without-crypt-cryp.patch | 27 ----------------------
>  package/x11vnc/x11vnc.hash                         |  2 +-
>  package/x11vnc/x11vnc.mk                           |  2 +-
>  3 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
