From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jan 2021 17:36:20 +0000
Subject: [Buildroot] [Bug 13471] package/mpd/mpd.conf make use of path not
 created
In-Reply-To: <bug-13471-163@https.bugs.busybox.net/>
References: <bug-13471-163@https.bugs.busybox.net/>
Message-ID: <bug-13471-163-rQOt5sfpBt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13471

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=d0031c5621e302c659bec13dfcc62b55ac288462,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
