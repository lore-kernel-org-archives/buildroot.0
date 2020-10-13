From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 13 Oct 2020 10:28:58 -0300
Subject: [Buildroot] [PATCH 0/5] board/udoo: bsp updates and cleanup
In-Reply-To: <20201010063022.448414-1-geomatsi@gmail.com>
References: <20201010063022.448414-1-geomatsi@gmail.com>
Message-ID: <CAOMZO5BgpZ8zaF-5rHTjZL5AHJ2o3J1Aq7wsNEpnUzcmMY-qWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Sat, Oct 10, 2020 at 3:24 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Fabio and all,
>
> Here is a patch series for Udoo boards with BSP updates and several minor
> cleanups required to make updated BSP work out of the box.
> Major changes include:
>
> - bump Linux kernel to 5.8.13
> - bump U-Boot to 2020.10
> - udoo/mx6qdl: disable usbh1 in dts rather than in kernel configuration
> - use common image generation files for udoo boards

Thanks for the series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
