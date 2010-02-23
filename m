From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Feb 2010 23:19:02 +0100
Subject: [Buildroot] make -C <buildroot_directory> failed
In-Reply-To: <4f6b.4b844ff0.25c53@getafix.xdna.net> (Cameron Hutchison's
	message of "Tue, 23 Feb 2010 22:00:16 -0000")
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
	<4f6b.4b844ff0.25c53@getafix.xdna.net>
Message-ID: <873a0regtl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cameron" == Cameron Hutchison <lists@xdna.net> writes:

 Cameron> "Matthew Davison" <matt.davison@lantronix.com> writes:
 >> Attempting to invoke the top level buildroot makefile from a higher
 >> level Makefile or simply with make -C <buildroot_directory> fails during
 >> the kernel build. This is even true if 'make -C .' is invoked from the
 >> top level buildroot directory, as long as a kernel build is enabled. It
 >> appears that the problem has something to do with make's
 >> "Entering/Leaving directory" messages, as the output below suggests.
 >> When I passed the --no-print-directory option to make, I was able to
 >> build without problems.

 Cameron> I think I see the problem. See if this patch fixes it. I haven't tested
 Cameron> this, but this looks right.

Yes, seems sensible - Committed, thanks.

-- 
Bye, Peter Korsgaard
