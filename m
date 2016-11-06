From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 6 Nov 2016 20:06:40 -0200
Subject: [Buildroot] [PATCH 1/2] freescale: Add a standard genimage
 script for MX23/MX28
In-Reply-To: <20161106224429.31666d66@free-electrons.com>
References: <1478459535-20024-1-git-send-email-festevam@gmail.com>
 <20161106224429.31666d66@free-electrons.com>
Message-ID: <CAOMZO5D-V4yWAZFoe+zZi5e=gMB4GzeE=canCABoY7RWUB7oQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 6, 2016 at 7:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> I've applied both to next. However, we now have this a bit weird
> hierarchy:
>
> board/freescale/common/
> ??? genimage.cfg.template
> ??? mxs
> ?   ??? genimage.cfg.template
> ?   ??? post-image.sh
> ??? post-image.sh
>
> Perhaps we should move the i.MX genimage.cfg.template and post-image.sh
> in an imx/ sub-directory? This means adjusting all the defconfig, but
> it can be done mechanically.

Yes, I will prepare a patch that implements this proposal, thanks.
