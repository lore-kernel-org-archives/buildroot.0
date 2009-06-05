From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Jun 2009 11:30:23 +0200
Subject: [Buildroot] Build instructions for ARM big-endian BE-8 target
In-Reply-To: <400467.96095.qm@web42108.mail.mud.yahoo.com> (Gopu Subramanian's
	message of "Fri\, 5 Jun 2009 01\:53\:01 -0700 \(PDT\)")
References: <400467.96095.qm@web42108.mail.mud.yahoo.com>
Message-ID: <87oct3xc28.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gopu" == Gopu Subramanian <sgopu@yahoo.com> writes:

Hi,

 Gopu> I am trying to build big-endian tool chain for ARM v6
 Gopu> architecture (ARM 11MPCore) and it should BE-8 format. In BE-8,
 Gopu> instructions should be in little-endian. I want the
 Gopu> instructions for BE-8 toolchain.

Ahh, wasn't aware of the funky BE8 format, but after a bit of
googling around it seems to just be a matter of adding --be8 to the
the TARGET_CFLAGS.

Could you try adding it to line 40 of package/Makefile.in and give it
a try?

-- 
Bye, Peter Korsgaard
