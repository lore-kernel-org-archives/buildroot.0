From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:41:15 +0100
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to
 1.0.3
In-Reply-To: <20201123205525.1965-1-ps.report@gmx.net>
References: <20201123205525.1965-1-ps.report@gmx.net>
Message-ID: <20201201234115.2d9374fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Nov 2020 21:55:25 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1], changelog:
> 
> - Fix (hopefully) a segfault in xkb_x11_keymap_new_from_device() in some
>   unclear situation (bug introduced in 1.0.2).
> 
> - Fix keymaps created with xkb_x11_keymap_new_from_device() don't have level
>   names (bug introduced in 0.8.0).
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-November/041660.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libxkbcommon/libxkbcommon.hash | 4 ++--
>  package/libxkbcommon/libxkbcommon.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Since 1.0.2 -> 1.0.3 has only two commits, which are bug fixes, I've
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
