From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:48:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: bump version for more
 post-2.28 fixes
In-Reply-To: <20190103200911.8779-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Thu, 3 Jan 2019 20:09:11 +0000")
References: <20190103200911.8779-1-mark.corbin@embecosm.com>
Message-ID: <87zhrqgwl3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > This update includes two specific fixes that have been backported
 > to the glibc 2.28 release branch from the glibc master branch:

 > 1) UAPI header file asm/syscalls.h has been merged into the UAPI
 > asm/unistd.h header file for the RISC-V architecture in the
 > 4.20 kernel. This causes the glibc 2.28 build to break.

 > 2) sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
 > [BZ #19444]. The current patch for this issue can now be dropped
 > from Buildroot.

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
