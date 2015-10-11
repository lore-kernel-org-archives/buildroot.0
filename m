From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Oct 2015 13:06:09 +0000 (UTC)
Subject: [Buildroot] [Bug 8391] Node.js 0.12.7 fails to build on
	raspberry_pi defconfig
In-Reply-To: <bug-8391-163@https.bugs.busybox.net/>
References: <bug-8391-163@https.bugs.busybox.net/>
Message-ID: <20151011130609.A9AF881DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8391

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-11 13:06:09 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=eec69cdcaff10c6221ff0be603eacb3fdb9d6448.
Thanks Tomas for reporting the problem, and thanks to Peter for fixing it!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
