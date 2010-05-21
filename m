From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 21:23:56 +0000 (UTC)
Subject: [Buildroot] [Bug 1759] qt.mk stops build to prompts user
In-Reply-To: <bug-1759-163@https.bugs.busybox.net/>
References: <bug-1759-163@https.bugs.busybox.net/>
Message-ID: <20100521212356.5149899B75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1759

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
No, menuconfig doesn't allow it. It used to provide the option of the
commercial license, but it got removed by commit
28eefec5bd12072a68035e9f900fe75a3644e946. See
http://git.buildroot.net/buildroot/commit/?id=28eefec5bd12072a68035e9f900fe75a3644e946.

As the bug isn't valid, I'm closing it. If you're interested by the commercial
option, don't hesitate to take the old patch, update it, check that it works,
and submit it again.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
