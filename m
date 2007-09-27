From: Brian Austin <brian.austin@cirrus.com>
Date: Thu, 27 Sep 2007 09:08:20 -0500
Subject: [Buildroot] Problem with building ARM cross toolchain
	using	buildroot
In-Reply-To: <140561.37392.qm@web7910.mail.in.yahoo.com>
References: <140561.37392.qm@web7910.mail.in.yahoo.com>
Message-ID: <1190902100.7430.126.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You should not use the toolchain buildroot package provided by cirrus to
build a buildroot toolchain.

please download one from the buildroot website.

http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2


The buildroot package from arm.cirrus.com is a binary one packaged with
the sources.





On Thu, 2007-09-27 at 10:03 +0100, ashok vardhan wrote:
> Hi Sir/Madam,
>          We are building a toolchain for ARM9 EDB9315A board using "
> arm-linux-gcc-3.4.3 tar file " provided by " www.arm.cirrus.com ". 
> After extracting the tar file, we got two directories " opt " and "
> usr ".
> In that opt directory another directory buildroot is present .
> We started the steps to build the buildroot...........
> The steps are 1. make menuconfig 
>                      2. make
> After doing the second step i.e make , we are getting errors. 
> 
> Please provide us some solution regarding the building cross-toolchain
> using buildroot.
> 
> Regards,
> Ashok. 
> 
> 
> ______________________________________________________________________
> Now you can chat without downloading messenger. Click here to know
> how.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
