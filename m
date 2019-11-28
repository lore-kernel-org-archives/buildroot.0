From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2019 23:35:29 +0000
Subject: [Buildroot] [Bug 12366] Gstreamer1 gst1-plugins-bad do not compile
 with RPI-Userland
In-Reply-To: <bug-12366-163@https.bugs.busybox.net/>
References: <bug-12366-163@https.bugs.busybox.net/>
Message-ID: <bug-12366-163-1r5WzkCyvi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12366

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |ps.report at gmx.net
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Can confirm the failure, patch suggested:

https://patchwork.ozlabs.org/patch/1202305/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
