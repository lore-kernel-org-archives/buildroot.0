From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2015 12:20:17 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150806122017.CFB96819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #5 from CB <christophebricout@yahoo.fr> 2015-08-06 12:20:17 UTC ---
The OS is  RedHat 5 running on a X86 machine (32bits)

I am using "gmake" to build "buildroot 2005.05" but I could use "make". The
result should be the same.

For information, I have already build successfully "buildroot" using the same
procedure "gmake" and
I sucessfully generated toolchain, Uimage, uboot.bin for others targets like
"freescale sabre board" and others.

So, this issue "could be" linked to Minnow Max Target or X86_64 toolchain
running on a x86(32bits) host.   

Thanks again.

(In reply to comment #4)
> Why are you using 'gmake' instead of 'make' ? Are you perhaps building on a
> non-Linux system? If so, which one?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
