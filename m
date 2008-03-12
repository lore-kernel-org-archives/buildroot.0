From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Mar 2008 08:53:35 +0100
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid version
In-Reply-To: <20080311232234.GA10859@cloud.net.au>
References: <3602fa0f2bfc9d33e7fe0380c3243a05@busybox.net>
	<d6cda7730803102151k687bc79ek9117e63ae3241dc8@mail.gmail.com>
	<1205216050.8434.14.camel@localhost>
	<46a136670803110638j36c03d7eo5f83f200f5cd7246@mail.gmail.com>
	<d6cda7730803110655i42ba1d12pd0253344bec51e10@mail.gmail.com>
	<20080311232234.GA10859@cloud.net.au>
Message-ID: <20080312085335.3b74128d@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 12 Mar 2008 10:22:34 +1100,
Hamish Moffatt <hamish@cloud.net.au> a ?crit :

> One way to stabilise the fakeroot package would be to use the version
> from stable, unless we particularly need features from the new
> version. That version is 1.5.10. stable only changes every couple of
> years other than for security updates.

Or use URLs from snapshot.debian.net, because they never change. For
example, for fakeroot 1.9.3:

 http://snapshot.debian.net/archive/2008/02/06/debian/pool/main/f/fakeroot/fakeroot_1.9.tar.gz

See

 http://snapshot.debian.net/archive/pool/f/fakeroot/source/Sources.gz

for the complete list of fakeroot versions hosted by
snapshot.debian.net. It goes all the way back to 0.4.5, released in
2002.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080312/88c02903/attachment.pgp 
