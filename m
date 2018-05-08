From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 May 2018 13:03:46 +0000
Subject: [Buildroot] [Bug 10896] /bin/sh not in /etc/shells
In-Reply-To: <bug-10896-163@https.bugs.busybox.net/>
References: <bug-10896-163@https.bugs.busybox.net/>
Message-ID: <bug-10896-163-a8M7LyTWs6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10896

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
In the 2018.02.x branch, we reverted the patch pointed by Arnout. For the
master branch, and upcoming 2018.05, we also applied the series pointed by
Arnout. Hence this bug is fixed. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
