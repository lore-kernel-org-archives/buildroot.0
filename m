From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 May 2014 17:13:31 +0200
Subject: [Buildroot] [PATCH v2] clapack: Disable for MIPS platforms
In-Reply-To: <1399380451-25912-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 6 May 2014 13:47:31 +0100")
References: <1399380451-25912-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ha53ey90.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Disable this package for MIPS because it needs IRIX headers and
 > libraries.

 > Fixes:
 >    http://autobuild.buildroot.net/results/370/370f964441722675820c644403dde7fbc683a315/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
