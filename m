From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Feb 2017 20:57:20 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.22
In-Reply-To: <20170202061653.GA20021@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 2 Feb 2017 07:16:53 +0100")
References: <20170202061653.GA20021@waldemar-brodkorb.de>
Message-ID: <87inor11zz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > - fixes mips{32,64}r6 support
 > - adds experimental aarch64 support
 > - fixes syscalls with 6 arguments for x86
 > - removes PID caching and simplifies architecture specific code

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
