From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2009 19:55:49 +0000 (UTC)
Subject: [Buildroot] [Bug 71] ./wchar.h:41:12: error: empty filename in
	#include
In-Reply-To: <bug-71-163@https.bugs.busybox.net/>
References: <bug-71-163@https.bugs.busybox.net/>
Message-ID: <20090302195549.DE70F7747D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-02 19:55:49 UTC ---
Sorry, cannot reproduce. What does build_build_arm/coreutils-6.9/lib/config.h
look like? Please post your buildroot .config


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
