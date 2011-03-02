From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Mar 2011 14:35:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] -fstack-protector-all causes ssh to SIGSEGV
In-Reply-To: <bug-2995-163@https.bugs.busybox.net/>
References: <bug-2995-163@https.bugs.busybox.net/>
Message-ID: <20110302143507.E98B78E0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Maybe this should be reported on the uclibc list.

Also the official 0.9.32 should be released fairly soon now, so probably you'll
be able to have *both* an official release and stack protection in your product
:-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
