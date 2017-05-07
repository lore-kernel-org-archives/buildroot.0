From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 May 2017 13:39:44 +0000
Subject: [Buildroot] [Bug 9856] build libubox failed on ubuntu 17.04 64bit
In-Reply-To: <bug-9856-163@https.bugs.busybox.net/>
References: <bug-9856-163@https.bugs.busybox.net/>
Message-ID: <bug-9856-163-TWDtaLwON1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9856

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=be3645a58ad1ee3961c4da1b2f72f5835629303a.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
