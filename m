From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 13:20:14 +0000
Subject: [Buildroot] [Bug 11671] russian locale ru_RU:145: LC_TIME: syntax
 error
In-Reply-To: <bug-11671-163@https.bugs.busybox.net/>
References: <bug-11671-163@https.bugs.busybox.net/>
Message-ID: <bug-11671-163-c9fFo6rSYi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11671

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This issue has been fixed by
https://git.buildroot.org/buildroot/commit/package/localedef?id=0ec7169e6c8cfb4bb54defb685bd04bb1da0a2aa.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
