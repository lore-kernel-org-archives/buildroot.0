From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 23:27:35 +0200
Subject: [Buildroot] [PATCH 0/2] xtensa binutils fixes backports
In-Reply-To: <1399503065-18819-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 8 May 2014 02:51:03 +0400")
References: <1399503065-18819-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87tx8uwuuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi Thomas,
 > this series backports two fixes for binutils:
 > - first fixes call target misalignment during link-time relaxation often
 >   seen with linux kernel builds;
 > - second fixes 'overflow after relaxation' link-time error recently seen
 >   with some buildroot packages.

 > Max Filippov (2):
 >   binutils: backport first section frag alignment fix for xtensa gas
 >   binutils: backport R_XTENSA_DIFF* relocation signedness fix

Committed both, thanks.

-- 
Bye, Peter Korsgaard
