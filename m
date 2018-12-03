From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 03 Dec 2018 12:39:45 +0000
Subject: [Buildroot] [Bug 11536] dt-utils building fails with glibc 2.28
In-Reply-To: <bug-11536-163@https.bugs.busybox.net/>
References: <bug-11536-163@https.bugs.busybox.net/>
Message-ID: <bug-11536-163-2c10b3RyBD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11536

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks a lot for the report, we just fixed this in commit
https://git.buildroot.org/buildroot/commit/?id=7e5094033df2efc88928071c6e7a2867c396ca68.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
