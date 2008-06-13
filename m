From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 10:48:59 +0200
Subject: [Buildroot] macro `AM_PROG_LIBTOOL' not found
In-Reply-To: <484EDB38.8030308@acsatlanta.com> (Joseph G. Boike's message of
	"Tue\, 10 Jun 2008 14\:51\:20 -0500")
References: <484EDB38.8030308@acsatlanta.com>
Message-ID: <87od65yb2c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph G Boike <joe.boike@acsatlanta.com> writes:

Hi,

 Joseph> Hi, I'm trying to cross compile buildroot for and Atmel
 Joseph> at91sam9260 ARM processor and keep getting the same error
 Joseph> below.  I started w/ a clean buildroot subdirectory and used
 Joseph> the default make (make at91sam9260_defconfig) setup.  My
 Joseph> native autoconf, automake and libtool are all in /usr/bin The
 Joseph> error references m4_pattern_allow.  Where do I add that?  How
 Joseph> do I keep it if I get a new version of buildroot?  Regards,
 Joseph> Joe

libusb missed a dependency on host-libtool. Fixed in r22311-r22313.

-- 
Bye, Peter Korsgaard
