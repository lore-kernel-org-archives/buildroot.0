From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Aug 2010 21:34:21 +0000 (UTC)
Subject: [Buildroot] [Bug 2443] Initramfs: Don't overwrite
 $(TARGET_DIR)/init if it exists
In-Reply-To: <bug-2443-163@https.bugs.busybox.net/>
References: <bug-2443-163@https.bugs.busybox.net/>
Message-ID: <20100829213421.D8E598A2D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2443

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
Committed, thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
