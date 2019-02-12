From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:17:33 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.12.6
In-Reply-To: <20190211205249.15357-1-ps.report@gmx.net>
References: <20190211205249.15357-1-ps.report@gmx.net>
Message-ID: <20190212111733.7a0ee810@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Feb 2019 21:52:49 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Two quirks for specific devices, two little cleanups (for
> details see [1])
> 
> - rebased 0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2019-January/039864.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...d-enable-CPP-include-check-only-in-case-CP.patch | 13 +++++++++----
>  package/libinput/libinput.hash                      | 10 +++++-----
>  package/libinput/libinput.mk                        |  2 +-
>  3 files changed, 15 insertions(+), 10 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
