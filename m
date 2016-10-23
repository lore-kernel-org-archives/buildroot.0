From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 12:55:03 +0000
Subject: [Buildroot] [Bug 9371] openssl: download failes with "Only allow
 downloads from primary download site" + local server
In-Reply-To: <bug-9371-163@https.bugs.busybox.net/>
References: <bug-9371-163@https.bugs.busybox.net/>
Message-ID: <bug-9371-163-H7b8Q9VsF6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9371

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=8740f321fcd2b245e3585b319e2a87aa361656cd.
Thanks Johan for the bug report, thanks Arnout for the patch!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
