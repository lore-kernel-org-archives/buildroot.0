From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 27 Jul 2020 21:53:56 +0200
Subject: [Buildroot] [PATCH v3 1/7] configs/guest_*: some new defconfig
In-Reply-To: <87o8o1uw29.fsf@dell.be.48ers.dk>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-2-francois.perrad@gadz.org>
 <87o8o1uw29.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRssErmq8AO_yDOYjGFwjY9=OWOP_x4SDu0WOPwW5GbeOFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 27 juil. 2020 ? 11:49, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > ---
>  >  DEVELOPERS                     |  1 +
>  >  configs/guest_arm_a7_defconfig | 16 ++++++++++++++++
>  >  configs/guest_arm_a9_defconfig | 18 ++++++++++++++++++
>  >  configs/guest_x86_64_defconfig | 15 +++++++++++++++
>
> Like Christian, I am not really convinced these defconfigs add any real
> value.
>
>
The documentation is the 2nd patch is the most valuable part.
Can we add board/guest/readme.txt without introducing some
configs/guest_*_defconfig ?

Fran?ois


> You have decided to use glibc / 4.15 headers / systemd, which seems
> pretty random to me.
>
> If anything, the should build with the oldest kernel headers version we
> support, so you can use the final docker image on older distributions
> without getting the dreaded:
>
> FATAL: kernel too old
>
> From glibc.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/a1ecc0d6/attachment.html>
