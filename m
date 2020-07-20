From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:11:14 +0200
Subject: [Buildroot] [PATCH v1] package/libevdev: bump version to 1.9.1
In-Reply-To: <20200718222911.6684-1-ps.report@gmx.net>
References: <20200718222911.6684-1-ps.report@gmx.net>
Message-ID: <20200720181114.3183763a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 00:29:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> - drop 0001-meson.build-use-local-include-path-for-tools.patch
>   (upstream [2])
> - drop 0003-meson.build-enable-static-library-build.patch
>   (upstream [3])
> 
> [1] https://lists.freedesktop.org/archives/input-tools/2020-July/001541.html
> [2] https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/fe8238a71ae3ad8a776ee35a88fc292f1f006ec7
> [3] https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/a9d324f82bd5e822ea57224000fea43cb64aa214
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ild-use-local-include-path-for-tools.patch | 54 -------------------
>  ...on.build-enable-static-library-build.patch | 30 -----------
>  package/libevdev/libevdev.hash                | 10 ++--
>  package/libevdev/libevdev.mk                  |  2 +-
>  4 files changed, 6 insertions(+), 90 deletions(-)
>  delete mode 100644 package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
>  delete mode 100644 package/libevdev/0003-meson.build-enable-static-library-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
