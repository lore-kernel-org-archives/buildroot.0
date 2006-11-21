From: Claus Klein <claus.klein@arcormail.de>
Date: Tue, 21 Nov 2006 21:12:22 +0100
Subject: [Buildroot] Boost package settings for using cross-compiler ?
In-Reply-To: <loom.20061120T163936-97@post.gmane.org>
References: <loom.20061120T163936-97@post.gmane.org>
Message-ID: <200611212112.23510.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we use boost with ppc crosscompiler, here is my buildroot package.

Sure, its depend an bjam installed on host, the buildroot C++ toolchain, theading, zlib, ....
Realy, a big package for an embedded device ;-)

Check the boost configuration in boost.mk!

Regards,
claus

On Monday 20 November 2006 16:46, MikeW wrote:
> I successfully (so I thought) created a package file for building the Boost C++
> libraries under buildroot, but when I came to use them, found they had been
> built using native (i386) tools, unlike the rest of the libraries built
> by Buildroot, which were ARM architecture.
> 
> The top-level Boost config parameters do not appear to have a tool
> prefix or macro to support cross-tools.
> 
> So - has anyone built Boost successfully before ?
> 
> I imagine that if so, the distribution would already contain
> a package file for the library ...
> 
> Regards,
> Mike
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: boost.tgz
Type: application/x-tgz
Size: 2544 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061121/3ab5b92a/attachment.bin 
