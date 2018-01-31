From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Jan 2018 19:16:14 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-JvCcxQibfh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #9 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by bumping ccache to 3.3.5

-- 
You are receiving this mail because:
You are on the CC list for the bug.
