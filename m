From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 1 Mar 2011 13:19:18 +0100
Subject: [Buildroot] 2011_02 qt compilation error
In-Reply-To: <20110301124402.25226ea9@surf>
References: <AANLkTimU+hUM71bBWk7VGpsJ8wGsLNKNGqMy19oD1Am5@mail.gmail.com>
	<20110301124402.25226ea9@surf>
Message-ID: <AANLkTik6dtAiO_JOdxr5Fk4yWq99MoE2bGnvGKy5eGKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Mar 1, 2011 at 12:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 1 Mar 2011 11:45:41 +0100
> Belisko Marek <marek.belisko@gmail.com> wrote:
>
>> ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
>> error: output number 1 not directly addressable
>
> Reproduced. It's apparently a bug in gcc 4.5, see
> https://bugs.launchpad.net/gcc-linaro/+bug/675347. I haven't checked if
> there is a workaround at Qt level, but in the mean time, the easiest
> solution is to revert to a gcc 4.4 based toolchain.
Well try with buildroot internat toolchain and result isn't better:

For  real value is
For cortex-a8 real value is cortexa8
Unknown arch used in --with-arch=armv7-a
make[1]: *** [configure-gcc] Error 1
make[1]: *** Waiting for unfinished jobs....

(trying to build for beagleboard).
>
> Regards,
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

thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
