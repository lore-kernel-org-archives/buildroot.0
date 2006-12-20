From: don <don_reid@comcast.net>
Date: Tue, 19 Dec 2006 20:38:58 -0800
Subject: [Buildroot] Booting the rootfs ext2 image
In-Reply-To: <Pine.LNX.4.64.0612192322530.31862@smtcorms05.samuelmanutech.com>
References: <7B808CFD-AB02-4E02-A220-CE241662C366@linux.it>
	<Pine.LNX.4.64.0612192322530.31862@smtcorms05.samuelmanutech.com>
Message-ID: <20061220043858.GA29988@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Tue, 19 Dec 2006, Rafael A Barrero wrote:
> 
> > Now that I've successfully built a rootfs image that includes my
> > custom built kernel, I have a few questions about taking that rootfs
> > and actually running it on my dev. system. I've mounted the ext2 fs
> > as a loopback device and it looks great, but I'm looking for some
> > pointers on getting grub configured for that partition.

I booted mine with PXE and then ran grub to install on to the CF card
in an IDE adapter.

I believe you can install a disk or flash card onto your host and then
run grub there with arguments to install there instead of your main 
hard drive.  But I didn't want to fight through that when I had PXE
working.

It does not boot from the CF card.

Don Reid
