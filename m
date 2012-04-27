From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Apr 2012 21:49:13 +0000 (UTC)
Subject: [Buildroot] [Bug 4970] udev 181 fails to build if kernel version
	3.3 is selected
In-Reply-To: <bug-4970-163@https.bugs.busybox.net/>
References: <bug-4970-163@https.bugs.busybox.net/>
Message-ID: <20120427214913.9D7B196BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4970

--- Comment #4 from James Le Cuirot <chewi@aura-online.co.uk> 2012-04-27 21:49:13 UTC ---
Aha! Found the cause and it turns out this is a Linux bug that has already been
fixed.

http://kernel.opensuse.org/cgit/kernel/commit/?id=4141a94694efc7d6c58e81bc55717161438d7816

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
