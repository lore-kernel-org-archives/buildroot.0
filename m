From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Oct 2015 11:58:37 +0000 (UTC)
Subject: [Buildroot] [Bug 8416] [buildroot 2015.8] cups depends on
 BR2_DEPRECATED_SINCE_2015_05
In-Reply-To: <bug-8416-163@https.bugs.busybox.net/>
References: <bug-8416-163@https.bugs.busybox.net/>
Message-ID: <20151021115837.7CF0781E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8416

--- Comment #1 from abma <spam@abma.de> 2015-10-21 11:58:37 UTC ---
oh, found a note in

package/cups/Config.in

"serious security issues, needs upgrading"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
