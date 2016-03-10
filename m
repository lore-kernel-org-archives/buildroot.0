From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 15:36:19 +0100
Subject: [Buildroot] [PATCH] gdb: backport xtensa NPTL support to 7.10.1
In-Reply-To: <1457584310-20884-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 10 Mar 2016 07:31:50 +0300")
References: <1457584310-20884-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87d1r2o0ws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > These changes allow debugging multithreaded NPTL xtensa applications and
 > inspect TLS variables.

 > Backported from: 40045d91812b25c88c8275b8c08d27c234b68ba8
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
