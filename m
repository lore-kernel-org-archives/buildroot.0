From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Nov 2012 22:25:30 +0100
Subject: [Buildroot] [PATCH] cpanminus: mark as broken
In-Reply-To: <1353074474-1684-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 16 Nov 2012 15:01:14 +0100")
References: <1353074474-1684-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2zdxmt1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> cpanminus is currently responsible for about half of the autobuilder
 Thomas> failures, due to the missing dependency on host-qemu. However, even
 Thomas> with the host-qemu proposed by Arnout, cpanminus will still not work
 Thomas> properly: it will try to execute on the build machine executables
 Thomas> built for the target. While qemu is here to emulate the instruction
 Thomas> set, there is still the unsolved problem of kernel headers version
 Thomas> mismatch between the target and the build environments.

 Thomas> So the whole approach that consists in using host-qemu for building
 Thomas> simply cannot work properly, and until it is solved, the package
 Thomas> should be marked as broken.

Committed, thanks.

-- 
Bye, Peter Korsgaard
