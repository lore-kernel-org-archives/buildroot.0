From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Dec 2019 22:51:29 +0000
Subject: [Buildroot] [Bug 12286] Can't import gobject in python 3.8
In-Reply-To: <bug-12286-163@https.bugs.busybox.net/>
References: <bug-12286-163@https.bugs.busybox.net/>
Message-ID: <bug-12286-163-sx4JA28H9c@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12286

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
"Fixed" by commit 4a392d1678 which excludes python-gobject for python3.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
