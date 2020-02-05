From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 Feb 2020 18:27:14 +0000
Subject: [Buildroot] [Bug 12511] rng-tools has forced dependency on
 jitterentropy-library ; It slows boot considerably
In-Reply-To: <bug-12511-163@https.bugs.busybox.net/>
References: <bug-12511-163@https.bugs.busybox.net/>
Message-ID: <bug-12511-163-uCgcqS8UIn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12511

--- Comment #2 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Would you mind testing this proposed fix?
http://patchwork.ozlabs.org/patch/1233971/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
