From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 18:04:14 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404180414.301427F8E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851


Yann E. MORIN <yann.morin.1998@anciens.enib.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at anciens.enib
                   |                            |.fr




--- Comment #5 from Yann E. MORIN <yann.morin.1998@anciens.enib.fr>  2010-04-04 18:04:13 UTC ---
Grant,

This commit:
http://git.buildroot.org/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee

should fix the case for sysrooted toolchain that were relocated.

Was that the issue you were facing?
If so, does this commit fix it for you?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
