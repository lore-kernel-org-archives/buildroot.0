From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sun, 18 Feb 2018 14:55:24 +0100
Subject: [Buildroot] [PATCH 2/3] imx-atf: new package
In-Reply-To: <20180218134603.j25zh3qxb2l6dt34@sapphire.tkos.co.il>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-3-git-send-email-karl.erik.larsson@gmail.com>
 <20180218134603.j25zh3qxb2l6dt34@sapphire.tkos.co.il>
Message-ID: <CAPP7BN3gnngU6w9jKHsvQp_=AAUEabDQdRc7ScsU_99OYHD+Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

2018-02-18 14:46 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Erik,
>
> On Sun, Feb 18, 2018 at 02:28:30PM +0100, Erik Larsson wrote:
> > Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> > ---
> >  package/freescale-imx/Config.in            |  4 ++++
> >  package/freescale-imx/imx-atf/Config.in    |  5 +++++
> >  package/freescale-imx/imx-atf/imx-atf.hash |  3 +++
> >  package/freescale-imx/imx-atf/imx-atf.mk   | 23 +++++++++++++++++++++++
> >  4 files changed, 35 insertions(+)
> >  create mode 100644 package/freescale-imx/imx-atf/Config.in
> >  create mode 100644 package/freescale-imx/imx-atf/imx-atf.hash
> >  create mode 100644 package/freescale-imx/imx-atf/imx-atf.mk
>
> We have an arm-trusted-firmware already at boot/arm-trusted-firmware/. Any
> reason you can't use that?
>

Sorry to say, but I completely missed that there already where an
ATF-package. After a first glance there shouldn't be any reason not to use
boot/arm-trusted-firmware. I will look into this.


>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180218/06346e60/attachment.html>
