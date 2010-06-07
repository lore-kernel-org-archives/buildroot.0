From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 14:22:56 +0000 (UTC)
Subject: [Buildroot] [Bug 583] build fails with external x86_64 toolchain
In-Reply-To: <bug-583-163@https.bugs.busybox.net/>
References: <bug-583-163@https.bugs.busybox.net/>
Message-ID: <20100607142256.57D0C8D9C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=583

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, I confirm the issue and agrees with your proposal. I've written a patch
implementing this, but unfortunately, the build still doesn't work for me due
to mix between the host x86-64 C library and the target x86-64 C library. I'll
try to work these out.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
