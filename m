From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 10:38:40 +0000 (UTC)
Subject: [Buildroot] [Bug 71] ./wchar.h:41:12: error: empty filename in
	#include
In-Reply-To: <bug-71-163@https.bugs.busybox.net/>
References: <bug-71-163@https.bugs.busybox.net/>
Message-ID: <20090304103840.5511276457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-04 10:38:39 UTC ---
How did you manage to enable BR2_PACKAGE_COREUTILS without enabling
BR2_USE_WCHAR? Coreutils has depended on WCHAR since Summer 2007.

Please enable WCHAR support in your toolchain if you need to use coreutils (or
consider busybox instead). 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
