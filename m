From: Fredrik Roubert <roubert@df.lth.se>
Date: Wed, 11 Oct 2006 15:27:02 +0200
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
In-Reply-To: <452CE9EC.4050101@lambsys.com>
References: <452CE9EC.4050101@lambsys.com>
Message-ID: <20061011132702.GL6271@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed 11 Oct 14:56 CEST 2006, David Lambert wrote:

> A commom problem seems to be that they depend on a library libgcc.so.1
> which appears in buildroot/build_arm/staging_dir/lib/libgcc_s.so.1,
> [...] Is there a more elegant solution?

One possible solution is to unset BR2_GCC_SHARED_LIBGCC in the buildroot
configuration, to get rid of the shared libgcc alltogether.

Information on libgcc can be found here:

http://gcc.gnu.org/onlinedocs/gccint/Libgcc.html

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061011/8648f995/attachment.pgp 
