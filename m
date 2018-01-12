From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Jan 2018 18:59:15 +0000
Subject: [Buildroot] [Bug 10216] package/x11r7/mcookie/mcookie.c:207: bad
 size ?
In-Reply-To: <bug-10216-163@https.bugs.busybox.net/>
References: <bug-10216-163@https.bugs.busybox.net/>
Message-ID: <bug-10216-163-NqbGfhz5gc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10216

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=40f4191f2a1246b792ffc0c02b6c9bd2d62649f2,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
