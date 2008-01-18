From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 19 Jan 2008 01:18:05 +1100
Subject: [Buildroot] [PATCH] more python enhancements
In-Reply-To: <4790A58E.8030009@promwad.com>
References: <20080118025745.GA30978@cloud.net.au>
	<4790A58E.8030009@promwad.com>
Message-ID: <20080118141805.GA8308@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 18, 2008 at 03:11:42PM +0200, Ivan Kuten wrote:
> Hamish Moffatt wrote:
> > Here's another improvement to the Python package.
> > 
> > 1. Don't install the development headers, tools and static library into
> > the target system unless new configuration item is enabled.
> > 
> > 2. Always install the development headers etc into the staging_dir, so
> > they can be used to build extension modules.
> 
> please supply correct patch (svn diff or diff -urN)
> 
> --- python.mk   (.../mirror/buildroot/package/python)   (revision 3461)
> +++ python.mk   (.../beethoven/elara/trunk/buildroot/package/python)    (revision 3461)
> 
> I do not know how to apply it.

Oh sorry. The attached should do; I edited it by hand to add full paths.

Alternative you could apply it within the package/python directory using
"patch -p0 < br-python2.patch".

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-python2.patch
Type: text/x-diff
Size: 2793 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080119/0cde40c3/attachment.bin 
