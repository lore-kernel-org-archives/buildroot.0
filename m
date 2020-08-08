From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 08 Aug 2020 22:18:08 +0000
Subject: [Buildroot] [Bug 12876] nodejs fails to build when host-icu has
 been built before
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-M8uQ9nph0y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
This was fixed by
https://git.buildroot.org/buildroot/commit/package/nodejs?id=319f7b0dab761483c7bf60dd933aa8ec485a06e1.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
