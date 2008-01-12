From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Sat, 12 Jan 2008 16:43:15 +0000
Subject: [Buildroot] Buildroot and Linux/ARM on AT91SAM9260
In-Reply-To: <270858e90801120842u7c793a23n779f1388c22fe753@mail.gmail.com>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<85F68C4E-6290-4E64-875C-982B0E377695@oregonstate.edu>
	<47635.127.0.0.1.1197931767.squirrel@localhost>
	<7E283458-5B84-4AF8-9B2E-7B6D42081922@oregonstate.edu>
	<0FA0EAE7-0236-46E2-94F1-F3C664582A6B@oregonstate.edu>
	<52481.127.0.0.1.1197934593.squirrel@localhost>
	<1CDF1BC9-C921-4E84-B041-B0CDDF8BF3A1@oregonstate.edu>
	<4767A119.6070508@promwad.com> <47739DD3.8050400@promwad.com>
	<270858e90801120842u7c793a23n779f1388c22fe753@mail.gmail.com>
Message-ID: <270858e90801120843s6d82a740uf331022c67669132@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, that should have read

kernel:  2.6.23

Wayne

On Jan 12, 2008 4:42 PM, Wayne Keenan <wayne.keenan@gmail.com> wrote:

> Hi,
>
> I am runing into a similarissue, there would be no  outpu after :
> Uncompressing
> Linux.........................................................................................................................................T
>
>
>
> o I applied the patch mentioned (http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=1e621a8e3752367d4aae78a8ab00a18fb2793f34)<http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=1e621a8e3752367d4aae78a8ab00a18fb2793f34>
>
> Now it gets futher but outputs gibberish, after:
>
> ... done, booting the kernel.   <gibberish>
>
> is there anything else that needs to be applied?
>
> My Environment:
>
> host: ubuntu 7.04   2.6.20-16-generic
> target: AT91 SAM 9263
> buildroot: r18347 | aldot | 2007-04-06 12:55:37 +0100 (Fri, 06 Apr 2007)
> gcc: 3.4.6
> uClibc:0.9.28.3
> binutils: 2.1.7
> kernel: 2.6.20.4
> busybox: 1.5.0
>
> Thanks,
> Wayn
>
>
> On Dec 27, 2007 12:42 PM, Ivan Kuten <ivan.kuten@promwad.com> wrote:
>
> > >> I did finally get a build of the latest trunk of buildroot, but it
> > had
> > >> a lot of problems. sshd and other non-busybox applications segfault.
> > >> This was using gcc 4.2.1, binutils 2.18 and a snapshot of uClibc from
> > >> early december, using softfloat and EABI. I've had to focus on some
> > >> other issues so I haven't gotten back to it yet. This was still with
> > >> my 2.6.21.6 kernel I'd built previously, still cannot get a working
> > >> 2.6.23 kernel with that toolchain.
> > >>
> > >
> >
> > This commit:
> >
> > http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=1e621a8e3752367d4aae78a8ab00a18fb2793f34
> >
> > fixes issue with build-id section introduced in 2.6.23
> >
> > Hope you will finally have working 2.6.23 kernel.
> >
> > Regards,
> > Ivan
> > --
> >
> > --------------------------------
> > Embedded Linux engineer,
> > Promwad Company: http://www.promwad.com/
> > Homepage : http://www.ivankuten.com/
> > --------------------------------
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080112/8be73c4c/attachment-0001.htm 
