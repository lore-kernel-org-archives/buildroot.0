From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Apr 2021 19:21:07 +0000
Subject: [Buildroot] [Bug 13741] genext2fs does not allow to set perms of
 root node
In-Reply-To: <bug-13741-163@https.bugs.busybox.net/>
References: <bug-13741-163@https.bugs.busybox.net/>
Message-ID: <bug-13741-163-7xtIfgw2sm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13741

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Fixed by commit 51d55fc132.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
