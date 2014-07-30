From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Jul 2014 20:03:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7154] Local uClibc config file gets overwritten
 using make uclibc-update-config
In-Reply-To: <bug-7154-163@https.bugs.busybox.net/>
References: <bug-7154-163@https.bugs.busybox.net/>
Message-ID: <20140730200322.C9E679D34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7154

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-07-30 20:03:21 UTC ---
Fixed with commit
http://git.buildroot.org/buildroot/commit/?id=8b8a60cd52c6350e346f9783863d362eeccf82b6

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
