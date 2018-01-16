From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Jan 2018 23:03:11 +0000
Subject: [Buildroot] [Bug 10136] can't compile systemd with GCC 7.X when
 optimization is on
In-Reply-To: <bug-10136-163@https.bugs.busybox.net/>
References: <bug-10136-163@https.bugs.busybox.net/>
Message-ID: <bug-10136-163-ftp6H2fgCI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=db860d7837ca8665524f4046030beaf3d7f5e932.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
