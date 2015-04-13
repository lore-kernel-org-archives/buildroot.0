From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:38:48 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.4.1
In-Reply-To: <1428957381-20716-1-git-send-email-ps.report@gmx.net>
References: <1428957381-20716-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150413223848.6706e764@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 13 Apr 2015 22:36:21 +0200, Peter Seiderer wrote:
> See [1] for details.
> 
> Additional remove upstream committed patch (and autoreconf variable
> from makefile).
> 
> [1] http://lists.freedesktop.org/archives/input-tools/2015-April/001166.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...t-static-link-in-case-of-shared-only-buil.patch | 48 ----------------------
>  package/libevdev/libevdev.hash                     |  4 +-
>  package/libevdev/libevdev.mk                       |  5 +--
>  3 files changed, 3 insertions(+), 54 deletions(-)
>  delete mode 100644 package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
