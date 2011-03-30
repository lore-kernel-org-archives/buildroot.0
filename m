From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Mar 2011 22:39:36 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] alsa-lib 1.0.24.1 build fails with daily
 snapshot (2011-03-29)
In-Reply-To: <bug-3529-163@https.bugs.busybox.net/>
References: <bug-3529-163@https.bugs.busybox.net/>
Message-ID: <20110330223936.06DCE81A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

--- Comment #5 from Michael J. Hammel <mjhammel@graphics-muse.org>  ---
I think that may have been the latest available in Crosstool-NG 1.8.2 which was
what I was using before testing the latest release (1.10.0).  Looks like 1.10.0
only has uClibc 0.9.30.[1-3].  0.9.31 is marked EXPERIMENTAL.  There is also a
"latest snapshot" option I can try.

I'll give those a try and see if things fare any better.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
