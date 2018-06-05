From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Jun 2018 15:38:00 +0000
Subject: [Buildroot] [Bug 11061] support/download: git version=master broken
In-Reply-To: <bug-11061-163@https.bugs.busybox.net/>
References: <bug-11061-163@https.bugs.busybox.net/>
Message-ID: <bug-11061-163-iBlHDuW7zw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11061

Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED
           Assignee|unassigned at buildroot.uclibc |ricardo.martincoski at datacom
                   |.org                        |.ind.br

--- Comment #1 from Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> ---
As stated in the manual, Buildroot does not support it: "Do not use a branch
name as version; it does not work"

If some uses of branch do work it's only by change. It can stop work at any new
release.

For details, see this thread:
http://lists.busybox.net/pipermail/buildroot/2018-May/221279.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
