From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 08:01:40 +0100
Subject: [Buildroot] can't open /dev/tty No such device or address
In-Reply-To: <1233633829.13156.3.camel@penguin> (jeff angielski's message of
	"Mon\, 02 Feb 2009 23\:03\:49 -0500")
References: <1233613745.7613.23.camel@penguin>
	<20090202232422.GB30540@cloud.net.au>
	<1233633829.13156.3.camel@penguin>
Message-ID: <87pri0f1gr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jeff" == jeff angielski <jeff@theptrgroup.com> writes:

Hi,

 jeff> You are correct.  At some point while I was trying to get my
 jeff> serial port, /dev/ttyCPM0, up and running as the serial console
 jeff> in buildroot I must have inadvertently disabled Virtual
 jeff> Terminals in the kernel config file.  Once I enabled them again
 jeff> all was well.

We don't seem to have ttyCPMx devices listed in the default
/etc/securetty, what major/minor device numbers does it use and how
many are typically present?

-- 
Bye, Peter Korsgaard
