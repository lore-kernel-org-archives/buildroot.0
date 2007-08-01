From: Chris Malarky <chris@malarky.org>
Date: Wed, 01 Aug 2007 18:18:29 +0100
Subject: [Buildroot] [PATCH] gzip cpio
In-Reply-To: <20070621112152.GA21096@aon.at>
References: <1182422403.7911.2.camel@venture.bit63.org>
	<20070621112152.GA21096@aon.at>
Message-ID: <1185988709.6827.49.camel@shadow.muzakdomain.imagesound.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2007-06-21 at 13:21 +0200, Bernhard Fischer wrote:
> On Thu, Jun 21, 2007 at 06:40:03AM -0400, Clark Rawlins wrote:
> >This patch is useful to me.  It permits gzipping the cpio archive after
> >creation.  This is my first attempt so if there are better, or more
> >correct ways to accomplish this I am interested in improving my changes.
> 
> Problem is that somebody will show up sooner or later who wants to use
> another compressor (we've seen this with ext2 rootfs).
> Let me suggest you look at target/ext2/ext2root.mk
> and do the same COMPRESSOR fiddling (with cpio and any other target
> format).

Attached is a patch to add the same compression options to the cpio root
as to the ext2 root.

I'm only using gzipped cpio at the moment, but will gladly do the same
for other output formats if there is demand for it.

Cheers,
Chris
-- 
Chris Malarky
chris at malarky dot org
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cpioroot-compressor.patch
Type: text/x-patch
Size: 4635 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070801/78835336/attachment.bin 
