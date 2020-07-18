From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 14:08:59 +0000
Subject: [Buildroot] [Bug 13046] Optimize for fast -Ofast is not compliant
In-Reply-To: <bug-13046-163@https.bugs.busybox.net/>
References: <bug-13046-163@https.bugs.busybox.net/>
Message-ID: <bug-13046-163-Ykl27U6M8t@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13046

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=3e186cee008f94f6a33adeac329b13087ab11ddb.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
