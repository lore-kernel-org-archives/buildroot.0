From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:47:07 +0200
Subject: [Buildroot] [PATCH] package/gcc: xtensa: fix atomic NAND code
 generation
In-Reply-To: <20180905164839.14360-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Wed, 5 Sep 2018 09:48:39 -0700")
References: <20180905164839.14360-1-jcmvbkbc@gmail.com>
Message-ID: <87sh1t7pro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > xtensa gcc incorrectly generates code for atomic NAND operation as
 > ~a1 & a2 instead of ~(a1 & a2). Fix that.

 > Backported from: r264087
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2018.02.x and 2018.05.x after dropping the gcc 8.x patch,
thanks.

-- 
Bye, Peter Korsgaard
