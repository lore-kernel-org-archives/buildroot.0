From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 26 Nov 2018 08:13:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: allow enabling virtual
 filesystem
In-Reply-To: <20181124145435.04b963a4@windsurf>
References: <1542900100-13157-1-git-send-email-etienne.carriere@linaro.org>
 <20181124145435.04b963a4@windsurf>
Message-ID: <CAN5uoS9LF2keQeAk8_udu+dN4Zhyi48usBYFjfX4J_yLnh=kOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 24 Nov 2018 at 14:54, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu, 22 Nov 2018 16:21:40 +0100, Etienne Carriere wrote:
>
> > +config BR2_PACKAGE_HOST_QEMU_VIRTFS
> > +     bool "Enable virtual filesystem in Qemu emulator"
>
> I've reworded this to:
>
>         bool "Virtual filesystem support"
>
> to be more consistent with the existing VDE2 option. Indeed, indicating
> "Enable" in an option is not very useful: it's pretty obvious than an
> option is here to "Enable" something. Also the "in Qemu emulator" is
> not very useful either, since the option being added is already a
> sub-option of the main host-qemu option.
>
> I've applied to next after this minor change. Thanks!

Hello Thomas,

Ok, thanks a lot.

etienne

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
