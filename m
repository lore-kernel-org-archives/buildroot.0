From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sat, 30 Jan 2010 08:58:08 -0800 (PST)
Subject: [Buildroot] Buildroot How-To for QEMU/ARM
In-Reply-To: <hjpohq$hh6$1@ger.gmane.org>
References: <413172.3712.qm@web44802.mail.sp1.yahoo.com>
	<hjpohq$hh6$1@ger.gmane.org>
Message-ID: <121365.32593.qm@web44802.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

  > Here's the .config file I last used -- AFAIR it was working at
  > that point:

I tried your .config file and was still unsuccessful with QEMU.

I diffed your .config file against that produced by 'make integrator926_defconfig', and there were no signficant differences.

Perhaps I am not having a Buildroot issue, but a QEMU invocation issue.

Do you recall the qemu-system-arm invocation that worked for you with the Linux kernel and RFS created by buildroot-2009.11?

Thanks.

Jim



----- Original Message ----
From: Grant Edwards <grant.b.edwards@gmail.com>
To: buildroot at uclibc.org
Sent: Wed, January 27, 2010 10:10:35 AM
Subject: Re: [Buildroot] Buildroot How-To for QEMU/ARM

On 2010-01-27, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> Hello,
>
> I can build qemu-0.12.2 under Ubuntu 9.10 and boot Linux in
> QEMU using the pre-built kernel and RFS in arm-test-0.2, also
> from the QEMU project.
>
> Now I want to use QEMU to boot a Linux kernel and RFS that I
> built myself for ARM using buildroot-2009.11.
>
> I have not had much luck. Based on web searching, I have tried
> twisting knobs in 'make menuconfig' and rebuilt perhaps a
> couple of dozen times.
>
> Rather than do a core dump here of the details, I thought I
> would ask:
>
> Has anyone used buildroot-2009.11 to build a kernel and RFS
> for ARM that boot successfully under qemu-0.12.2?

I built for arm-integrator using HEAD back in
November/December, and it ran fine on qemu-0.9.1.  I didn't do
much with it other than boot it up, log in, and test the
virtual serial ports.

> Do step-by-step notes exist for how to do this for ARM that
> were written for these latest versions of Buildroot and QEMU,
> or that have been verified as still complete and correct?

Not that I've found.  There were some articles written a couple
years ago that have step-by-step instructions, but they're
missing a step or two and are also now out of date in a few
spots.

Here's the .config file I last used -- AFAIR it was working at
that point:

# Automatically generated make config: don't edit
# Wed Dec 16 09:10:07 2009
#
<snip>

-- 
Grant Edwards                   grante             Yow! I'm having fun
                                  at               HITCHHIKING to CINCINNATI
                              visi.com            or FAR ROCKAWAY!!

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot



      
