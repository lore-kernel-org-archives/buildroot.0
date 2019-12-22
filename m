From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Dec 2019 11:27:57 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx8qxpmek: Update to 4.14.98
 components
In-Reply-To: <20191222140638.7812b531@windsurf>
References: <20191217181855.3508-1-festevam@gmail.com>
 <20191217181855.3508-2-festevam@gmail.com>
 <20191222140638.7812b531@windsurf>
Message-ID: <CAOMZO5CL6xoGUcsRJJY=dep8+6wMMk1uT9qymQJNCSuPk+2gzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 22, 2019 at 10:06 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 17 Dec 2019 15:18:55 -0300
> Fabio Estevam <festevam@gmail.com> wrote:
>
> > Bump kernel, ATF and U-Boot to the versions found in the NXP BSP 4.14.98.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  configs/freescale_imx8qxpmek_defconfig | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> I've marked this patch as Changes Requested. Can you send a new
> iteration once the issues are resolved?

As you already applied Julien's patch:
package/freescale-imx/imx-sc-firmware: bump to version 1.2.1

It is safe to apply this one now as Julien's patch fixed the boot issue.

Thanks
