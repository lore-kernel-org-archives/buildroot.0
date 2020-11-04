From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Nov 2020 21:57:13 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-oR1NKIaDqE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #11 from Peter Korsgaard <jacmet@uclibc.org> ---
This has now finally been merged in
https://git.buildroot.org/buildroot/commit/?id=8bafc6dc8ad13000a58af980650ff59a78399ae2,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
