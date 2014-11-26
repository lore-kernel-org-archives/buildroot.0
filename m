From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 16:08:25 +0100
Subject: [Buildroot] [PATCH] binutils: fix xtensa trampolines search
	code for conditional branches
In-Reply-To: <1416992580-20071-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Wed, 26 Nov 2014 12:03:00 +0300")
References: <1416992580-20071-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87a93eq9sm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > This fixes the following build errors seen when assembling huge files
 > produced by gcc:
 >   Error: jump target out of range; no usable trampoline found
 >   Error: operand 1 of 'j' has out of range value '307307'

 > Fixes:
 >   http://autobuild.buildroot.net/results/545/545168d9caf3bdb3dd3eb3bae58ba9db8a33384a/

 > Backported from: d92b6eece424f0ad35d96fdd85bf207295e8c4c3
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
