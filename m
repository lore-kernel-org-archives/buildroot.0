From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 02 Feb 2013 17:38:26 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.arm: Use armv6k for
	arm1136jf-s rev1
In-Reply-To: <1359747204-12412-1-git-send-email-benoit.thebaudeau@advansee.com>
 (=?utf-8?Q?=22Beno=C3=AEt_Th=C3=A9baudeau=22's?= message of "Fri, 1 Feb
 2013 20:33:24 +0100")
References: <1359747204-12412-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <87vcaa658d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit.thebaudeau@advansee.com> writes:

 Beno?t> According to the ARM1136JF-S and ARM1136J-S Revision r1p5
 Beno?t> Technical Reference Manual, from release rev1 (r1pn), the
 Beno?t> ARM1136JF-S processor implements the ARMv6 instruction set with
 Beno?t> the ARMv6k additions.

 Beno?t> This patch differentiates the ARM1136JF-S revisions 0 and 1 in
 Beno?t> order to use either ARMv6j (e.g. on Freescale i.MX31) or ARMv6k
 Beno?t> (e.g. on Freescale i.MX35).

Committed, thanks.

-- 
Bye, Peter Korsgaard
