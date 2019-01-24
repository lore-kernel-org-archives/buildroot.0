From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Jan 2019 10:17:15 -0200
Subject: [Buildroot] imx6 solo VPU support in Buildroot
In-Reply-To: <CAE58QoP-N7wbKjAiZtLgdcVXrmJO6BhwQ0yNFihXyuLLk8MEpg@mail.gmail.com>
References: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
 <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
 <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
 <CAAMH-ytuk2w9Tj19TzrXyU4R1qCqS-=CfLRyGnicJw_dOYK=fQ@mail.gmail.com>
 <CAE58QoM4dqY37hHdoRctcXRg3bnK1RsVHg2g58AixyN-p2qT=g@mail.gmail.com>
 <CAE58QoP-N7wbKjAiZtLgdcVXrmJO6BhwQ0yNFihXyuLLk8MEpg@mail.gmail.com>
Message-ID: <CAOMZO5CNd=GbYaqr2ZB3ymL31tBoxF-nfwyu_HtLVxiCE2xKzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Juan,

On Wed, Jan 23, 2019 at 2:15 PM Juan A. Rubio <jarubio2001@gmail.com> wrote:
>
> Hi,
>
> I'm still chasing the issue of hw-accelerated video playback on my
> imx6 solo custom board.
>
> I'm now using the IMX6Q platform in my Buildroot config but I have not
> switched to a mainline kernel, and I'm still using the nxp kernel
> (imx6dl-sabresd.dts device tree with a few modifications, none of them
> related to the VPU or GPU).

This defconfig from Boundary Devices shows the selection of the NXP
vendor Gstreamer packages and VPU libraries:
https://github.com/boundarydevices/buildroot-external-boundary/blob/cd0df015977533ea5d62c8de010267500aa88df9/configs/nitrogen6x_qt5_gst1_defconfig
