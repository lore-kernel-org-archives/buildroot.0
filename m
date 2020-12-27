From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 27 Dec 2020 08:50:45 +0000
Subject: [Buildroot] [Bug 13416] dhcpcd start warning message: no such user
 dhcpcd
In-Reply-To: <bug-13416-163@https.bugs.busybox.net/>
References: <bug-13416-163@https.bugs.busybox.net/>
Message-ID: <bug-13416-163-0xllfcPnvq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13416

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git:

https://git.buildroot.org/buildroot/commit/?id=9e20f0910902d3f2af2c8fd0b44110d088ebc1e1

And the fix will be included in the upcoming 2020.11.1 release as well, thanks.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
