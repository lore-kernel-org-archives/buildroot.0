From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Nov 2013 09:03:49 +0100
Subject: [Buildroot] [PATCH v2] libtool: Apply upstream patch to set
	correct linkage on
In-Reply-To: <1384777532-58950-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 18 Nov 2013 12:25:32 +0000")
References: <1384777532-58950-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87y546uxi2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This libtool change ensures that ld uses the right machine emulation
 > file, which will allow to fix several MIPS64 n64 link failures, such
 > as the one currently visible on the libiscsi package. Packages
 > affected by this problem will have to use <pkg>_AUTORECONF = YES to
 > benefit from this libtool fix, until they are fixed upstream.

 > Acked-by: Markos Chandras <markos.chandras@imgtec.com>
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed with the subject fixed, thanks.

-- 
Bye, Peter Korsgaard
