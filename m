From: Stanislav Bogatyrev <realloc@gmail.com>
Date: Wed, 17 Nov 2010 19:55:50 +0300
Subject: [Buildroot] OF FDT compilation support
In-Reply-To: <20101117171818.78c65dda@surf>
References: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
	<20101117171818.78c65dda@surf>
Message-ID: <AANLkTimZ5+ZR9NRUXcKar85opvjCvwR1eT35+RPQLRVd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

-Choose PowerPC architecture
- In `Linux Kernel` section enable `Compile OpenFirmware Flattened Device Tree`
- Provide a list of board you want to build device trees for, without
.dts extension. The list can be found in arch/powerpc/boot/dts/
- Choose output format
- Provide some options fot device tree compiler if necessary
- Get your device trees in output/images/


Best regards,
Stanislav Bogatyrev aka realloc()



On Wed, Nov 17, 2010 at 7:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello!
>
> On Wed, 17 Nov 2010 14:49:06 +0300
> Stanislav Bogatyrev <realloc@gmail.com> wrote:
>
>> Here is a little patch to support OpenFirmware Flattened Device Tree
>> compilation.
>> I didn't found how to do it with vanilla buildroot source, so this is
>> added this to kernel compilation makefile, maybe it's better to put it
>> somewhere else.
>
> Thanks!
>
> Could you describe a typical use case for this ? I.e, how would a
> Buildroot user make use of this new feature ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
