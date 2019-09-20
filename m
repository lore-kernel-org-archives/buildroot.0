From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Sep 2019 15:09:25 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-nEdXI9onKZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |
         Resolution|FIXED                       |---

--- Comment #6 from Carlos Santos <unixmania@gmail.com> ---
(In reply to Thomas Petazzoni from comment #5)

Some people recommend mounting /tmp with nodev, noexec and nosuid options for
security reasons. It is pretty common on FreeBSD but it's not default on Linux
distros.

I will send a patch for check-kernel-headers.sh to fix this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
