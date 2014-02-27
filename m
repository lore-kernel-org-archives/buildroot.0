From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 14:36:50 +0100
Subject: [Buildroot] [PATCH v2 2/2] e2fsprogs: disable e4defrag for nios
In-Reply-To: <1392933578-2256-2-git-send-email-frank@frajasalo.de> (Frank
 Bergmann's message of "Thu, 20 Feb 2014 22:59:38 +0100")
References: <1392933578-2256-1-git-send-email-frank@frajasalo.de>
 <1392933578-2256-2-git-send-email-frank@frajasalo.de>
Message-ID: <8761o0ad8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Bergmann <frank@frajasalo.de> writes:

 > e4defrag has to be disabled because of the (external) toolchain declares
 > the fallocate64 call in the header files but don't implement it in the
 > library. e4defrag defines its own fallocate64 function that throws an
 > error because of the previous declaration in the toolchain header.

 > Signed-off-by: Frank Bergmann <frank@frajasalo.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
