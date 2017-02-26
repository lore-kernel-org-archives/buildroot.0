From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 20:19:55 +0000
Subject: [Buildroot] [Bug 9581] VagrantFile provisioning step fails due to
 issue with grub-pc update
In-Reply-To: <bug-9581-163@https.bugs.busybox.net/>
References: <bug-9581-163@https.bugs.busybox.net/>
Message-ID: <bug-9581-163-yqvSOqve45@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9581

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=410082e1d980668385ffd2993920785e0fffd2c1.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
