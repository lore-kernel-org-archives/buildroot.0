From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Jan 2018 23:02:41 +0000
Subject: [Buildroot] [Bug 9566] [kmod] Compilation fails with uclibc
In-Reply-To: <bug-9566-163@https.bugs.busybox.net/>
References: <bug-9566-163@https.bugs.busybox.net/>
Message-ID: <bug-9566-163-aCZv4gqKp2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9566

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue has been fixed by the uClibc-ng change. The original reporter did
not provide additional details as to how to reproduce the problem with the
fixed uClibc-ng. Therefore, I'm closing this bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
