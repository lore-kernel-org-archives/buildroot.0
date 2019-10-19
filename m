From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 19 Oct 2019 17:51:28 -0300
Subject: [Buildroot] [PATCH RESEND] configs/imx6-sabresd_qt5: Select the
 KMSRO gallium driver
In-Reply-To: <7816e6da-d2ac-7583-8247-539088caa68b@mind.be>
References: <20191019193059.21532-1-festevam@gmail.com>
 <7816e6da-d2ac-7583-8247-539088caa68b@mind.be>
Message-ID: <CAOMZO5D2Fv7MwFszbngkG2rgsLRON3+0QeuS-ZmQYG72yr5qxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Oct 19, 2019 at 5:27 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  I still find it weird that it's necessary to select 3 different drivers... But
> OK. Applied to master, thanks.

I will send a patch removing BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
as per Thomas' feedback.

Thanks
