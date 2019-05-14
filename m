From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 08:33:23 +0200
Subject: [Buildroot] [PATCH 2/6] boot/optee-os: bump version to 3.5.0
In-Reply-To: <20190513231215.6b080031@windsurf.home>
References: <20190513201602.2549-1-etienne.carriere@linaro.org>
 <20190513201602.2549-2-etienne.carriere@linaro.org>
 <20190513231215.6b080031@windsurf.home>
Message-ID: <CAN5uoS8WRz32mCpXAdMGK29exopKxwwQbtK4Q-N4Z4XU=kzVEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 13 May 2019 at 23:12, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> On Mon, 13 May 2019 22:15:58 +0200
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> > diff --git a/boot/optee-os/3.5.0/optee-os.hash b/boot/optee-os/3.5.0/optee-os.hash
> > new file mode 100644
> > index 0000000000..167f96475d
> > --- /dev/null
> > +++ b/boot/optee-os/3.5.0/optee-os.hash
>
> I think we should move the optee-os.hash file directly in
> boot/optee-os/. Indeed, in this commit, you forget to remove the
> 3.4.0/optee-os.hash file.

Yes, sorry, I missed that.
Fixing right away.

best regards,
etienne

>
> In the case of the Git version being used, we have:
>
> BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
>
> in the .mk file, so there is anyway no hash check.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
