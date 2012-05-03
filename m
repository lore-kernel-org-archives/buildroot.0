From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 May 2012 20:26:27 +0000 (UTC)
Subject: [Buildroot] [Bug 4970] udev 181 fails to build if kernel version
	3.3 is selected
In-Reply-To: <bug-4970-163@https.bugs.busybox.net/>
References: <bug-4970-163@https.bugs.busybox.net/>
Message-ID: <20120503202627.A823496C64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4970

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2012-05-03 20:26:27 UTC ---
Fixed by commit e1443db85bc7dc2a863c4bbfdf6fe777f390ad70

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
