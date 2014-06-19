From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Jun 2014 17:59:13 +0200
Subject: [Buildroot] [PATCH 0/2] strace: fix ptrace {PEEK,
	POKE}USER arguments decoding on xtensa
In-Reply-To: <1403108520-26869-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Wed, 18 Jun 2014 20:21:58 +0400")
References: <1403108520-26869-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <874mzg28mm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi,
 > this series adds serial numbers to existing strace patches and backports
 > an xtensa-specific fix for {PEEK,POKE}USER register number decoding.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
