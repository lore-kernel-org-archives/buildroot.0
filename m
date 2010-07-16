From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jul 2010 21:46:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2191] linux-fusion build fail
In-Reply-To: <bug-2191-163@https.bugs.busybox.net/>
References: <bug-2191-163@https.bugs.busybox.net/>
Message-ID: <20100716214658.2D83082A80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2191

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Thanks for your fix. I've integrated it, and added more fixes needed for make
linux-fusion build with the current Buildroot git. I've just sent a pull
request to the mailing list with your fix and my additional fixes.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
