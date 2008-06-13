From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 13 Jun 2008 15:54:07 +1000
Subject: [Buildroot] macro `AM_PROG_LIBTOOL' not found
In-Reply-To: <484EDB38.8030308@acsatlanta.com>
References: <484EDB38.8030308@acsatlanta.com>
Message-ID: <20080613055407.GA26459@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 10, 2008 at 02:51:20PM -0500, Joseph G. Boike wrote:
> Hi,
> I'm trying to cross compile buildroot for and Atmel at91sam9260 ARM 
> processor and keep getting the same error below.
> I started w/ a clean buildroot subdirectory and used the default make 
> (make at91sam9260_defconfig) setup.
> My native autoconf, automake and libtool are all in /usr/bin
> The error references m4_pattern_allow.  Where do I add that?  How do I 
> keep it if I get a new version of buildroot?

Thanks, I fixed it now in svn (r22311).

libusb.mk should probably be rewritten to use the autotools stuff.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
