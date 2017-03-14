From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 14 Mar 2017 10:46:07 +0100
Subject: [Buildroot] [PATCH 1/2] olimex_imx233_olinuxino: bump versions
In-Reply-To: <87a88oux1g.fsf@dell.be.48ers.dk>
References: <1489475994-28540-1-git-send-email-francois.perrad@gadz.org>
 <87a88oux1g.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsty471rm=J2V=k-PvLtd1fTBKcL3T_WK-b-VFiiVayK1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-14 8:39 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  > ---
>  >  configs/olimex_imx233_olinuxino_defconfig | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
>  > index e5e6605..1b35b74 100644
>  > --- a/configs/olimex_imx233_olinuxino_defconfig
>  > +++ b/configs/olimex_imx233_olinuxino_defconfig
>  > @@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>  >  # Kernel
>  >  BR2_LINUX_KERNEL=y
>  >  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.2"
>  > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.14"
>
> Committed, thanks. Any specific reason to not use 4.10.x?
>

4.9 is a LTS.

Fran?ois

> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
