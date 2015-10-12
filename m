From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:19:16 +0200
Subject: [Buildroot] [PATCH v2 1/2] libevdev: bump version to 1.4.4
In-Reply-To: <1444600593-27026-1-git-send-email-ps.report@gmx.net>
References: <1444600593-27026-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151012211916.4ca060d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 11 Oct 2015 23:56:32 +0200, Peter Seiderer wrote:
> From [1]:
> 
> A couple of cleanups, one notable fix: we now transparently fix invalid
> ABS_MT_TRACKING_ID ranges to something sensible.
> 
> The touchpad-edge-detector tool prints out suggested hwdb rules for
> resolution overrides. And since the resolution is the main thing to fix on a
> device, the libevdev-tweak-device now has a --resolution argument to quickly
> set the resolution on the x/y axes.
> 
> [1] http://lists.freedesktop.org/archives/input-tools/2015-August/001210.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  package/libevdev/libevdev.hash | 4 ++--
>  package/libevdev/libevdev.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
