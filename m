From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 11:19:42 +0200
Subject: [Buildroot] [PATCH] gdb: Reenable makeinfo for GDB from git
In-Reply-To: <1401180338-18317-1-git-send-email-Anton.Kolesov@synopsys.com>
 (Anton Kolesov's message of "Tue, 27 May 2014 12:45:38 +0400")
References: <1401180338-18317-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <87mwe3efyp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <Anton.Kolesov@synopsys.com> writes:

 > This effectively reverts commit 21aaa85 for GDB versions that use Git
 > instead of upstream tarballs. When building GDB from Git it is required to
 > compile .info files from .texi files, otherwise build fails.

 > This fixes:
 > http://autobuild.buildroot.net/results/df6/df64fe6e834f016267f522f089e00a08b1fd893e/
 > http://autobuild.buildroot.net/results/95f/95fa2904f81a114abfa337dcce141b7c87d5a52c/

Sorry, I just committed a similar fix myself:

http://git.buildroot.net/buildroot/commit/?id=ffd243c6527250c488a83ee22460416e167be7dd

-- 
Bye, Peter Korsgaard
