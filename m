From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:38:16 +0200
Subject: [Buildroot] [PATCH v1] package/libdrm: bump version to 2.4.107
In-Reply-To: <20210702172101.17142-1-ps.report@gmx.net>
References: <20210702172101.17142-1-ps.report@gmx.net>
Message-ID: <20210720223816.70d16798@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  2 Jul 2021 19:21:01 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - update license file hash (xf86drm.c, license unrelated source code
>   changes [1], [2], [3], [4], [5])
> 
> For details see [6].
> 
> [1] https://cgit.freedesktop.org/mesa/drm/commit/?id=67e911977fbe1f444045f59028c149a04ba29566
> [2] https://cgit.freedesktop.org/mesa/drm/commit/?id=a04b674887586bf05594abaf7c55fd8d630898db
> [3] https://cgit.freedesktop.org/mesa/drm/commit/?id=99a0522aef04e08c6e0be7a7a020f12c51d24c47
> [4] https://cgit.freedesktop.org/mesa/drm/commit/?id=9ae8f17d563a81212ca2f61a3427ed559c105644
> [5] https://cgit.freedesktop.org/mesa/drm/commit/?id=65d89398081b33b7498bccaee6915e977f589ec2
> [6] https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libdrm/libdrm.hash | 8 ++++----
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
