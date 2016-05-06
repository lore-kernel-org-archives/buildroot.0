From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 May 2016 13:52:20 +0000
Subject: [Buildroot] [Bug 8436] xserver_xorg-server Segmentation fault
In-Reply-To: <bug-8436-163@https.bugs.busybox.net/>
References: <bug-8436-163@https.bugs.busybox.net/>
Message-ID: <bug-8436-163-HTysX0UPTU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8436

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
"Fixed" by
https://git.busybox.net/buildroot/commit/?id=5500211e201f84b6e2ce0dd5ff3013fb92628860.
I.e, we force -O2 for the X.org server.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
