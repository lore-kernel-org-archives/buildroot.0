From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 10:33:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7562] musl buildroot-toolchain and
	BR2_MIPS_SOFT_FLOAT break
In-Reply-To: <bug-7562-163@https.bugs.busybox.net/>
References: <bug-7562-163@https.bugs.busybox.net/>
Message-ID: <20141109103357.66D59A3307@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7562

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-09 10:33:56 UTC ---
Issue reported upstream at
https://bitbucket.org/GregorR/musl-cross/issue/4/invalid-mips-soft-float-linker-path.
I am not entirely sure what is the proper condition to add in gcc to determine
if the -sf suffix should be added or not. I'll wait for upstream to give a hint
about this before cooking a patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
