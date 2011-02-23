From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Wed, 23 Feb 2011 16:54:33 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <87oc62yduh.fsf@macbook.be.48ers.dk>
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
	<AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
	<20110222192538.6720529a@surf>
	<AANLkTimGr8JsO82tn==M8n9zAtfpxMoRPOvh_vY9sKb_@mail.gmail.com>
	<AANLkTimf6Yvj1CSSwPT4Qg399_72ZOQhaR9tvPx_w+sM@mail.gmail.com>
	<87oc62yduh.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTin5SgZE2nBsnYaKu5vsSVgb4oLD9xMr3=CC=vUx@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I promise that I will read FAQs more carefully :-) Thanks for patience! Now
I'm able to login and work.

Best regards,
Zdenek Materna

2011/2/23 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Zden?k" == Zden?k Materna <zdenek.materna@gmail.com> writes:
>
>  Zden?k> Ouch, my mistake! All files in /dev are plain text... I have to
>  Zden?k> mount ext2 rootfs or untar rootfs from output/images on my
>  Zden?k> laptop, than share this over nfs like rootfs for my
>  Zden?k> board... I'm correct?
>
> Yes - Like it says in the documentation:
>
> http://buildroot.net/buildroot.html#using
>
> * target/ which contains almost the complete root filesystem for the
>  target: everything needed is present except the device files in /dev/
>  (Buildroot can't create them because Buildroot doesn't run as root and
>  doesn't want to run as root). Therefore, this directory should not be
>  used on your target. Instead, you should use one of the images built in
>  the images/ directory. If you need an extracted image of the root
>  filesystem for booting over NFS, then use the tarball image generated in
>  images/ and extract it as root.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110223/e107071f/attachment.html>
