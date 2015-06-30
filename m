From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 15:31:13 +0200
Subject: [Buildroot] [PATCH 2/2] fs: add custom fakeroot script support
In-Reply-To: <1424865760.2629.14.camel@e37108.spectralink.com>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
 <1424792855-14278-2-git-send-email-stefan.sorensen@spectralink.com>
 <20150224213941.GB4783@free.fr>
 <1424865760.2629.14.camel@e37108.spectralink.com>
Message-ID: <20150630153113.65d445d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, 25 Feb 2015 12:02:41 +0000, S?rensen, Stefan wrote:

> > For file ownership, we already have BR2_ROOTFS_DEVICE_TABLE: "Path to
> > the permission tables". The naming of the option may be a bit
> > misleading, indeed, but that's historical...
> 
> As you mention yourself, bulk ownership changes are problematic with
> device tables. Generating the device table in the post-build script
> doesn't seem very elegant to me.

Since commit
http://git.buildroot.net/buildroot/commit/package/makedevs?id=410f9b60137820143caf51a2a37da6f8fa16679f,
you can use the permission table to recursively set the
owernship/rights of a directory and all its subdirectories/files.

Therefore, I don't think this patch is needed, and I've marked it as
Rejected in our patch tracking system. Do not hesitate to repost an
updated version with a new justification if you don't agree, of course.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
