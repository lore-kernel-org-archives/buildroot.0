From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 13 Nov 2019 22:03:00 +0100
Subject: [Buildroot] Adding linux commands to my package's make file
In-Reply-To: <1573585373266-0.post@n4.nabble.com>
References: <1573585373266-0.post@n4.nabble.com>
Message-ID: <20191113220300.32afbefe@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anushka,

On Tue, 12 Nov 2019 13:02:53 -0600 (CST), a <anushka.parashar@tesco.com> wrote:

> Can anyone tell me how to write simple linux command in a buildroot package
> make file and make it work? It's working on the command line but not if I
> add them to my make file and execute it.
> I wanna add the following command:
> $(curl -L https://sourceforge.net/projects/pwgen/files/latest/download >
> ./pwgen.tar.gz)

Why do you want to to this?

In case your want the tool pwgen included into your buildroot image, enable
the option BR2_PACKAGE_PWGEN=y in your config....or take a look at
the buildroot documentation [1]....

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html

>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
