From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 14:57:25 +0200
Subject: [Buildroot] [PATCH for 2017.02.x] package/binutils: fix crash
	caused by buggy xtensa overlay
In-Reply-To: <1504651289-10525-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Tue, 5 Sep 2017 15:41:29 -0700")
References: <1504651289-10525-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87zia8c7d6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > In some xtensa configurations there may be system/user registers in
 > xtensa-modules with negative index. ISA initialization for such config
 > may clobber heap and result in program termination.
 > Don't update lookup table entries for register with negative indices.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
