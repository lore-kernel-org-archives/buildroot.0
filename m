From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 16 Jul 2016 17:36:42 -0300
Subject: [Buildroot] [PATCH 1/5] freescale: genimage: Factorize scripts
In-Reply-To: <20160716124125.7ed46855@free-electrons.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
 <20160709064004.8844-2-savoundg@gmail.com>
 <20160716124125.7ed46855@free-electrons.com>
Message-ID: <CAOMZO5CoV5Ng2+_X0MVP_y-1MYPZaxAdJt8H46h5hL+=V2W+Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 16, 2016 at 7:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Peter, Yann, Fabio, could you have a look at this patch and let me know
> what you think?

I really like this patch as it will make it easier to add new i.mx
boards in Buildroot.

> On one hand, yes the genimage.cfg files and post-image scripts for the
> different freescale boards are very similar, so some factorization
> seems to make sense.
>
> On the other hand, the factorization implies a bit of additional
> complexity, which is not that nice for defconfigs, that aim at being
> simple.

It seems to me that the defconfig complexity did not change after this patch.
They only switched to using the common fsl post-image.sh.

Thanks
