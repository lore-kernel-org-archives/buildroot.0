From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:05:27 +0200
Subject: [Buildroot] [PATCH v1] qt5wayland: remove legacy
 compile-without-QtQuick patch
In-Reply-To: <20181015181826.26194-1-ps.report@gmx.net>
References: <20181015181826.26194-1-ps.report@gmx.net>
Message-ID: <20181020200527.74d2f624@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Oct 2018 20:18:26 +0200, Peter Seiderer wrote:
> Patch was taken from upstream [1], removing it fixes [2]:
> 
>   Applying 0001-fix-compilation-without-QtQuick.patch using patch:
>   patching file src/compositor/compositor_api/compositor_api.pri
>   Reversed (or previously applied) patch detected!  Skipping patch.
>   3 out of 3 hunks ignored -- saving rejects to file src/compositor/compositor_api/compositor_api.pri.rej
>   patching file src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h
>   Reversed (or previously applied) patch detected!  Skipping patch.
>   1 out of 1 hunk ignored -- saving rejects to file src/compositor/hardware_integration/qwlhardwarelayerintegration_p.h.rej
> 
> [1] http://code.qt.io/cgit/qt/qtwayland.git/commit/?id=2c48ee65e8c3b894caec214641723d0777fc60b8
> [2] http://autobuild.buildroot.net/results/0d31817bb4d416d01f4d1bec3e22ce0e5b2ca1c3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...0001-fix-compilation-without-QtQuick.patch | 69 -------------------
>  1 file changed, 69 deletions(-)
>  delete mode 100644 package/qt5/qt5wayland/0001-fix-compilation-without-QtQuick.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
