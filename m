From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 01 Dec 2020 22:13:13 +0000
Subject: [Buildroot] [Bug 13276] libcap builds libcap.pc incorreclty
In-Reply-To: <bug-13276-163@https.bugs.busybox.net/>
References: <bug-13276-163@https.bugs.busybox.net/>
Message-ID: <bug-13276-163-SYBbMT04Dz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13276

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed on master, thanks:

https://git.buildroot.org/buildroot/commit/?id=07f8ea39139299c83777a338a30cd480633d5706

-- 
You are receiving this mail because:
You are on the CC list for the bug.
