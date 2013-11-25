From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Nov 2013 11:05:17 +0100
Subject: [Buildroot] [PATCH] tinymembench: not supported on MIPS n32/64
	ABIs
In-Reply-To: <1385372866-50017-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 25 Nov 2013 09:47:46 +0000")
References: <1385372866-50017-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87li0clrtu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This is a fix for 9883cbd3678be65bdca10a124ba6cb7fd1f008d3. After deeper
 > testing we have found that package is supported on MIPS64, but only for
 > o32 ABI.

Committed, thanks.

-- 
Bye, Peter Korsgaard
