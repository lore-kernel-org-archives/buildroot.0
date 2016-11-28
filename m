From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Nov 2016 18:59:40 +0000
Subject: [Buildroot] [Bug 9451] packatges/postgresql/postgresql.mk contains
 wrong POSTGRESQL_CONF_ENV
In-Reply-To: <bug-9451-163@https.bugs.busybox.net/>
References: <bug-9451-163@https.bugs.busybox.net/>
Message-ID: <bug-9451-163-GMsIkTWfIb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9451

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |ps.report at gmx.net
                   |.org                        |

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Hello Daniel,

thanks for the bug report (and specially for the detailed analysis).

Bug should be fixed (soon) with proposed patch (see [1])...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/700115/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
