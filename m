From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Apr 2017 13:46:31 +0000
Subject: [Buildroot] [Bug 9791] Python searches for packages in the user
	site directory
In-Reply-To: <bug-9791-163@https.bugs.busybox.net/>
References: <bug-9791-163@https.bugs.busybox.net/>
Message-ID: <bug-9791-163-E1CUrg2iLh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9791

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=f5da1951ad1e81cc8641f2c90e96fe36d08ec6f9.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
