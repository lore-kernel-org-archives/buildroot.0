From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2013 17:15:20 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] -fstack-protector-all causes ssh to SIGSEGV
In-Reply-To: <bug-2995-163@https.bugs.busybox.net/>
References: <bug-2995-163@https.bugs.busybox.net/>
Message-ID: <20131128171520.396B49BE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #8 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-28 17:15:19 UTC ---
I think it's safe to close this bug, i've done testing with stack protection
and openssh and couldn't hit this issue.
Besides it seems to be solved by uclibc 0.9.32+ according to comment #5 and we
don't do 0.9.31 for anything other than avr32 now.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
