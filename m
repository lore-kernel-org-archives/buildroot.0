From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Aug 2018 08:48:53 +0000
Subject: [Buildroot] [Bug 10781] cryptsetup luksOpen container_file
 container causes libdevmapper segfault
In-Reply-To: <bug-10781-163@https.bugs.busybox.net/>
References: <bug-10781-163@https.bugs.busybox.net/>
Message-ID: <bug-10781-163-uClhEFmtRa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10781

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> ---
This has now been fixed by:
https://git.buildroot.org/buildroot/commit/?id=5313c50aa3c1533c32ecf8d04c0628fbbb14f58d

-- 
You are receiving this mail because:
You are on the CC list for the bug.
