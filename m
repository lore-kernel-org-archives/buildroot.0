From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 21:56:01 +0100
Subject: [Buildroot] [PATCH] glibc: security bump to the latest commit
 on 2.26 branch
In-Reply-To: <20180215230100.7869-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 16 Feb 2018 00:01:00 +0100")
References: <20180215230100.7869-1-peter@korsgaard.com>
Message-ID: <87606ukof2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues according to NEWS:
 > CVE-2018-6485: An integer overflow in the implementation of the
 > posix_memalign in memalign functions in the GNU C Library (aka

 > CVE-2018-6551: The malloc implementation in the GNU C Library (aka glibc or
 > libc6), from version 2.24 to 2.26 on powerpc, and only in version 2.26 on
 > i386, did not properly handle malloc calls with arguments close to SIZE_MAX
 > and could return a pointer to a heap region that is smaller than requested,
 > eventually leading to heap corruption.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
