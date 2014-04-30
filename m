From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Apr 2014 14:03:14 +0200
Subject: [Buildroot] [PATCH] qt: webkit is now supported on MIPS64
In-Reply-To: <1398848673-2579-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 30 Apr 2014 10:04:33 +0100")
References: <1398848673-2579-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87tx9brpml.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Since qt's version has been bumped to 4.8.6 we can add support for
 > webkit on MIPS64 architectures (both big and little endian). It wasn't
 > possible on 4.8.5 because QtScript wasn't supported on MIPS64, but that
 > has been fixed on 4.8.6.

 > With reference to:
 >    https://codereview.qt-project.org/#change,73022

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
