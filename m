From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:54:03 +0100
Subject: [Buildroot] [PATCHv4] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <20181201091436.7896-1-yann.morin.1998@free.fr>
References: <20181201091436.7896-1-yann.morin.1998@free.fr>
Message-ID: <20181201225403.042e2ed1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 10:14:36 +0100, Yann E. MORIN wrote:
> From: Carlos Santos <casantos@datacom.com.br>
> 
> Some filesystems may want to tweak their output names, rather than using
> the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
> this purpose.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> [yann.morin.1998 at free.fr: fix the patch]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v3 -> v4 (Yann):
>   - fix use of $(strip)
> Changes v2->v3 (Carlos):
>   - Fix typo and use strip instead of qstrip, as spotted by Yann Morin.
> Changes v1->v2 (Carlos):
>   - Prevent leading space when the filesystem gets 'imaginative', as
>     pointed by Yann Morin.
> ---
>  fs/common.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
