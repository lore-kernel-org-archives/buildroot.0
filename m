From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2014 01:03:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libcap: Fix build error with
	kernel headers < 3.6
In-Reply-To: <1414347915-2617-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sun, 26 Oct 2014 19:25:15 +0100")
References: <1414347915-2617-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87r3xu750e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/cce/cceb1ccacec36fb7ef41bb7cdb13b3014813b599/

 > XATTR_NAME_CAPS appears in kernel headers since 3.7:
 > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/include/uapi/linux/xattr.h?id=v3.7

 > Before it was an internal define of the kernel:
 > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/xattr.h?id=607ca46e97a1b6594b29647d98a32d545c24bdff

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: propagate to reverse dependencies (Thomas)

Committed, thanks.

-- 
Bye, Peter Korsgaard
