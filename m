From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 22:04:41 +0000 (UTC)
Subject: [Buildroot] [Bug 8296] nodejs 0.12.7 - npm crashes (seg core dump)
In-Reply-To: <bug-8296-163@https.bugs.busybox.net/>
References: <bug-8296-163@https.bugs.busybox.net/>
Message-ID: <20151201220441.682418018E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8296

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-12-01 22:04:34 UTC ---
Thanks for the investigation. Can you rebuild with debugging symbols, and get a
core dump, to see where we are crashing?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
