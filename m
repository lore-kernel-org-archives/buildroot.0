From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2019 19:41:27 +0000
Subject: [Buildroot] [Bug 12166] Compiling nodejs for SAMA5D3 always crash
 with illegal instruction
In-Reply-To: <bug-12166-163@https.bugs.busybox.net/>
References: <bug-12166-163@https.bugs.busybox.net/>
Message-ID: <bug-12166-163-bx7qhGaPUG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12166

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=f3c80d711c8954e408397f7a18fb9fdaaf42d773

-- 
You are receiving this mail because:
You are on the CC list for the bug.
