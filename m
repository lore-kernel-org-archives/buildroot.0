From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 23:31:22 +0200
Subject: [Buildroot] [PATCH v2] uClibc: Add uClibc patch to fix
	MIPS64/n64 interpreter
In-Reply-To: <1374249463-10594-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Fri, 19 Jul 2013 16:57:43 +0100")
References: <1374249463-10594-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <8738rauthx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> uClibc picks the wrong interpreter for MIPS64/n64.
 Markos> This patch fixes this problem by checking the selected
 Markos> MIPS ABI instead of the MIPS variant.

 Markos> The patch has been committed upstream:
 Markos> http://git.uclibc.org/uClibc/commit/?id=603af30d6992e94ac30a66b953264076f4f2fd71

Committed, thanks.

-- 
Bye, Peter Korsgaard
