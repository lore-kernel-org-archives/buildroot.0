From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Aug 2017 13:58:48 +0000
Subject: [Buildroot] [Bug 10026] [PATCH] lua-5.3.4: fix lua linker error in
	swupdate
In-Reply-To: <bug-10026-163@https.bugs.busybox.net/>
References: <bug-10026-163@https.bugs.busybox.net/>
Message-ID: <bug-10026-163-ICouPx4tDG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10026

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=8d845683e37640d33c186c0091ccce6ae3ef0777.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
