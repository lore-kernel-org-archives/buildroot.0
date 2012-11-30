From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Nov 2012 16:32:57 -0800
Subject: [Buildroot] [PATCH 1/1] strace: remove undef-CTL_PROC patch
In-Reply-To: <1354209118-12653-1-git-send-email-james.hogan@imgtec.com> (James
 Hogan's message of "Thu, 29 Nov 2012 17:11:58 +0000")
References: <1354209118-12653-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <8738zsdj5y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hogan <james.hogan@imgtec.com> writes:

 James> This patch is no longer necessary since strace-v4.5.15 which always
 James> defines CTL_PROC. Specifically strace git commit
 James> 35a55785ea8ff44d214af52085e3a5ea624730aa.

Committed, thanks.

-- 
Bye, Peter Korsgaard
