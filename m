From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Apr 2011 14:06:29 +0000 (UTC)
Subject: [Buildroot] [Bug 3541] Quotes in the top Makefile:217 break
 buildroot/kernel config build under cygwin
In-Reply-To: <bug-3541-163@https.bugs.busybox.net/>
References: <bug-3541-163@https.bugs.busybox.net/>
Message-ID: <20110404140629.767D581A0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3541

--- Comment #2 from Oleg Semyonov <os-bugs-qztrsta-uclibc@os-propo.info>  ---
(In reply to comment #1)
> Out of interest, is Buildroot really working for you on Cygwin? I don't recall
> ever hearing for any other Cygwin users.

I am using it on Linux, but parts of software we're deleloping on Windows using
MS Visual Studio for emulation win32 project and then cross-compiling the
source for the arm target.

So I used buildroot under cygwin to build arm uClibc and C++ cross-toolchain
(it works for me few years already). Trying to do this yesterday, it stopped
building on busybox. But I just didn't have enough time to see the problem. It
doesn't find some headers which are definitely exist (shadow.h).

Will be interesting if I could build whole file system and kernel under cygwin
in the end :-)  Don't say it is very important for us, but it is at least
interesting to try.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
