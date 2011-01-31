From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Jan 2011 20:16:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1681] Cross-compiled binaries shouldn't be
 installed into staging
In-Reply-To: <bug-1681-163@https.bugs.busybox.net/>
References: <bug-1681-163@https.bugs.busybox.net/>
Message-ID: <20110131201637.761488E39F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1681

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Solved in git with the toolchain rework.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
