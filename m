From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Aug 2010 06:31:29 +0000 (UTC)
Subject: [Buildroot] [Bug 2353] [lua] fix build with 2010.08-rc1
In-Reply-To: <bug-2353-163@https.bugs.busybox.net/>
References: <bug-2353-163@https.bugs.busybox.net/>
Message-ID: <20100822063129.3DCEA88F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2353

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Oh, by the way, I did a test with the patch I mentionned, and readline is
indeed working in the Lua interpreter (history, Ctrl+a, Ctrl+e, etc.)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
