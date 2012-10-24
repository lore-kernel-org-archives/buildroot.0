From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Oct 2012 21:04:42 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20121024210442.BB4739991E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> 2012-10-24 21:04:41 UTC ---
Would it help to pass LD="$(TARGET_LD) $(TARGET_LDFLAGS)" to configure?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
