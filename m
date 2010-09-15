From: Johnny Beardsmore <jny0@hotmail.com>
Date: Wed, 15 Sep 2010 11:07:51 +0000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <87mxrm6lrc.fsf@macbook.be.48ers.dk>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>,
	<20100913102031.03481d63@surf>,
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>,
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>
Message-ID: <SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Here it works:
> 
> tar jxf buildroot-2010.08.tar.bz2
> cd buildroot-2010.08
> make menuconfig (don't change anything, exit and save)
> make
> /sbin/e2fsck -f output/images/rootfs.ext2
> e2fsck 1.41.9 (22-Aug-2009)
> Filesystem did not have a UUID; generating one.
> 
> Pass 1: Checking inodes, blocks, and sizes
> Pass 2: Checking directory structure
> Pass 3: Checking directory connectivity
> Pass 4: Checking reference counts
> Pass 5: Checking group summary information
> 
> output/images/rootfs.ext2: ***** FILE SYSTEM WAS MODIFIED *****
> output/images/rootfs.ext2: 504/896 files (0.4% non-contiguous), 1268/3568 blocks
> 
> -- 
> Bye, Peter Korsgaard

Hi,
I don't have a rootfs.ext2 in my output/images/.  I have rootfs.i486.tar and rootfs.i486.tar.bz2.  After un-taring these, I get /usr/sbin/mkfs.ext2 and /usr/sbin/fsck.ext2.  What could I be doing differently?
Regards,
JNY


 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100915/a6663ec5/attachment-0001.html>
