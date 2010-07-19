From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Jul 2010 07:04:09 +0000 (UTC)
Subject: [Buildroot] [Bug 1393] neon config fails libxml/parser.h: libxml2
 requires, but not dependent on, libiconv
In-Reply-To: <bug-1393-163@https.bugs.busybox.net/>
References: <bug-1393-163@https.bugs.busybox.net/>
Message-ID: <20100719070409.D425082B45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1393

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Even though I haven't reproduced the particular problem reported by this bug, I
think commit
http://git.buildroot.net/buildroot/commit/?id=4a2dabe9d53e6c361ecdeaba0431ef74a9ad297c
might fix the problem. Don't hesitate to reopen the bug if you can still
reproduce it with the latest Buildroot git.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
