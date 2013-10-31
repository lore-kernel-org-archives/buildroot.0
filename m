From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Oct 2013 10:23:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6428] util-linux libmount segfaults with patch
	from buildroot
In-Reply-To: <bug-6428-163@https.bugs.busybox.net/>
References: <bug-6428-163@https.bugs.busybox.net/>
Message-ID: <20131031102324.829F59BC4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6428

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-10-31 10:23:24 UTC ---
This was solved by Ryan Barnett's bump to version 2.23 in commit
66c0d5d05c1a81a5b4b3d4d780af4229c9c79662
Thanks for the headsup anyway!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
