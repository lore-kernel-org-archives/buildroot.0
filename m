From: RK Raggit <rk.raggit@gmail.com>
Date: Fri, 29 Jan 2010 10:32:29 +0530
Subject: [Buildroot] cortex-m3 support ?
In-Reply-To: <4B61BF98.5010903@zacarias.com.ar>
References: <ec1f3d401001272243l12a18ad9iee47ff04f7c366ea@mail.gmail.com>
	<87wrz2mbec.fsf@macbook.be.48ers.dk>
	<4B61BF98.5010903@zacarias.com.ar>
Message-ID: <ec1f3d401001282102g3a3e5697yc5489df0e957d1fc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> > Isn't cortex-m3 for deeply embedded stuff? There's afaik no Linux or
> > uClibc support, so that's pretty much a showstopper.
>
>
Yes...but there is growing interest to plant linux on it. ARM has made
available some (preliminary) kernel patches on its linux-stable repository.

Now concerning buildroot - if i know that gcc4.4.x, binutils 2.19.x
and uclibc 0.9.30 support cortex-m3 architecture, then alongwith the
attached patch should not i be able to use buildroot to build a shiny
new cortex-m3 toolchain ? Or is there something else to it that i
am missing ?

Please let me know.

Thanks
--RK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100129/b5212174/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cortex-m3.patch
Type: application/octet-stream
Size: 1191 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100129/b5212174/attachment.obj>
