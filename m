From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 22:31:35 +0200
Subject: [Buildroot] [git commit] axfs: add new filesystem type
In-Reply-To: <87vba76gwv.fsf@dell.be.48ers.dk>
References: <20151014214751.023DE81663@busybox.osuosl.org>
 <87vba76gwv.fsf@dell.be.48ers.dk>
Message-ID: <20151015223135.631d4ab9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 15 Oct 2015 22:00:32 +0200, Peter Korsgaard wrote:

> > +++ b/fs/axfs/Config.in
>  > @@ -0,0 +1,17 @@
>  > +config BR2_TARGET_ROOTFS_AXFS
>  > +	bool "axfs root filesystem"
>  > +	help
>  > +	  The Advanced XIP File System is a Linux kernel filesystem
>  > +	  driver that enables files to be executed directly from flash
>  > +	  or ROM memory rather than being copied into RAM. It has the
>  > +	  ability to store individual *pages* in a file
>  > +	  uncompressed/XIP or compressed/Demand Paged.
>  > +
>  > +	  So far, the only supported mode is 'XIP all', so all the
>  > +	  files that have the execute attribute set will be XIP'ed.
>  > +
>  > +	  At the moment, the FS is not supported in Linux mainline
>  > +	  (v4.3-rc5), so the kernel has to be built with the axfs
>  > +	  patches to be able to read it. Patches can be found at:
>  > +
>  > +	    https://github.com/jaredeh/axfs
> 
> The indentation of that URL looks wrong. I'll fix it now.

Well, yes and no. It isn't the usual "upstream web site" thing. It is
really the continuation of "Patches can be found at:".

But I don't really care what the indentation is in this case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
