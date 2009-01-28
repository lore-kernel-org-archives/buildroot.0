From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 07:34:37 +0100
Subject: [Buildroot] [PATCH] fix configuration wrt elf2flt
In-Reply-To: <alpine.LFD.2.00.0812031426200.14328@xanadu.home> (Nicolas
	Pitre's message of "Wed\, 03 Dec 2008 14\:26\:54 -0500 \(EST\)")
References: <alpine.LFD.2.00.0812031426200.14328@xanadu.home>
Message-ID: <87tz7kvszm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:

Hi,

 Nicolas> The buildroot toolchain is installed in
 Nicolas> $(STAGING_DIR)/usr/bin and not in $(STAGING_DIR)/bin so
 Nicolas> let,s adjust the --prefix accordingly.

 Nicolas> Also the BFLT binary format is always stripped by
 Nicolas> definition, so it is incompatible with any kind of stripping
 Nicolas> option.

Sorry for the delay, is now committed.

Thanks.

-- 
Bye, Peter Korsgaard
