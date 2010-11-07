From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  7 Nov 2010 18:54:45 +0000 (UTC)
Subject: [Buildroot] [Bug 2737] buildroot configuration tool crashing when
 the path exceeds 128 characters
In-Reply-To: <bug-2737-163@https.bugs.busybox.net/>
References: <bug-2737-163@https.bugs.busybox.net/>
Message-ID: <20101107185445.74E0C8D2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2737

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, fixed in git (ported the similar patch from the kernel)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
