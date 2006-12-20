From: don <don_reid@comcast.net>
Date: Tue, 19 Dec 2006 21:03:44 -0800
Subject: [Buildroot] Booting the rootfs ext2 image
In-Reply-To: <Pine.LNX.4.64.0612192348340.31862@smtcorms05.samuelmanutech.com>
References: <7B808CFD-AB02-4E02-A220-CE241662C366@linux.it>
	<Pine.LNX.4.64.0612192322530.31862@smtcorms05.samuelmanutech.com>
	<20061220043858.GA29988@reid1.localdomain>
	<Pine.LNX.4.64.0612192348340.31862@smtcorms05.samuelmanutech.com>
Message-ID: <20061220050344.GB30156@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 19, 2006 at 11:52:25PM -0500, Robin Mordasiewicz wrote:
> 1. fdisk the CF
> 2. format the CF
> 3. copy root filesystem including kernel etc. to CF

Build root uses fakeroot, so I didn't directly have a filesystem to
copy.  I have build an ext2 target and then mounted that to copy from.

> 4. chroot to new filesystem
> 5. run grub installer

Don
