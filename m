From: Luciano Greiner <luciano.greiner@gmail.com>
Date: Tue, 25 Aug 2009 15:02:47 -0300
Subject: [Buildroot] CramFS + SquashFS
In-Reply-To: <87ws4tndwg.fsf@macbook.be.48ers.dk>
References: <26fbce020908240822l7ef7d181mafdb04f577651bb6@mail.gmail.com>
	<87ws4tndwg.fsf@macbook.be.48ers.dk>
Message-ID: <26fbce020908251102n22cca9f7kd007d83da0cde199@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter.

  Thanks for your answer. I think it's better to compile kernel and
create filesystems out of BR too.
Is there any way to easily export BR cross env variables to my own
command line shell to make it?

Thanks

Luciano Greiner



On Mon, Aug 24, 2009 at 5:41 PM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:
>
> ?Luciano> Hello.
> ?Luciano> ? ?I'm doing a custom build for a set-top box. The Dreambox device
> ?Luciano> uses a CramFS image to hold kernel image and bootloader, and a
> ?Luciano> squashfs image containing the root file system.
> ?Luciano> How do i create these separete images using Buildroot?
>
> That's not supported in BR. The easiest option is either to build
> kernel+bootloader+cramfs outside buildroot and just use the squashfs
> target, or use the tarball target and split up the content in
> cramfs+squashfs outside buildroot.
>
> --
> Bye, Peter Korsgaard
>
