From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 14 Nov 2019 20:25:32 +0100
Subject: [Buildroot] lshw package not getting added to the resulting
 image
In-Reply-To: <1573716587196-0.post@n4.nabble.com>
References: <1573645315718-0.post@n4.nabble.com>
 <20191113215806.45bb1ec7@gmx.net>
 <1573716587196-0.post@n4.nabble.com>
Message-ID: <20191114202532.7bdd338b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anushka,

On Thu, 14 Nov 2019 01:29:47 -0600 (CST), a <anushka.parashar@tesco.com> wrote:

> Actually I can't find BR2_PACKAGE_LSHW variable in .config file as it is not
> visible in buildroot config tool under hardware handling packages. Can't
> figure out why?
> I tried setting BR2_PACKAGE_LSHW=y manually, it doesn't seem to work!

According to git log the lshw package was added 2012..., which buildroot
version do you use?

If in doubt, attach your .config file...

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
