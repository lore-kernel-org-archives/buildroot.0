From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 22:13:50 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: arc: bump to git commit c6227bc
In-Reply-To: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
 (Anton Kolesov's message of "Thu, 13 Feb 2014 16:41:44 +0400")
References: <1392295308-12937-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <87sirmpvg1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <anton.kolesov@synopsys.com> writes:

 > This fixes two issues: one segmentation fault in GCC and one invalid code
 > generation. Those fix numerous autobuild failures, including:
 > http://autobuild.buildroot.net/results/715/7158a2a19da6bfa950125a951a39061ccaa73101/
 > http://autobuild.buildroot.net/results/9d4/9d4fbcb91cf76e01c833d70c401c0828ad37631a/
 > http://autobuild.buildroot.net/results/ef6/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf/
 > http://autobuild.buildroot.net/results/276/27692619efee482cded56967017f260bd30eefe7/

 > Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
