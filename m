From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 11:11:20 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] Buildroot GCC: -lto requires plugin support
	in ranlib
In-Reply-To: <bug-7592-163@https.bugs.busybox.net/>
References: <bug-7592-163@https.bugs.busybox.net/>
Message-ID: <20141109111120.74E22AEEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

--- Comment #3 from syntheticpp at gmx.net 2014-11-09 11:11:20 UTC ---
The problem is that arm-linux-gcc-ar/ranlib are also wrapped by
ext-toolchain-wrapper.
When those tools just link to the external toolchain lto works (without
switching to gold)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
