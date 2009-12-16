From: Stanley <eva2002@gmail.com>
Date: Wed, 16 Dec 2009 12:30:57 +0800
Subject: [Buildroot] update on a file in tslib not reflected after doing
	"Make"
In-Reply-To: <20091215092751.7d9a48fe@surf>
References: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
	<20091215092751.7d9a48fe@surf>
Message-ID: <ed7750810912152030x7fd04fd1g70a959b28f4ab9e4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried your method and also tried creating some patches for editing the
test file. However in both cases, the changes still did not reflect.

However i did see that it got rebuilt after deleting .stamp_built file. What
I can try out now?
thanks

On Tue, Dec 15, 2009 at 4:27 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Tue, 15 Dec 2009 15:30:06 +0800,
> Stanley <eva2002@gmail.com> a ?crit :
>
> > Anyone knows how to resolve this problem?
>
> Let Buildroot does its compilation process to the end.
>
> Then, make your modifications to build_arm/tslib-x.x/. Then, remove
> the build_arm/tslib-x.x/.stamp_build file.
>
> Re-run make.
>
> This topic is covered in Buildroot documentation, see
> docs/buildroot.html.
>
> Cheers,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091216/b176f42a/attachment.htm>
