From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 09 May 2020 14:35:29 +0000
Subject: [Buildroot] [Bug 12871] QT5.14 Missing module Timeline
In-Reply-To: <bug-12871-163@https.bugs.busybox.net/>
References: <bug-12871-163@https.bugs.busybox.net/>
Message-ID: <bug-12871-163-5PZUXbFsI2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12871

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?h=next&id=7bbb1484ee4f61c432591511ed29c3447cb5a636.
It is indeed going to be present only for the 2020.08 release, not the upcoming
2020.05 release. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
