From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 21:18:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libxkbcommon: bump to
 version 0.10.0 and convert to meson
In-Reply-To: <20200224214716.68647-1-james.hilliard1@gmail.com>
References: <20200224214716.68647-1-james.hilliard1@gmail.com>
Message-ID: <20200226211848.377002ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Feb 2020 14:47:16 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Since version 0.9.x the autotools build system is removed from libxkbcommon
> ([1]), so convert to meson build system.
> 
> Remove the CFLAGS force of '-std=gnu99', believing meson sets it
> automatically (a test build used '-std=c99').
> 
> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040962.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - add more detailed commit message from http://lists.busybox.net/pipermail/buildroot/2019-October/264740.html
> ---
>  package/libxkbcommon/libxkbcommon.hash |  8 ++++----
>  package/libxkbcommon/libxkbcommon.mk   | 12 +++++-------
>  2 files changed, 9 insertions(+), 11 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
