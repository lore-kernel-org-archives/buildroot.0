From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 12:01:13 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package/mtd/20061007	target/device/AMD/D etc...
In-Reply-To: <20070822100625.02507A4600@busybox.net>
References: <20070822100625.02507A4600@busybox.net>
Message-ID: <20070822100113.GA8174@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 03:06:25AM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-08-22 03:06:25 -0700 (Wed, 22 Aug 2007)
>New Revision: 19640
>
>Log:
>- use the BZCAT/ZCAT as configured by the user

Ulf,

i've fixed all but target/device/At*
I encourage you to clean this directory up WRT BZCAT/ZCAT, semicolon and
whitespace damage. I will not do this for you in order not to complicate
your effort to eventually merge your enhancements of target/device/Atmel
back into trunk.

thanks,
