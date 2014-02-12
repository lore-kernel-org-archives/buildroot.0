From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Feb 2014 08:52:58 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20140212085258.AA8A19C9A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-12 08:52:56 UTC ---
This problem has been fixed with commit
7e9264956bb5693bc49274ee0b42ffb4c869e23f in buildroot 2013.11.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
