From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 8 Mar 2019 20:04:15 -0300
Subject: [Buildroot] QT 5.6 app with eglfs and etnaviv (imx6 solo,
 buildroot 2018.02.5)
In-Reply-To: <20190308235223.62e76a71@gmx.net>
References: <CAE58QoMfF2Kwi0Hc_yOeOinoLA-82OfzzeymOBXsjMK=nYoK5g@mail.gmail.com>
 <20190308235223.62e76a71@gmx.net>
Message-ID: <CAOMZO5DYCL3ENfoc8tYdNs3XFAurTaoe5Y8ho2CDB2+iYX2zQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Juan,

On Fri, Mar 8, 2019 at 7:52 PM Peter Seiderer <ps.report@gmx.net> wrote:

> > I'm obviously missing something here. Any help would be very much appreciated.
>
> Mind to share your complete .config/defconfig?
>
> Did your run an complete re-build (make clean; make), see [1]?

Besides Peter's suggestion, you may try to look at
configs/imx6-sabresd_qt5_defconfig, which generates a QT demo using
Etnaviv.

I wrote some notes about it at:
https://imxdev.gitlab.io/tutorial/Running_QT5.9_with_mainline_kernel_on_mx6sabresd_board/

Hope this helps.

Regards,

Fabio Estevam
