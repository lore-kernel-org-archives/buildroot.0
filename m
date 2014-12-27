From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:49:08 +0100
Subject: [Buildroot] [PATCH v5 08/15] libdrm: fix support for xserver
 with Vivante drivers
In-Reply-To: <1418132813-32642-9-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-9-git-send-email-jezz@sysmic.org>
Message-ID: <20141227214908.73a2097d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:46 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/libdrm/0001-update-arm.patch | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libdrm/0001-update-arm.patch
> 
> diff --git a/package/libdrm/0001-update-arm.patch b/package/libdrm/0001-update-arm.patch
> new file mode 100644
> index 0000000..8c874bb
> --- /dev/null
> +++ b/package/libdrm/0001-update-arm.patch
> @@ -0,0 +1,37 @@
> +[Adapted from yocto project]
> +
> +Add ARM support into xf86arm.h.  This provides support for Xorg interface.

xf86arm -> xf86drm.

Committed with this fixed.

If you've successfully tested this, can you send a Tested-by to
upstream libdrm to ensure the patch gets merged at some point?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
