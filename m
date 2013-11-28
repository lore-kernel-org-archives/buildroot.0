From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2013 17:25:07 +0000 (UTC)
Subject: [Buildroot] [Bug 5570] Cannot compile software on the target machine
In-Reply-To: <bug-5570-163@https.bugs.busybox.net/>
References: <bug-5570-163@https.bugs.busybox.net/>
Message-ID: <20131128172507.1E5F69BE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5570

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-28 17:25:06 UTC ---
This is deprecated functionality, hence marking as WONTFIX.
Support for building in the target was always flaky/broken and nobody cared to
fix it properly so it was decided to drop that option some time ago.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
