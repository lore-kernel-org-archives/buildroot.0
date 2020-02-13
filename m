From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2020 17:10:46 +0000
Subject: [Buildroot] [Bug 12511] rng-tools has forced dependency on
 jitterentropy-library ; It slows boot considerably
In-Reply-To: <bug-12511-163@https.bugs.busybox.net/>
References: <bug-12511-163@https.bugs.busybox.net/>
Message-ID: <bug-12511-163-9jwR7jRoLz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12511

--- Comment #5 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Yegor noted in the http://patchwork.ozlabs.org/patch/1233971/ thread that the
bump of rng-tools made the startup cost of having jitterentropy as a source
better. 

Axel, I'll let you confirm if you feel this did enough or if we still need to
breakout providing the user an option.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
