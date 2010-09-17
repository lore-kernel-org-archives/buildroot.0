From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Sep 2010 16:19:38 +0000 (UTC)
Subject: [Buildroot] [Bug 2563] [PATCH] cairo: Expose the configure option
 to disable some floating-point math
In-Reply-To: <bug-2563-163@https.bugs.busybox.net/>
References: <bug-2563-163@https.bugs.busybox.net/>
Message-ID: <20100917161938.5230E8B3CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2563

--- Comment #2 from Paul Burton <Paul.Burton@imgtec.com>  ---
Hmm, that's a very good point! I guess my impression that it had made any
difference was a delusion... It does however seem to be used in current cairo
from git, I haven't checked if it's in any of the newer releases. Probably
worth holding off on this until cairo is updated to some version that uses it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
