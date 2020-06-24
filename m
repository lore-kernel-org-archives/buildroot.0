From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 22:26:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <CAOMZO5Bw4O+mDhVB1x2itxW3pXqdRW=-yU9SCucS0bsa-RhLUQ@mail.gmail.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
 <CAOMZO5Bw4O+mDhVB1x2itxW3pXqdRW=-yU9SCucS0bsa-RhLUQ@mail.gmail.com>
Message-ID: <20200624202640.GL20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, St?phane, All,

On 2020-06-24 17:11 -0300, Fabio Estevam spake thusly:
> Forgot to add one more comment:
> 
> On Wed, Jun 24, 2020 at 12:57 PM Stephane Viau
> <stephane.viau@oss.nxp.com> wrote:
> 
> > +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> 
> Should we name this after the VPU IP name instead? Something like this:
> BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_CODA
> 
> > +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_MALONE

If the VPU code names are pretty commonly known, then yes, that looks
better, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
