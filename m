From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 14:16:00 +0000
Subject: [Buildroot] [Bug 9641] Need raptor package installed in staging
In-Reply-To: <bug-9641-163@https.bugs.busybox.net/>
References: <bug-9641-163@https.bugs.busybox.net/>
Message-ID: <bug-9641-163-XDvRH5bJ8I@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9641

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This has been fixed in the next branch in commit
https://git.buildroot.org/buildroot/commit/package/raptor?h=next&id=b4f54a98a38905fb4ca5413e174263913e20c9c3.
The next branch will be merged in master right after 2017.02 is released, and
therefore this change will be part of the 2017.05 release. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
