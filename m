From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:10:11 +0200
Subject: [Buildroot] [PATCH v2] package/libxkbcommon: bump version to
 1.0.1
In-Reply-To: <20200915175238.32353-1-ps.report@gmx.net>
References: <20200915175238.32353-1-ps.report@gmx.net>
Message-ID: <20200919221011.7ad904e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 19:52:38 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> - disable enable-xkbregistry (as suggested by documentation [3] and
>   to avoid libxml2 dependency)
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041596.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041609.html
> [3] https://github.com/xkbcommon/libxkbcommon/blob/master/PACKAGING
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - updated to libxkbcommon-1.0.1
> ---
>  package/libxkbcommon/libxkbcommon.hash | 8 +++-----
>  package/libxkbcommon/libxkbcommon.mk   | 7 +++++--
>  2 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
