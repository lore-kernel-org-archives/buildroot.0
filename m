From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Mon, 27 Oct 2008 14:15:12 +0100
Subject: [Buildroot] Unable to create files inside mounted root
	filesystem
In-Reply-To: <1225112903.16248.1281448757@webmail.messagingengine.com>
References: <1225112903.16248.1281448757@webmail.messagingengine.com>
Message-ID: <e4c675870810270615n2bb4e9dbwf86044668db35ad2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/27 Adam McLaurin <buildroot@irotas.net>:
> Hi all,
>
> I hope this is a typical newbie question. I was finally able to create a
> root filesystem (ext2) with buildroot, and I can mount (-o loop) and
> chroot into it with no problems.
>
> The trouble is that I cannot create any files in the mounted filesystem:
> / # touch foo
> touch: foo: No space left on device
>
> Strangely, when I mount/chroot into one of the pre-built root
> filesystems available from the uclibc website, I can create files
> without any problems.
>
> I'm trying to figure out what I did differently creating my root
> filesystem that would cause this problem, but at the moment I'm out of
> ideas.
>
> Any advice?
>

 Welcome, I am newbie in buildroot me too, try this:

 mount -o remount,rw /

 It was useful in my bootable iso9660 from buildroot

 Cheers,
-- 
/roberto
