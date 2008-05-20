From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 20 May 2008 11:45:15 -0700
Subject: [Buildroot] Bootloaders
In-Reply-To: <48331ABD.1060907@dspfl.com>
References: <4831FE20.6050508@dspfl.com>
	<326f33790805191734n68a95ee2m758c4266aeb4d02e@mail.gmail.com>
	<48330E51.6050505@dspfl.com>
	<326f33790805201131w57057429ydef6aa0df0bf0ec0@mail.gmail.com>
	<48331ABD.1060907@dspfl.com>
Message-ID: <326f33790805201145r785b06hcbec87b888ff8a76@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well I checked my x86 project and I have grub 0.97-35. I haven't touched
that project since April, so they must have removed 35 from this repository
pretty recently. I find that really annoying that they only keep the latest
version up there.

Anyway, I am very surprised your build isn't working with version 38. I
remember having the same problem with grub because version 0.97-33 wasn't
available! So I changed the .mk file to direct it to 35 and it worked. I see
that version 27 is up there still... can you try getting that one and see
what happens?

On Tue, May 20, 2008 at 11:38 AM, Jason Valenzuela <jvalenzuela@dspfl.com>
wrote:

> Arun Reddy wrote:
>
> > As for the grub.mk <http://grub.mk> modification, can you post the exact
> > error you get with the debian site not being able to be resolved? I can
> > cross reference that with my own grub.mk <http://grub.mk> and see where
> > I downloaded grub from.
>
> wget fails to get
> http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz
>
> Fails with a 404 Not Found.
>
> If I ftp manually to that site, the file is indeed not there.
>
>
> Jason Valenzuela
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080520/befd7bd8/attachment.htm 
