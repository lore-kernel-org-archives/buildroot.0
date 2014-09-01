From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Sep 2014 16:14:32 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Add CodeSourcery
	Nios-II 2014.05
In-Reply-To: <1409520819-1211-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sun, 31 Aug 2014 18:33:39 -0300")
References: <1409520819-1211-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87fvgbl96f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > This new toolchain release fixes a number of issues found with the previous
 > one. In particular, the issues with fallocate64, prlimit64 and the
 > ill-installed linux headers seem to be fixed now.

 > Therefore, there's not need to sanitize the headers for this toolchain and some
 > packages should now build fine (e.g. fio).

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
