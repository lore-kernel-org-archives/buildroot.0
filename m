From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Nov 2014 22:45:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141112224550.1DB72B5AA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-12 22:45:49 UTC ---
Hint: since Python 3, Python is using wcsftime() instead of strftime() while
Python 2 was using strftime().

Beyonlo, could you write a C program to test wcsftime() and verify that it
works?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
