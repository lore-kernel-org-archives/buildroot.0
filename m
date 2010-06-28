From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jun 2010 17:21:40 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i0ae60$t0c$1@dough.gmane.org>
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<20100627093056.5635ce90@surf> <87aaqg452f.fsf@macbook.be.48ers.dk>
	<871vbs44p1.fsf@macbook.be.48ers.dk> <i08rds$vue$2@dough.gmane.org>
	<i0ae60$t0c$1@dough.gmane.org>
Message-ID: <20100628172140.20a96bc0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Jun 2010 15:13:04 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I still don't understand why one can build a cpio archive without
> building a kernel, but in order to create a list of what's in the cpio
> archive a kernel must be built.

I think I've already said that it was just one choice to solve bug
#2119, but that there was also other ways to solve the same bug (for
example by enabling the dependency from initramfs to the kernel only
when the kernel build is enabled).

So there's nothing to understand: it was one way to fix the bug,
and it later turned out that this way was too restrictive and that the
bug must therefore be fixed another way. Which will be done.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
