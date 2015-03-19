From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2015 17:15:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7724] Startx is not installed in the target
In-Reply-To: <bug-7724-163@https.bugs.busybox.net/>
References: <bug-7724-163@https.bugs.busybox.net/>
Message-ID: <20150319171550.1552D807C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7724

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-03-19 17:15:49 UTC ---
startx is part of the xinit package, you just need to add it to your target
configuration.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
