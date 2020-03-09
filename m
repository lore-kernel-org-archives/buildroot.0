From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Mar 2020 14:55:49 +0000
Subject: [Buildroot] [Bug 12626] PHP missing header files within 2020.02
In-Reply-To: <bug-12626-163@https.bugs.busybox.net/>
References: <bug-12626-163@https.bugs.busybox.net/>
Message-ID: <bug-12626-163-xn7AA2t9Ec@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12626

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |ps.report at gmx.net
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
It is uclibc specific, can be avoided by selection musl or glibc, or by the
suggested patch:

https://patchwork.ozlabs.org/patch/1251588/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
