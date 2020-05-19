From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 May 2020 21:45:44 +0000
Subject: [Buildroot] [Bug 12256] package tar is outdated (1.29 is 3 years
 old)
In-Reply-To: <bug-12256-163@https.bugs.busybox.net/>
References: <bug-12256-163@https.bugs.busybox.net/>
Message-ID: <bug-12256-163-0ae1O0Bfkv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12256

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
We are now using tar 1.32 for the target. We had to keep tar 1.29 for the host,
though.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
