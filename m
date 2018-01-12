From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Jan 2018 18:59:49 +0000
Subject: [Buildroot] [Bug 9996] lz4 package does not install lz4 binaries in
 target
In-Reply-To: <bug-9996-163@https.bugs.busybox.net/>
References: <bug-9996-163@https.bugs.busybox.net/>
Message-ID: <bug-9996-163-tkcbWODKEy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9996

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=6f1c11f79a64387c1f1749550804f8aae0cfa7a7,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
