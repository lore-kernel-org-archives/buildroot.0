From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:03:18 +0000 (UTC)
Subject: [Buildroot] [Bug 6554] gdb needs to dependents on host texinfo
In-Reply-To: <bug-6554-163@https.bugs.busybox.net/>
References: <bug-6554-163@https.bugs.busybox.net/>
Message-ID: <20131114000318.97E439BC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6554

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:03:18 UTC ---
Hum, right. However, I believe it would be nicer to completely disable the
generation of the documentation in gdb, because we typically don't need it in
the context of Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
