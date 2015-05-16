From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 10:58:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20150516105819.8A9CC81768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

--- Comment #2 from Floris Bos <bos@je-eigen-domein.nl> 2015-05-16 10:58:19 UTC ---
Was wondering if we shouldn't just (offer an option to) enable busybox's
ifplugd?

While the Pi is one of the few that has Ethernet through USB, I think this also
affects other platforms that have their Wifi through USB.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
