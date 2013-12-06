From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 10:34:25 +0100
Subject: [Buildroot] [PATCH] glibc: Backport upstream patch to accept
	make-4.0 or newer
In-Reply-To: <1385981465-763-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Mon, 2 Dec 2013 10:51:05 +0000")
References: <1385981465-763-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87ob4ue31a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 > Upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) added support for
 > make-4.0 or newer. We backport this patch to allow glibc to build on hosts
 > running the latest version of 'make'.

 > Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
