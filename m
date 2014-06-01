From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 20:53:54 +0200
Subject: [Buildroot] [PATCHv2] reenable microblaze little endian for
	internal musl toolchain
In-Reply-To: <20140531132008.GA22450@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 31 May 2014 15:20:08 +0200")
References: <20140531132008.GA22450@waldemar-brodkorb.de>
Message-ID: <87egz85um5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The assumption musl libc does not support microblaze
 > little endian mode is wrong. See
 > http://git.musl-libc.org/cgit/musl/tree/configure line
 > number 447-448.

 > Tested with qemu. Just revert previous commit as suggested by
 > Thomas Petazzoni.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
