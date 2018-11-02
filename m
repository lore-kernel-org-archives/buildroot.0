From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 20:37:23 +0000
Subject: [Buildroot] [Bug 11251] Util scanpypi failes when package change -
 to _ in tar file (Trunk)
In-Reply-To: <bug-11251-163@https.bugs.busybox.net/>
References: <bug-11251-163@https.bugs.busybox.net/>
Message-ID: <bug-11251-163-5qgcNcpTV2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11251

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=fd29797f659c09cbc2aeba33f8d6f5b992e65cd4.
Thanks Yegor!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
