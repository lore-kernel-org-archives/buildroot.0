From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:35:57 +0200
Subject: [Buildroot] [PATCH 08/83 v2] package/libdrm: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <480ef600cac5b7e6233b663c5f779603c302d3b8.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <480ef600cac5b7e6233b663c5f779603c302d3b8.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233557.3bc03785@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:19 +0200, Yann E. MORIN wrote:
> Transform the menu prompt into a comment.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes RFC -> v1:
>   - drop the comment  (Arnout)
> ---
>  package/libdrm/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

I applied, but I discovered afterwards that the result now looks worse
than it was: there is now no indication that the
intel/nouveau/amdgpu/... options are DRM drivers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
