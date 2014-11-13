From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 12:18:14 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141113121814.10F73B4446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #10 from Beyonlo <beyonlo@gmail.com> 2014-11-13 12:18:13 UTC ---
Hello.

Well, if the quickly solution is by telling Python explicitly to not use
wcsftime(), I think is a good idea. But I don't know if this solution is the
best way.

If you need more tests, please, let me know.

Thank you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
