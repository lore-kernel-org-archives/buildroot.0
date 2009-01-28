From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 06:45:25 +0000 (UTC)
Subject: [Buildroot] [Bug 73] Bump openssl package to the latest version
In-Reply-To: <bug-73-163@https.bugs.busybox.net/>
References: <bug-73-163@https.bugs.busybox.net/>
Message-ID: <20090128064525.79E3F769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=73


Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hans-
                   |                            |christian.egtvedt at atmel.com




--- Comment #7 from Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>  2009-01-28 06:45:24 UTC ---
Just leave out AVR32 for now, I think the security stuff is more important.

The openssl.mk needs a little love before AVR32 will work, you have to disable
it selecting an optimization for AVR32 arch.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
