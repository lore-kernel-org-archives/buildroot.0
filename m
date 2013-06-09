From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Jun 2013 22:04:05 +0200
Subject: [Buildroot] [PATCH] linphone: Disable building with -Werror
In-Reply-To: <1370617470-16073-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Fri, 7 Jun 2013 16:04:30 +0100")
References: <1370617470-16073-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <871u8b9hl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> Pass --disable-strict to avoid having -Werror in CFLAGS.
 Markos> Having -Werror in CFLAGS can lead to build problems depending
 Markos> on the gcc version that is being used and it should not be used
 Markos> in released code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
