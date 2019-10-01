From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 08:07:44 +0200
Subject: [Buildroot] [PATCH v2] package/gcc: backport fix for xtensa PR
 90922
In-Reply-To: <20190923204703.18313-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Mon, 23 Sep 2019 13:47:03 -0700")
References: <20190923204703.18313-1-jcmvbkbc@gmail.com>
Message-ID: <87blv10zin.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Stack pointer adjustment code in xtensa call0 ABI prologue missed a case
 > of no callee-saved registers and a stack frame size bigger than 128 bytes.
 > Handle that case.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 > Changes v1->v2:
 > - fix subject line

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
