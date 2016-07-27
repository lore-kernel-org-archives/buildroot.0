From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Jul 2016 13:10:52 +0000
Subject: [Buildroot] [Bug 8986] qt5imageformats fails to build on AArch64
In-Reply-To: <bug-8986-163@https.bugs.busybox.net/>
References: <bug-8986-163@https.bugs.busybox.net/>
Message-ID: <bug-8986-163-KZkWk1wQ29@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8986

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by Peter in git, thanks:
https://git.buildroot.net/buildroot/commit/?id=c18d403a8df7a3dbe3aaffeb20f214ecd4d0bc3b

-- 
You are receiving this mail because:
You are on the CC list for the bug.
