From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 13:08:22 +0100
Subject: [Buildroot] [PATCH] QT: Fix build for architectures using
	generic atomics
In-Reply-To: <1352027774-27536-1-git-send-email-mischa.jonker@synopsys.com>
 (Mischa Jonker's message of "Sun, 4 Nov 2012 12:16:14 +0100")
References: <1352027774-27536-1-git-send-email-mischa.jonker@synopsys.com>
Message-ID: <877gq1r2o9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <mischa.jonker@synopsys.com> writes:

 Mischa> The problem has to do with const-correctness. This has been resolved
 Mischa> for various architectures, but not for the generic case.

Committed, thanks.

-- 
Bye, Peter Korsgaard
