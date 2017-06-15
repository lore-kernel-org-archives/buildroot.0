From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Jun 2017 20:38:15 +0000
Subject: [Buildroot] [Bug 9951] SCANCPAN failure
In-Reply-To: <bug-9951-163@https.bugs.busybox.net/>
References: <bug-9951-163@https.bugs.busybox.net/>
Message-ID: <bug-9951-163-HkL8erIewB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9951

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=8710996bb7d69bd4fbbf59cd3c186a428334c187.
Thanks for having reported the bug, and thanks to Fran?ois Perrad for providing
the fix!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
