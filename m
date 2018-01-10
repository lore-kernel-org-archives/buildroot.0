From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 22:07:02 +0000
Subject: [Buildroot] [Bug 10176] Rsyslog's S01logging is deleted by
 Busybox.mk from TARGET
In-Reply-To: <bug-10176-163@https.bugs.busybox.net/>
References: <bug-10176-163@https.bugs.busybox.net/>
Message-ID: <bug-10176-163-3VS5hDRWlU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10176

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=84e835ea9261b3e844f1a18489dd89253e3eb839.
Thanks for reporting the bug in the first place, and sorry for the long delay!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
