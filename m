From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 22:14:04 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "dmraid: disable on ARC arch"
In-Reply-To: <1392295308-12937-2-git-send-email-anton.kolesov@synopsys.com>
 (Anton Kolesov's message of "Thu, 13 Feb 2014 16:41:45 +0400")
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
 <1392295308-12937-2-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <87ob2apvfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <anton.kolesov@synopsys.com> writes:

 > This reverts commit 262a4c0bf7fb64d632ae6d40c22a62380c0af65f.
 > Compiler error has been fixed, and building this package doesn't cause an
 > ICE anymore.

 > Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
