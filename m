From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jun 2010 20:57:14 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i07kg9$jsp$1@dough.gmane.org>
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<i07kg9$jsp$1@dough.gmane.org>
Message-ID: <20100627205714.507b5439@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Jun 2010 13:42:34 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> > No, but you could extract the tarball (as root or using fakeroot) and
> > point CONFIG_INITRAMFS_SOURCE to it.
> 
> An extracted tarball isn't one of the options either.
> CONFIG_INITRAMFS_SOURCE can be pointed at either a cpio archive or the
> source file list.

Or a directory containing the hierarchy of files/directories to include
in the initramfs.

> > But yes, providing a way to generate the cpio archive without building a
> > kernel would be nicer.
> 
> It works fine the way it is.  What's the reason for disabling the
> buildign of a cpio file source list?

It was to fix bug #2119.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
