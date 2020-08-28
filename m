From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Aug 2020 21:06:41 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-PKQri6UkAO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #10 from Peter Korsgaard <jacmet@uclibc.org> ---
Worked around in git:
https://git.buildroot.org/buildroot/commit/?id=3f6a40e9fae92b3fe476d82449ddd6851cea03da

-- 
You are receiving this mail because:
You are on the CC list for the bug.
