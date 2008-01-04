From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 4 Jan 2008 11:06:46 -0200
Subject: [Buildroot] The target/device/Atmel mess
In-Reply-To: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
References: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
Message-ID: <d6cda7730801040506h364041e7l5c58d90c3c708d6f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   *bump*

    Ulf, I see you are back from the holidays, perhaps you could give
me a hint on this *smile*. Thanks.

Regards,
   Thiago A. Correa

On Dec 24, 2007 5:47 PM, Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> Hi there,
>
>    I'm trying to update the linux kernel to 2.6.23 (plus patches)
> based on the Atmel buildroot fork, due to critical fixes that finally
> enable booting from the sdcard on the STK1000 (which is the only
> available non-network booting method). But then again, there is a big
> mess in the Atmel folder. Currently we have:
>
>    arch-avr32/kernel-patches-2.6.2*
>    linux/kernel-patches-2.6.2*
>    Linux/kernel-patches-2.6.2*
>
>    And possibly others that I haven't found yet.
>    Is there any reason for it? Is all of them used? Any of them
> deprecated? I added the patches to arch-avr32, to find out that at the
> end of the building, build_avr32/linux-2.6.23 didn't have the patches
> applied. So, now I'm trying again, but this time I placed the patches
> on ALL of those (still building). Is that right?
>
> Kind Regards,
>     Thiago A. Correa
>
