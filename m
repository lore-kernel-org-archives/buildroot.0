From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:43:05 +0200
Subject: [Buildroot] [PATCH v2 1/6] squashfs: bump version to
 e38956b92f738518c29734399629e7cdb33072d3
In-Reply-To: <20180409200429.22650-1-ps.report@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
Message-ID: <20180412234305.378033ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 22:04:24 +0200, Peter Seiderer wrote:
> - delete patch 0001-musl.patch (superseeded by upstream commit [1])
> - disable new zstd support for host/target
> 
> [1] https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git/commit/?id=a81678d6a698b8a016f9abac9f3d981281cc52eb
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - split off zstd support to extra patches (suggested by Yann E. MORIN)
> ---
>  package/squashfs/0001-musl.patch | 71 ----------------------------------------
>  package/squashfs/squashfs.hash   |  2 +-
>  package/squashfs/squashfs.mk     |  7 ++--
>  3 files changed, 5 insertions(+), 75 deletions(-)
>  delete mode 100644 package/squashfs/0001-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
