From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 May 2012 21:59:29 +0200
Subject: [Buildroot] [PATCH v2] xf86-input-vmmouse: Make
	xf86-input-vmmouse available only to x86/x86_64 architectures
In-Reply-To: <1335368942-20039-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Wed, 25 Apr 2012 16:49:02 +0100")
References: <1335368942-20039-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87k40v1xlq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> The xf86-input-vmmouse source code fails to compile
 Markos> intentionally on any architecture but x86/x86_64. The following
 Markos> error is printed when compiling for a different architecture:

Committed, thanks.

-- 
Bye, Peter Korsgaard
