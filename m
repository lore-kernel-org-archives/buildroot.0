From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Jun 2020 07:23:51 +0000
Subject: [Buildroot] [Bug 13011] Incorrect selection of gcc version
In-Reply-To: <bug-13011-163@https.bugs.busybox.net/>
References: <bug-13011-163@https.bugs.busybox.net/>
Message-ID: <bug-13011-163-xswTjXbQCI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13011

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks for the report! This is already fixed in master in commit
https://git.buildroot.org/buildroot/commit/toolchain?id=5303e72a80e44c265473706a2d4f3acb5010814f

-- 
You are receiving this mail because:
You are on the CC list for the bug.
