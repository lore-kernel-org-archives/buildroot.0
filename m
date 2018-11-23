From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 08:33:18 +0100
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: OP-TEE secure world
In-Reply-To: <1606136172.3322721.1542942067336.JavaMail.zimbra@datacom.com.br>
References: <1542900177-17343-1-git-send-email-etienne.carriere@linaro.org>
 <1606136172.3322721.1542942067336.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAN5uoS_x5H300B+=U=yoGWto6G5rSXdBzGuJpWOMEQuye4m5Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 23 Nov 2018 at 04:00, Carlos Santos <casantos@datacom.com.br> wrote:
>
> > From: "Etienne Carriere" <etienne.carriere@linaro.org>
> > To: "buildroot" <buildroot@buildroot.org>
> > Cc: "etienne carriere" <etienne.carriere@linaro.org>
> > Sent: Quinta-feira, 22 de novembro de 2018 13:22:53
> > Subject: [Buildroot] [PATCH 1/5] boot/optee-os: OP-TEE secure world
>
> [...]
> > --- /dev/null
> > +++ b/boot/optee-os/Config.in
> > @@ -0,0 +1,102 @@
> > +config BR2_TARGET_OPTEE_OS
> > +     bool "optee_os"
> > +     depends on BR2_aarch64 || BR2_arm
> > +     select BR2_PACKAGE_OPENSSL # host tool
> > +     help
> > +       OP-TEE OS provides the secure world boot image and the trust
> > +       application development kit of the OP-TEE project. OP-TEE OS
> > +       also provides generic trusted application one can embedded
> > +       into its system.
> > +
> > +       http://github.org/OP-TEE/optee_os
>
> Must be https://github.com/OP-TEE/optee_os

Oups! yes, my mistake.
I fear I did the same mistake in the other OP-TEE packages.
I'll fix. thanks.

>
> --
> Carlos Santos (Casantos) - DATACOM, P&D
> ?Marched towards the enemy, spear upright, armed with the certainty
> that only the ignorant can have.? ? Epitaph of a volunteer
