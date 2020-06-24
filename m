From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:22:24 +0200
Subject: [Buildroot] [PATCH 0/2] package/freescale-imx: clean-up proposal
In-Reply-To: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200624192224.GE20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2020-06-24 17:23 +0200, Stephane Viau spake thusly:
> Here is - as promised [1] - a patch set whose aim is to clean up the
> firmware-imx package. I believe this may help installing EPDC fw, SDMA FW
> and so on based on the actual need from each platform and respond to [2].

On principle, I like what you've proposed in this series. I haven't
looked the details, though, and I will let the imx experts chime-in to
validate the conditions udner which each firmware files are installed.

Regards,
Yann E. MORIN.

> BR,
> Stephane.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-June/284032.html
> [2] http://lists.busybox.net/pipermail/buildroot/2020-June/285218.html
> 
> Stephane Viau (2):
>   package/freescale-imx: Add option for all i.MX FW needs
>   package/freescale-imx/firmware-imx: Clean up the image/target semantic
> 
>  package/freescale-imx/Config.in                    | 39 ++++++++++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 70 +++++++++++++++++-----
>  2 files changed, 93 insertions(+), 16 deletions(-)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
