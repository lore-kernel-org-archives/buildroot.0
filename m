From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Feb 2011 03:49:09 +0000 (UTC)
Subject: [Buildroot] [Bug 3295] slang fails to build on mipsel
In-Reply-To: <bug-3295-163@https.bugs.busybox.net/>
References: <bug-3295-163@https.bugs.busybox.net/>
Message-ID: <20110219034909.28A868F5E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3295

--- Comment #3 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #0)
> /home/test/toolchains/br-mipsel-full/usr/bin/../lib/gcc/mipsel-unknown-linux-uclibc/4.4.4/../../../../mipsel-unknown-linux-uclibc/bin/ld:
> sldisply.o: relocation R_MIPS_HI16 against `a local symbol' can not be used
> when making a shared object; recompile with -fPIC
> sldisply.o: could not read symbols: Bad value
> collect2: ld returned 1 exit status
> make[1]: *** [libslang.so] Error 1

I also see (on mipsel) this "compile error", also have other "compile error"
with metacity if you want checkout ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
