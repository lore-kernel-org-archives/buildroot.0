From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 11:38:46 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix XTENSA_NDIFF handling
 for PR ld/25861
In-Reply-To: <20200430050822.32017-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Wed, 29 Apr 2020 22:08:22 -0700")
References: <20200430050822.32017-1-jcmvbkbc@gmail.com>
Message-ID: <875zd6sr4p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Fix for xtensa PR ld/25861 introduced a regression in handling negative
 > symbol differences resulting in linker performing incorrect relaxation
 > or failing to link. Fix XTENSA_NDIFF relocation handling.

 > Backported from:
 > https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=d548f47df4d2e3d117d504a4c9977982c78a0556

 > Fixes: f0291ef4aba0 ("package/binutils: fix xtensa PR ld/25861")
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
