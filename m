From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 13:16:52 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20150516131652.96C108083F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2015-05-16 13:16:52 UTC ---
(In reply to comment #2)
> Was wondering if we shouldn't just (offer an option to) enable busybox's
> ifplugd?
> 
> While the Pi is one of the few that has Ethernet through USB, I think this also
> affects other platforms that have their Wifi through USB.

Ifplugd is nice, but it wouldn't fix anything here as the problem is that eth0
isn't available yet when S40network runs, so ifplugd would also fail.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
