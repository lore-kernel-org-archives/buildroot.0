From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Feb 2021 10:50:20 +0000
Subject: [Buildroot] [Bug 13561] Create a new user defining users-table.txt
 not working fine
In-Reply-To: <bug-13561-163@https.bugs.busybox.net/>
References: <bug-13561-163@https.bugs.busybox.net/>
Message-ID: <bug-13561-163-YKAYa2B8cF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13561

Ivan Castell Rovira <al004140@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Ivan Castell Rovira <al004140@gmail.com> ---
It works as expected, just get confused as the output target directory doesn't
contain this user, it seems to be created in a last step. This can be closed.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
