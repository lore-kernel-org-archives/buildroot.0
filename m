From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Apr 2013 21:00:05 +0200
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
 (Alexandre Belloni's message of "Mon, 4 Feb 2013 23:26:13 +0100")
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
Message-ID: <878v425vm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@piout.net> writes:

 Alexandre> Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>

Hi,

Will you send a v2 fixing the comments Thomas had?

For the on2-8170-libs package, do you know what toolchain the binaries
have been built with? Do we need to limit the C library / arch variant
to ensure it is only available on compatible configs?

-- 
Bye, Peter Korsgaard
