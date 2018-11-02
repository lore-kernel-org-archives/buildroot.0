From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 09:53:59 +0000
Subject: [Buildroot] [Bug 11346] qt5base-5.11.1 Assertion failed: ret == 0
 after getentropy() inside fillBuffer() on arm
In-Reply-To: <bug-11346-163@https.bugs.busybox.net/>
References: <bug-11346-163@https.bugs.busybox.net/>
Message-ID: <bug-11346-163-rYjE8yubLT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11346

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |ps.report at gmx.net
                   |.org                        |

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Peter, how can we make progress with this issue? To me, it is weird that such
things are not auto-detected. It should be known by looking at the kernel
headers whether the getentropy() system call is supported or not. It shouldn't
be needed to explicitly tell Qt about this.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
