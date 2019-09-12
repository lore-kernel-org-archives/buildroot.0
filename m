From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Sep 2019 17:16:02 +0000
Subject: [Buildroot] [Bug 10806] Allow nfs-utils to use ipv6
In-Reply-To: <bug-10806-163@https.bugs.busybox.net/>
References: <bug-10806-163@https.bugs.busybox.net/>
Message-ID: <bug-10806-163-iNkH2waBPN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10806

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=749334cb36ea5c0a0fd745dada43122f88a3144c.
Thanks a lot Carlos for your work on this issue!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
