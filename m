From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 16:46:22 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404164622.B7E147FAA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #4 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-04 16:46:22 UTC ---
I think perhaps I've been a bit unclear when writing about "where the
external toolchain was built".  What I mean by that is not the actual
build directory where the toolchain was compiled, but the location
from which it was intended to run when it was built -- the location
where it was put by the "make install" step of the toolchain build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
