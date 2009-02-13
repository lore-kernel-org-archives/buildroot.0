From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Feb 2009 09:18:45 +0000 (UTC)
Subject: [Buildroot] [Bug 105] menuconfig segfaults on tinyx if wchar is not
	selected
In-Reply-To: <bug-105-163@https.bugs.busybox.net/>
References: <bug-105-163@https.bugs.busybox.net/>
Message-ID: <20090213091845.F128176449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=105


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-13 09:18:44 UTC ---
Workaround committed as r25316


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
