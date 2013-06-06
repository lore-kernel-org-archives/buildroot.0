From: Chris Zankel <chris@zankel.net>
Date: Thu, 06 Jun 2013 11:56:58 -0700
Subject: [Buildroot] strace-4.8
Message-ID: <51B0DB7A.3070507@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With strace-4.8 just released, we can probably now enable the package
for aarch64(?), arc, and xtensa :-)

I don't have a patch ready (yet), as there are two patches in the strace
package I'm not sure are still necessary:

strace-fix-arm-bad-syscall.patch - add fix for ARM fake syscall from
execve. Closes #626
strace-fix-disabled-largefile-syscalls.patch - bump version and make it
behave of LFS is of

Thanks,
-Chris
