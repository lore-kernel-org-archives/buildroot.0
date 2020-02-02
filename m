From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Feb 2020 15:32:23 +0100
Subject: [Buildroot] Upcoming glibc-2.31 breaks busybox, strace.
In-Reply-To: <87r1zdnm4v.fsf@dell.be.48ers.dk>
References: <BN8PR12MB28683E6EF9441AEBAB2CF685D90F0@BN8PR12MB2868.namprd12.prod.outlook.com>
 <2cb40bdc-2c78-6edd-bcea-3db5cbba3ba7@mind.be>
 <87r1zdnm4v.fsf@dell.be.48ers.dk>
Message-ID: <CANLo3JixXm8m456dRzG81pjOEMXWNV1RiopuJqfzDywP4WgRFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le dim. 2 f?vr. 2020 ? 14:40, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >> In February 2020 the new release of glibc is going to happen. There
> are at least
>  >> two packages known which latest releases
>  >> fail to build with latest revision of glibc: Busybox and strace.
>  >>
>  >> For "strace" there is a patch in master branch which solves the error:
>  >>
> https://github.com/strace/strace/commit/9afd83c11cb78a04954daaedb54b20214a35ec9c
>  >>
>  >> For busybox there are at least two patches required:
>  >>
> https://git.buildroot.net/busybox/commit/?id=6937487be73cd4563b876413277a295a5fe2f32c
>  >>
> https://git.buildroot.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9
>  >>
>  >> Should we introduce these patches now or should we wait until
> glibc-2.31 is
>  >> introduced in buildroot?
>
>  >  It doesn't hurt to introduce those patches now, since it's possible
> for people
>  > to use an external toolchain with glibc-2.31. In fact, I suspect that
> the ARC
>  > people do exactly that :-)
>
> Yes, please send patches.
>

There are some other issues with this  new version that was discovered by
toolchain-builder:
https://sourceware.org/ml/libc-alpha/2020-02/msg00007.html

I'll send patchs for glibc and gcc.

Thanks for sharing your issues with glibc!

Best regards,
Romain


> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200202/223c6366/attachment.html>
