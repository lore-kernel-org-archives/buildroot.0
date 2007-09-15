From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 15 Sep 2007 14:19:16 +0200
Subject: [Buildroot] svn commit: trunk/uClibc: ldso/include
	ldso/ldso/sparc	libc/string etc...
In-Reply-To: <20070915075059.68EC4A6056@busybox.net>
References: <20070915075059.68EC4A6056@busybox.net>
Message-ID: <20070915121916.GK20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 15, 2007 at 12:50:59AM -0700, vapier at uclibc.org wrote:
>Author: vapier
>Date: 2007-09-15 00:50:58 -0700 (Sat, 15 Sep 2007)
>New Revision: 19840
>
>Log:
>Blue Swirl writes:
>I got the library to compile with the attached patches, though dynamic
>loader crashes early.
>
>In buildroot I changed the architecture name by hand from sparc to
>sparc64, otherwise the compiler produced 32-bit files with V9 (64-bit)
>instructions. This configuration is not supported by QEMU, so I aimed
>for pure 64-bit. I think Sparc64 option needs to be added to
>buildroot.

http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi?rev=19853&view=rev

Blue Swirl, please let me know if that's correct and useable now.

TIA,
Bernhard
