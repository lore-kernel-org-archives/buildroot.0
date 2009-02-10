From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 10 Feb 2009 18:42:08 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<d6cda7730902100917o3aee167fg2ae06ca5e3e402ba@mail.gmail.com>
Message-ID: <08b701c98ba7$906b24f0$f53018ac@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No you have totally misunderstood.
U-Boot will, with my patch use an initial default, but you can
update the linux kernel version and then automatically generate the 
kernel name for tftp download without recompiling u-boot.

That is why you have the os command.

A better implementation would automatically
recompute the linux kernel name when any
part of it is changed.

Best Regards
Ulf Samuelsson



> Hi,
> 
>    Ulf, here. Check the attached patch, this should fix the u-boot
> commands you have added as patches. I'm still building, but the code
> looks ok, so I don't think there will be problems.
>    I think the os command is quite useless, as it says "select the
> kernel version" but there doesn't seam to be any choices at all, but
> anyway, if you want to keep it, it's fixed too. If you want, you can
> apply the patch and commit, I won't commit this directly myself.
> 
> Kind Regards,
>   Thiago A. Correa
>
