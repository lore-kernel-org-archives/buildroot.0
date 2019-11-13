From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Nov 2019 21:58:06 +0100
Subject: [Buildroot] lshw package not getting added to the resulting
 image
In-Reply-To: <1573645315718-0.post@n4.nabble.com>
References: <1573645315718-0.post@n4.nabble.com>
Message-ID: <20191113215806.45bb1ec7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anushka,

On Wed, 13 Nov 2019 05:41:55 -0600 (CST), a <anushka.parashar@tesco.com> wrote:

> I wanna run lshw from my resulting image,
> I have selected hwdata but lshw pacakge is not getting added to output/build
> after the compilation is over.

Why do you believe the command 'lshw' is in the selected package hwdata?
Try package lshw (BR2_PACKAGE_LSHW=y) instead...

Regards,
Peter

>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
